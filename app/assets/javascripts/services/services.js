(function(){
  'use strict';

  var services = angular.module('worklist.services',['ngResource', 'ng-rails-csrf']);

  services.factory('WorkList', ['$resource', function( $resource ){
    return $resource('/worklists.json', {url: '@worklist_data.url'},
                     {
                       get:{'method':'GET', headers: {'Content-Type': 'application/json'}},
                       link:{'method':'POST', headers: {'Content-Type': 'application/json'}},
                       save:{'method':'POST', headers: {'Content-Type': 'application/json'}},
                       update:{'method':'PUT', headers: {'Content-Type': 'application/json'}},
                       delete:{method: 'DELETE', headers: {'Content-Type': 'application/json'}}
                     }
                    );
  }]);

  services.factory('WorkListLinker', ['$resource', function( $resource ){
    return $resource('/link_worklist/:url/:url_key/.json', {url:'@worklist_data.url', url_key:'@worklist_data.url_key'},
                     {
                       link:{'method':'POST', headers: {'Content-Type': 'application/json'}}
                     }
                    );
  }]);
  services.factory('PreAuth', ['$resource', function( $resource ){
    return $resource('/pre_auth/:url/:url_key/.json', {url:'@worklist_data.url', url_key:'@worklist_data.url_key'},
                     {
                       get:{'method':'GET', headers: {'Content-Type': 'application/json'}},
                       save:{'method':'POST', headers: {'Content-Type': 'application/json'}},
                       update:{'method':'PUT', headers: {'Content-Type': 'application/json'}},
                       delete:{method: 'DELETE', headers: {'Content-Type': 'application/json'}}
                     }
                    );

  }]);


  services.factory('User', ['$resource', function( $resource){
    return $resource('/users');
  }]);

  services.factory('Cookie', function(){
    var defaultExp = 60 * 60 * 24 *30;

    return {
      getItem: function (sKey) {
        return decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + encodeURIComponent(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
      },
      setItem: function (sKey, sValue, vEnd, sPath, sDomain, bSecure) {
        if (!sKey || /^(?:expires|max\-age|path|domain|secure)$/i.test(sKey)) { return false; }
        var sExpires = "";
        if (vEnd) {
          switch (vEnd.constructor) {
            case Number:
              sExpires = vEnd === Infinity ? "; expires=Fri, 31 Dec 9999 23:59:59 GMT" : "; max-age=" + vEnd;
              break;
            case String:
              sExpires = "; expires=" + vEnd;
              break;
            case Date:
              sExpires = "; expires=" + vEnd.toUTCString();
              break;
          }
        }
        document.cookie = encodeURIComponent(sKey) + "=" + encodeURIComponent(sValue) + sExpires + (sDomain ? "; domain=" + sDomain : "") + (sPath ? "; path=" + sPath : "") + (bSecure ? "; secure" : "");
        return true;
      },


      removeItem: function (sKey, sPath, sDomain) {
        if (!sKey || !this.hasItem(sKey)) { return false; }
        document.cookie = encodeURIComponent(sKey) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + ( sDomain ? "; domain=" + sDomain : "") + ( sPath ? "; path=" + sPath : "");
        return true;
      },
      hasItem: function (sKey) {
        return (new RegExp("(?:^|;\\s*)" + encodeURIComponent(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=")).test(document.cookie);
      },
      keys: /* optional method: you can safely remove it! */ function () {
        var aKeys = document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g, "").split(/\s*(?:\=[^;]*)?;\s*/);
        for (var nIdx = 0; nIdx < aKeys.length; nIdx++) { aKeys[nIdx] = decodeURIComponent(aKeys[nIdx]); }
        return aKeys;
      },
      defaultExpiry: defaultExp
    };
  });


})();
