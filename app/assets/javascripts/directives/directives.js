'use strict';

var directives = angular.module('worklistApp.directives');

directives.directive('wl-editable', function(){
  return {
    link: function(scope, element,attrs ){
      var _this = element[0];

      _this.contentEditable = !$scope.editable;

      _this.on('click', toggleEditable);

      function toggleEditable(){
        $scope.editable != $scope.editable;
      }
    }
  };
});