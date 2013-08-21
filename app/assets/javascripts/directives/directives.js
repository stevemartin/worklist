'use strict';

var directives = angular.module('worklist.directives',[]);


directives.directive('wlEditable', function($rootScope){
  return {
    scope:{
      defaultText: '@'
    },

    link: function(scope, element, attrs ){

      var _this = element[0];
      var editing = false;

      _this.contentEditable = false;

      element.bind('click', function(event){
	_this.contentEditable = !editing;
	element.addClass('is-editing');
      });

      element.bind('blur', function(event){
	_this.contentEditable = false;
	element.removeClass('is-editing');

	if(!element.text().length){
	  element.text( attrs.defaultText );
	}
      });
    }
  };
});