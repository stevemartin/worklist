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

  app.controller('EditCtrl', ['$scope', '$cookieStore', 'MyWorkList', 'WorkList',function($scope, $cookieStore, MyWorkList, WorkList){

    // $scope.worklist = new WorkList( window.worklist_data );

    var determineUrlState = function() {
      var url = $cookieStore.get("url")

      console.log( "CookieUrl: " + url )

      if(typeof url === 'undefined'){

        if( typeof window.worklist_data.user_profile.url !== 'undefined'){

          console.log( "Setting Url Cookie: " + url )
          $cookieStore.put("url", window.worklist_data.user_profile.url)
          return $scope.worklist;

        } else {

          console.log( "Getting default worklist: " + url )
          return new WorkList( window.worklist_data );

        }
      } else {

          console.log( "Getting MY worklist: " + url )
        return MyWorkList.get({url:url});

      }
    }
    $scope.worklist = determineUrlState();

    console.log( $scope.worklist );
    $scope.saveWorkList = function() {
      if(typeof $scope.worklist.user_id === 'undefined'){
        $scope.worklist.$save(function(data){
          $cookieStore.put("url", data.user_profile.url)
        });
      } else {
        $scope.worklist.$update(function(data){
          $cookieStore.put("url", data.user_profile.url)
        });
      }

    };
  }]);

})();
