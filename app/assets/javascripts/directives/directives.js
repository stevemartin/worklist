(function(){
  'use strict';

  var directives = angular.module('worklist.directives',[]);

  directives.directive('wlEditable', function(){
    return {
      scope:{
        defaultText: '@'
      },

      link: function(scope, element, attrs){
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

  directives.directive('jobHistory', function(){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/templates/job.html',
      link: function(scope, element, attrs){
      }
    };
  });

  directives.directive('educationHistory', function(){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/templates/education.html',
      link: function(scope, element, attrs){
      }
    };
  });


  directives.directive('backdrop', function(){
    return {
      controller: function($scope){

      },
      link: function(scope, element,attrs) {
        element.bind('click', function(){
          element.addClass('is-hidden');
        });
      }
    };
  });

  directives.directive('signUpForm', ['$http', function($http){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/templates/signup.html',
      link:function(scope, element,attrs){
        scope.signUp = function(){
          element.html('<h1>Submitting your details</h1>');
          var sign_up_params = {
            user:{
              email: scope.worklist.user_profile.email,
              password: scope.worklist.user_profile.password,
              password_confirmation: scope.confirm
            }
          }

          $http.post('/users', sign_up_params).success( function(){
            scope.showSignUp = false;
          });
        };
      }
    };
  }]);

  // directives.directive('addSection', function(){
  //   return {
  //     replace: false,
  //     templateUrl: '/templates/add-section.html',
  //     link: function(scope, element, attrs){
  //       console.log( attrs );
  //       // scope.addSection()
  //     }
  //   }
  // });
})();
