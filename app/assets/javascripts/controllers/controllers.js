(function(){
  'use strict';

  var app = angular.module('worklist',
    ['worklist.directives','worklist.services']);

  app.controller('AppCtrl', ['$scope','WorkList',function($scope, WorkList){
      $scope.editing = true;
      $scope.saveWorkList = function() {};
  }]);


})();