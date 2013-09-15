(function(){
  'use strict';

  var app = angular.module('worklist',
    ['worklist.directives','worklist.services']);

  app.controller('EditCtrl', ['$scope','WorkList',function($scope, WorkList){
      $scope.editing = false;

      $scope.workList = new WorkList();

      $scope.saveWorkList = function() {
	$scope.workList.$save();
      };
  }]);

})();