'use strict';

var app = angular.module('worklist',
  ['worklist.directives']);

app.controller('EditCtrl', ['$scope',function($scope){
    $scope.editable = false;
}]);
