// Karma E2E configuration

module.exports = function(config){
  config.set({
    // base path, that will be used to resolve files and exclude
    basePath : '',

    frameworks : ["ng-scenario", "jasmine"],
    // list of files / patterns to load in the browser
    files : [
      // 'vendor/assets/javascripts/angular-1.0.7/*.min.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-1.2.16/app/assets/javascripts/angular/angular.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-resource-1.2.16/app/assets/javascripts/angular-resource/angular-resource.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-bootstrap-0.10.0/app/assets/javascripts/angular-bootstrap/ui-bootstrap.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-mocks-1.2.16/app/assets/javascripts/angular-mocks/angular-mocks.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-devise-0.3.0/app/assets/javascripts/angular-devise/devise.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-route-1.2.16/app/assets/javascripts/angular-route/angular-route.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-cookies-1.2.16/app/assets/javascripts/angular-cookies/angular-cookies.js',
      'public/assets/**/*.js',
      'spec/javascripts/e2e/**/*_spec.js'
    ],

    proxies : {
      '/': 'http://0.0.0.0:8080/spec/javascripts/e2e/'
    },

    urlRoot : '/_karma_/',
    // list of files to exclude
    exclude : [],

    // test results reporter to use
    // possible values: dots || progress || growl
    reporters : ['dots'],

    // web server port
    port : 8080,

    // cli runner port
    runnerPort : 8080,

    // enable / disable colors in the output (reporters and logs)
    colors : true,

    // level of logging
    // possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    // logLevel = LOG_INFO;

    // enable / disable watching file and executing tests whenever any file changes
    autoWatch : true,

    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    // browsers : ['Chrome'],

    // If browser does not capture in given timeout [ms], kill it
    captureTimeout : 5000,

    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun : false,

  });

}
