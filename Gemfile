source 'https://rubygems.org'
source 'https://rails-assets.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1'
gem 'unicorn'
# Use sqlite3 as the database for Active Record

gem 'pg'

gem 'wkhtmltopdf-heroku'
gem 'rails_12factor', group: :production
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'devise'

gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'

gem 'bootstrap-glyphicons'

gem 'webpacker', '~> 3.0'

gem 'wicked_pdf'

# Bower assets
gem 'rails-assets-jquery'
gem 'rails-assets-jquery-ui'
gem 'rails-assets-bootstrap'
gem 'rails-assets-angular'
gem 'rails-assets-angular-route'
gem 'rails-assets-angular-bootstrap'
gem 'rails-assets-angular-cookies'
gem 'rails-assets-angular-devise'
gem 'rails-assets-angular-resource'
gem 'rails-assets-angular-ui-bootstrap'
gem 'rails-assets-angular-ui-sortable'
gem 'rails-assets-angular-mocks'

# Templating
gem 'haml'
gem 'rails-controller-testing'

group :test, :development do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'zeus'
  gem 'pry'
end

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails'
  # gem 'guard'
  # gem 'guard-rspec'
  # gem 'guard-cucumber'
  gem 'database_cleaner', '< 1.1.0'
  # gem 'capybara-webkit'
  gem 'selenium-webdriver'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'listen'
  gem 'spring',        group: :development
  gem 'capistrano', '~> 3.9'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-rbenv-install'
  gem 'capistrano-rails', github: 'capistrano/rails'
  gem 'capistrano-yarn'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'meta_request'
  gem 'rubocop'
end
