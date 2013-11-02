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

  app.controller('AppCtrl', ['$scope','PreSignup',function($scope, PreSignup){
  }]);

  app.controller('EditCtrl', ['$scope', '$cookieStore','WorkList', 'PreSignup', function( $scope,$cookieStore, WorkList, PreSignup ){
    $scope.showSignUp = false;
    // $scope.worklist = new PreSignup( window.worklist_data );
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
      console.log("URL: " + url );

      if(typeof url === 'undefined'){

        console.log("New presign up worklist");
        return new PreSignup( window.worklist_data );

      } else {

        console.log("Get existing worklist");
        return WorkList.get({url:url});

      }
    }

    //we're either returning a new resource or a promise (WorkList.get)
    $scope.worklist = determineUrlState();

    $scope.saveWorkList = function() {
      console.log("WL", $scope.worklist)
      console.log("WL", $scope.worklist)
      if(typeof $scope.worklist.user_profile.url === 'undefined'){
        $scope.worklist.$save(function(data){
          console.log("CREATE")
          $cookieStore.put("url", data.user_profile.url);
          $cookieStore.put("url_key", data.user_profile.url_key);
          $scope.showSignUp = true;
        });
      } else {
        console.log("UPDATE")
        $scope.worklist.url_key = $cookieStore.get("url_key");
        $scope.worklist.$update();
      }

    };

    $scope.closeSignUp = function(){
      $scope.showSignUp = false;
    }
  }]);

  app.controller('navbar', ['$scope', function($scope){
    $scope.showOnStart = false;
  }]);

})();
