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
    $scope.worklist = new WorkList( window.worklist_data );
    console.log( $scope.worklist );
    $scope.saveWorkList = function() {
      $scope.worklist.$save();
    };
  }]);

})();