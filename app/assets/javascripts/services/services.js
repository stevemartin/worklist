(function(){
  'use strict';

  var services = angular.module('worklist.services',['ngResource']);

  services.factory('MyWorkList', ['$resource', function( $resource ){
      return $resource('/me/:url',{},
                       {
                            get:{'method':'GET'},
                           save:{'method':'POST'},
                         update:{'method':'PUT'}
                       }
                       );
  }]);

  services.factory('WorkList', ['$resource', function( $resource ){
    // return $resource('/users/create_profile');
      return $resource('/users/profile',{},
                       {save:{'method':'POST', callback:'setUrlCookie'},
                       update:{'method':'PUT', callback:'setUrlCookie'}}
                       );

  }]);


  services.factory('User', ['$resource', function( $resource){
    return $resource('/users/sign_up');
  }]);
})();
