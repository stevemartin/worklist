(function(){
  'use strict';

  var services = angular.module('worklist.services',['ngResource']);

  services.factory('WorkList', ['$resource', function( $resource ){
    return $resource('/worklist/:id',{id: '@id'});
  }]);

})();
