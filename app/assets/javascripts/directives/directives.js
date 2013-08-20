'use strict';

angular.module('worklistApp',[]).controller('EditCtrl', ['$scope',function($scope){
    $scope.editable = false;
  }]).directive('wlEditable', function(){
  return {
    link: function(scope, element,attrs ){
      var _this = element[0];

      console.log("SCOPE", scope);

      _this.contentEditable = !scope.editable ;

      console.log("Element", _this);
      _this.onclick = toggleEditable;

      function toggleEditable(){
	scope.editable != scope.editable;
      }
    }
  };
});
