(function(){
  'use strict';

  var services = angular.module('worklist.services',['ngResource']);

  services.factory('WorkList', ['$resource', function( $resource ){
    return $resource('/me/:url', {url:'@user_profile.url'},
                     {
                       get:{'method':'GET'},
                       save:{'method':'POST'},
                       update:{'method':'PUT'}
                     }
                    );
  }]);

  services.factory('PreSignup', ['$resource', function( $resource ){
    return $resource('/users/profile',{},
                     {
                       save:{'method':'POST'},
                       update:{'method':'PUT'}
                     }
                    );

  }]);


  services.factory('User', ['$resource', function( $resource){
    return $resource('/users/sign_up');
  }]);
})();
