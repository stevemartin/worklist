(function(){
  'use strict';

  var app = angular.module('worklist',
    ['ngCookies', 'worklist.directives','worklist.services']);

  app.config(['$routeProvider', function($routeProvider) {
    $routeProvider
    .when('/', {
      controller: 'EditCtrl',
      templateUrl: '/templates/cv.html'
    })
    .otherwise({ redirectTo: '/'});
  }]);

  app.controller('AppCtrl', ['$scope','PreSignup', 'Cookie', function($scope, PreSignup, Cookie){
  }]);

  app.controller('EditCtrl', ['$scope','WorkList', 'PreSignup','Cookie', function( $scope, WorkList, PreSignup, Cookie ){
    $scope.showSignUp = false;
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
          $scope.showSignUp = true;
        });
      } else {
        $scope.worklist.url_key = Cookie.getItem("url_key");
        $scope.worklist.$update();
      }
    };

    $scope.close = function(){
      $scope.showSignUp = $scope.showSignIn = false;

    }

    $scope.showSignUpForm = function(type) {
      $scope.newSignUp = true;
      $scope.showSignUp = true;
      if( type === 'new'){
        $scope.newSignUp = true;
        //bosh the scope.worklist_data object
      }

    };

    $scope.showSignInForm = function(){
      $scope.showSignIn = true;
    }
  }]);

//  app.controller('navbar', ['$scope', function($scope){
    //set the user type to determine which buttons to show
//  }]);

})();
