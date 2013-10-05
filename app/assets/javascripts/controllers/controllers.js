(function(){
  'use strict';

  var app = angular.module('worklist',
    ['worklist.directives','worklist.services']);

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

  app.controller('EditCtrl', ['$scope', 'WorkList',function($scope, WorkList){

    var determineUrlState = function() {
      var url = $scope.worklist.url
      if(typeof url === 'undefined'){
        $scope.worklist = new WorkList( window.worklist_data );
      } else {
        $scope.worklist = retrieveWorklist( url );
      }
    }

    console.log( $scope.worklist );
    $scope.saveWorkList = function() {
      if(typeof $scope.worklist.user_id === 'undefined'){
        $scope.worklist.$save();
      } else {
        $scope.worklist.$update();
      }

    };
  }]);

})();
