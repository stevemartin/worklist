(function(){
  'use strict';

  var services = angular.module('worklist.services',['ngResource']);

  services.factory('WorkList', ['$resource', function( $resource, type ){
    // return $resource('/users/create_profile');
    if( type == 'init' ) {
      return $resource('/users/profile',{},
                       {save:{'method':'POST'},
                       update:{'method':'PUT'}}
                       );
    } else if( type == 'url' ) {
      return $resource('/me/:url',{},
                       {
                            get:{'method':'GET'},
                           save:{'method':'POST'},
                         update:{'method':'PUT'}
                       }
                       );
    }
  }]);


  services.factory('User', ['$resource', function( $resource){
    return $resource('/users/sign_up');
  }]);
})();
