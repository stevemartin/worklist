'use strict';

var directives = angular.module('worklist.directives',[]);


directives.directive('wlEditable', function(){
  return {

    link: function(scope, element,attrs ){

      var _this = element[0];
      _this.contentEditable = false;

      element.bind('click', function(event){
	_this.contentEditable = !scope.editable;
      });

      element.bind('blur', function(event){
	_this.contentEditable = false;
      });
    }
  };
});
