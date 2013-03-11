source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.12'

gem 'mongoid', '~> 3.0' # MongoDB
gem 'mongoid-ancestry', '~> 0.3' # tree structure of categories
gem 'mongoid-paperclip', '~> 0.0', :require => 'mongoid_paperclip' # attaching images

gem 'devise', '~> 2.2' # User control
gem 'rails_admin' # Admin view
gem 'bootstrap-wysihtml5-rails', '~> 0.3' # WYSIWYG for admin view

gem 'unicorn' # Webserver

gem "rack-timeout" # Timeout requests

group :production, :staging do
  gem 'newrelic_rpm' # Statistics
  gem 'dalli', '~> 2.5.0'
end

gem 'aws-sdk', '~> 1.8' # Online storage
gem 'kaminari', '~> 0.14' # Pagination
gem 'money-rails' # Money objects
gem 'ccsv' # Parsing of CSV
gem 'rack-pjax'

group :development do
  gem 'hooves', :require => 'hooves/default'
  gem 'bullet'
  gem 'sextant' # see routes at /rails/routes
  gem 'wirble'
end

group :development, :development_remote do
  gem 'meta_request' # Binding with RailsPanel in chrome
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test, :development_remote do
  gem 'rspec-rails'
  gem 'factory_girl_rails' # Moved here from :test, https://github.com/thoughtbot/factory_girl_rails/issues/89
end

group :test do
  gem 'webrat'
  gem 'autotest-standalone'
  gem 'autotest-rails-pure'
  gem 'autotest-fsevent'
  gem 'autotest-growl'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  # gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'simplecov', :require => false
  gem 'timecop'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'compass-h5bp'
  gem 'yui-compressor'
  gem 'haml-rails'
  gem 'jquery-rails'
  gem 'html5-rails'
end

gem 'strong_parameters' # Emulate Strong parameters for Rails 4
