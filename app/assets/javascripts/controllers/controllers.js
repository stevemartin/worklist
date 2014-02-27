(function(){
  'use strict';

  var app = angular.module('worklist',
    ['ngCookies', 'worklist.directives','worklist.services','ui.bootstrap.modal','ui.bootstrap.popover']);

  app.config(['$routeProvider', function($routeProvider) {
    $routeProvider
    .when('/', {
      controller: 'EditCtrl',
      templateUrl: '/template/cv.html'
    })
    .otherwise({ redirectTo: '/'});
  }]);

  app.controller('AppCtrl', ['$scope','PreSignup', 'Cookie', function($scope, PreSignup, Cookie){
  }]);

  app.controller('EditCtrl', ['$scope','WorkList', '$modal','PreSignup','Cookie', 'User', function( $scope, WorkList, $modal, PreSignup, Cookie, User ){
    $scope.showSignUp = false;
    $scope.showSignIn = false;

    // $scope.worklist = new PreSignup( window.worklist_data );
    $scope.addSection = function( section ){
      //get the first object
      var sectionArr = $scope.worklist.user_profile[section + 's_attributes'],
          sectionObj = angular.copy( sectionArr[0] );

      sectionArr.push( sectionObj );
    };

    $scope.removeSection = function(section, index){
      var sectionArr = $scope.worklist.user_profile[section + 's_attributes'];
        sectionArr.splice( index, 1 );
    };

    function determineUrlState() {
      var url = Cookie.getItem("url");

      if(typeof url === 'undefined' || url === null ){
        return new PreSignup( window.worklist_data );

      } else {
        return WorkList.get({url:url});
      }
    }

    //we're either returning a new resource or a promise (WorkList.get)
    $scope.worklist = determineUrlState();

    $scope.saveWorkList = function() {

      if(typeof $scope.worklist.user_profile.url === 'undefined'){
        $scope.worklist.$save(function(data){
          Cookie.setItem('url',data.user_profile.url, Cookie.defaultExpiry, '/');
          Cookie.setItem('url_key',data.user_profile.url_key, Cookie.defaultExpiry, '/' );
          $scope.showSignUpForm();
        });
      } else {
        $scope.worklist.url_key = Cookie.getItem("url_key");
        $scope.worklist.$update();
      }
    };

    $scope.signUp = function signUp() {
      //
      $scope.user.password_confirmation = $scope.user.password;
      var user = new User({user:$scope.user});
      user.$save(function signupSuccess(){
        $scope.signUpModal.close();
      }, function(response){
        $scope.sigupErrors = response.data.errors;
      });
    }

    $scope.close = function(){
      $scope.showSignUp = $scope.showSignIn = false;
    }

    $scope.removeJobSkill = function removeSkill(jobIndex,index){
      $scope.worklist.user_profile.jobs_attributes[jobIndex].skills_attributes.splice(index,1);
    };

    $scope.addJobSkill = function addJobSkill(jobIndex){
      $scope.worklist.user_profile.jobs_attributes[jobIndex].skills_attributes.push({});
    }

    $scope.addKeySkill = function addSkill(){
      $scope.worklist.user_profile.skills_attributes.push({});
    }

    $scope.removeKeySkill = function remove(index){
      $scope.worklist.user_profile.skills_attributes.splice(index,1);
    }

    $scope.actuallyDelete = function deleteWL(){
      //remove the cookie
      Cookie.removeItem('url');
      Cookie.removeItem('url_key');
      //delete
      $scope.worklist.$delete();
      //reload the page
      $window.location = '/';
    }

    $scope.deleteWorkList = function deleteWorklist(){
      $modal.open({
        scope: $scope,
        templateUrl: '/template/delete.html',
        controller: function signupModalCtrl($scope, $modalInstance){
          $scope.closeModal = function close(){
            $modalInstance.dismiss('cancel');
          },

          $scope.doDelete = function(){
            $modalInstance.dismiss('cancel');
            $scope.actuallyDelete();
          }
        }
      });
    };

    $scope.showSignUpForm = function(type) {
      $scope.signUpModal = $modal.open({
        templateUrl: '/template/signup.html',
        scope: $scope,
        controller: function signupModalCtrl($scope, $modalInstance){
          $scope.closeModal = function close(){
            $modalInstance.dismiss('cancel');
          }
        }
      });

      modalInstance.result.then(function(){}, function(){
        $window.location = '/';
      })

    };

    $scope.showSignInForm = function(){
      $scope.showSignIn = true;
      $modal.open({
        templateUrl: '/template/signin.html',
        controller: function signinModalCtrl($scope, $modalInstance){
          $scope.closeModal = function close(){
            $modalInstance.dismiss('cancel');
          }
        }
      });
    }
  }]);
})();
