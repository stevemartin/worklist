'use strict';

var app = angular.module('worklistApp',['worklistApp.directives']);

app.controller('edit_controller',['$scope', function($scope){
  $scope.editable = false;
}]);