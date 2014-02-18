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
      templateUrl: '/template/job.html',
      link: function(scope, element, attrs){
      }
    };
  });

  directives.directive('educationHistory', function(){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/template/education.html',
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

  directives.directive('signUpForm', ['$http', '$window','PreSignup', function($http, $window, PreSignup){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/template/signup.html',
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
          }).error(function(){
            element.html('<h1>Unable to sign up at this time, try again later</h1>')
          });
        };
      }
    };
  }]);


 directives.directive('signInForm', ['$http', '$window', function($http, $window){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/template/signin.html',
      link:function(scope, element,attrs){

        scope.signIn = function(){
          var sign_in_params = {
            user:{
              email: scope.user.email,
              password: scope.user.password
            }
          }

          $http.post('/users/sign_in', sign_in_params).success( function(){
            scope.signedIn = true;
            scope.showSignIn = false;
            //populate the scope with their data

          });
        };
      }
    };
  }]);
  // directives.directive('addSection', function(){
  //   return {
  //     replace: false,
  //     templateUrl: '/template/add-section.html',
  //     link: function(scope, element, attrs){
  //       console.log( attrs );
  //       // scope.addSection()
  //     }
  //   }
  // });
})();
