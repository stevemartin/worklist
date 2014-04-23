(function(){
  'use strict';

  var app = angular.module('worklist',
    ['Devise', 'ngRoute', 'ngCookies', 'worklist.directives','worklist.services','ui.bootstrap.modal','ui.bootstrap.popover']);

  app.config(['$routeProvider', function($routeProvider) {
    $routeProvider
    .when('/', {
      controller: 'EditCtrl',
      templateUrl: '/template/cv.html'
    })
    .otherwise({ redirectTo: '/'});
  }]);

  app.controller('EditCtrl', ['$q','Auth','$scope','WorkList','WorkListLinker','$modal','PreAuth','Cookie','User','$window', function($q, Auth, $scope, WorkList, WorkListLinker, $modal, PreAuth, Cookie, User, $window ){
    $scope.showSignUp = false;
    $scope.showSignIn = false;
    $scope.showSignOut = false;

    $scope.addSection = function( section ){
      //get the first object
      var sectionArr = $scope.worklist[section + 's_attributes'],
          sectionObj = angular.copy( sectionArr[0] );

      sectionArr.push( sectionObj );
    };

    $scope.removeSection = function(section, index){
      var sectionArr = $scope.worklist[section + 's_attributes'];
        sectionArr.splice( index, 1 );
    };

    function worklistSignature() {
      return {url: Cookie.getItem("url"), url_key: Cookie.getItem("url_key")};
    }

    function fetchWorklist() {
      var url = Cookie.getItem("url");
      var deferred = $q.defer();
      var worklist = null;


      $scope.$on('devise:unauthorized', function(event, xhr, deferred) {
        if(typeof url === 'undefined' || url === null ){
          $scope.worklist = new PreAuth( window.worklist_data );
        } else {
          $scope.worklist = new PreAuth.get(worklistSignature());
        }
      });

      Auth.currentUser().then(function(user){
        $scope.showSignOut = true;
        $scope.worklist = new WorkList.get({url:url});
      });

    }

    //we're either returning a new resource or a promise (WorkList.get)
    fetchWorklist();

    $scope.saveWorkList = function() {

      if(typeof $scope.worklist.worklist.url === 'undefined'){
        $scope.worklist.$save(function(data){
          $scope.showSignUpForm();
        });
      } else {
        $scope.worklist.$update(worklistSignature());
      }
    };


    $scope.signUp = function signUp() {
      //
      $scope.user.password_confirmation = $scope.user.password;
      var user = new User({user:$scope.user});
      Auth.register($scope.user).then(function(registeredUser){
        $scope.linker = new WorkListLinker(worklistSignature());
        $scope.linker.$link(worklistSignature());
        $scope.signUpModal.close();
        $scope.showSignOut = true;
      }, function(errors){
        $scope.sigupErrors = errors.data.errors;
      });
    }

    $scope.close = function close(){
      $scope.showSignUp = $scope.showSignIn = false;
    }

    $scope.removeJobSkill = function removeSkill(jobIndex,index){
      $scope.worklist.worklist.jobs_attributes[jobIndex].skills_attributes.splice(index,1);
    };

    $scope.addJobSkill = function addJobSkill(jobIndex){
      $scope.worklist.worklist.jobs_attributes[jobIndex].skills_attributes.push({});
    }

    $scope.addKeySkill = function addSkill(){
      $scope.worklist.worklist.skills_attributes.push({});
    }

    $scope.removeKeySkill = function remove(index){
      $scope.worklist.worklist.skills_attributes.splice(index,1);
    }

    $scope.actuallyDelete = function deleteWL(){
      //remove the cookie
      Cookie.removeItem('url');
      Cookie.removeItem('url_key');
      //delete
      $scope.worklist.$delete(function(){
        //reload the page
        $window.location = '/';
      });

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

      $scope.signUpModal.result.then(function(){}, function(){
        $window.location = '/';
      })

    };

    $scope.signOut = function signOut(){
      Auth.logout().then(function(oldUser) {
        $scope.showSignOut = false;
      }, function(error) {
      });
    }

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
