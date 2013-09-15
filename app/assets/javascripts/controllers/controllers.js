(function(){
  'use strict';

  var app = angular.module('worklist',
    ['worklist.directives','worklist.services']);

  app.controller('EditCtrl', ['$scope','WorkList',function($scope, WorkList){
      $scope.editing = true;

      $scope.saveWorkList = function() {
	console.log($scope.worklist);
	//$scope.workList.$save();
      };
  }]);

})();