// Karma configuration
// Generated on Sun Aug 18 2013 20:03:51 GMT+0100 (BST)

module.exports = function(config) {
  config.set({

    // base path, that will be used to resolve files and exclude
    basePath: '',


    // frameworks to use
    frameworks: ['jasmine'],

    plugins: [
      // these plugins will be require() by Karma
      'karma-jasmine',
      'karma-chrome-launcher'
    ],


    // list of files / patterns to load in the browser
    files: [
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-1.2.16/app/assets/javascripts/angular/angular.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-resource-1.2.16/app/assets/javascripts/angular-resource/angular-resource.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-bootstrap-0.10.0/app/assets/javascripts/angular-bootstrap/ui-bootstrap.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-mocks-1.2.16/app/assets/javascripts/angular-mocks/angular-mocks.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-devise-0.3.0/app/assets/javascripts/angular-devise/devise.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-route-1.2.16/app/assets/javascripts/angular-route/angular-route.js',
      './vendor/bundle/ruby/2.1.0/gems/rails-assets-angular-cookies-1.2.16/app/assets/javascripts/angular-cookies/angular-cookies.js',
      './public/assets/**/*.js',
      './spec/javascripts/**/*_spec.js'
    ],


    // list of files to exclude
    exclude: [],


    // test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: ['Chrome'], // , 'Firefox', 'PhantomJS', 'Safari'],


    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,


    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false
  });
};
