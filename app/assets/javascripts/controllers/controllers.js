'use strict';

var app = angular.module('worklistApp',[]);


function EditCtrl($scope){
  $scope.editable = false;
}

EditCtrl.inject = ['$scope'];
// app.controller('EditCtrl', ['$scope',function($scope){
//   $scope.editable = false;
// }]);