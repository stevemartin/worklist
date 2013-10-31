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

  app.controller('AppCtrl', ['$scope','WorkList',function($scope, WorkList){
  }]);

  app.controller('EditCtrl', ['$scope', '$cookieStore','MyWorkList', 'WorkList', function( $scope,$cookieStore, MyWorkList, WorkList ){
    $scope.showSignUp = false;
    // $scope.worklist = new WorkList( window.worklist_data );
    $scope.addSection = function( section ){
      //get the first object
      var sectionArr = $scope.worklist.user_profile[section + 's_attributes'],
          sectionObj = angular.copy( sectionArr[0]);

      sectionArr.push( sectionObj );
    };

    $scope.removeSection = function(section, index){
      var sectionArr = $scope.worklist.user_profile[section + 's_attributes'];
        sectionArr.splice( index, 1 );
    };

    function determineUrlState() {
      var url = $cookieStore.get("url");

      if(typeof url === 'undefined'){

        if( typeof window.worklist_data.user_profile.url !== 'undefined'){
          $cookieStore.put("url", window.worklist_data.user_profile.url);
          return $scope.worklist;
        } else {
          return new WorkList( window.worklist_data );
        }
      } else {
        return MyWorkList.get({url:url});
      }
    }

    //we're either returning a new resource or a promise (MyWorkList.get)
    $scope.worklist = determineUrlState();

    $scope.saveWorkList = function() {
      if(typeof $scope.worklist.user_id === 'undefined'){
        $scope.worklist.$save(function(data){
          $cookieStore.put("url", data.user_profile.url);
          $scope.showSignUp = true;
        });
      } else {
        $scope.worklist.$update();
      }

    };

    $scope.closeSignUp = function(){
      $scope.showSignUp = false;
    }
  }]);

})();
