'use strict';

var directives = angular.module('worklist.directives',[]);


directives.directive('wlEditable', function(){
  return {
    scope:{
      defaultText: '@'
    },

    link: function(scope, element, attrs ){

      var _this = element[0],
	  editing = false;
      element.addClass('is-editable');
      _this.contentEditable = editing;

      element.bind('click', function(event){
	_this.contentEditable = !editing;
	element.addClass('is-editing');
	scope.$apply(function(){
	  //@TODO: this needs to be less hacky
	  scope.$parent.$parent.editing = true;
	});
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