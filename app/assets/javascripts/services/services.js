(function(){
  'use strict';

  var services = angular.module('worklist.services',['ngResource']);

  services.factory('WorkList', ['$resource', function( $resource ){
    return $resource('/users/:user_id/profile',{user_id: '@user_id'});
  }]);

})();
