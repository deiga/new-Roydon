source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '~> 3.2.16'

gem 'mongoid', '~> 3.0' # MongoDB
gem 'mongoid-ancestry', '~> 0.3' # tree structure of categories
gem 'mongoid-paperclip', '~> 0.0', :require => 'mongoid_paperclip' # attaching images
gem 'mongo_session_store-rails3' # Mongoid SessionStore

gem 'devise', '~> 3.1' # User control
gem 'devise-i18n'
gem 'rails_admin' # Admin view
gem 'bootstrap-wysihtml5-rails', '~> 0.3' # WYSIWYG for admin view

gem 'unicorn' # Webserver

gem "rack-timeout" # Timeout requests

group :production, :staging do
  gem 'newrelic_rpm' # Statistics
  gem 'dalli', '~> 2.5'
  gem 'memcachier'
  gem 'rails_12factor' # STDOUT logging and static assets
end

gem 'nokogiri', '< 1.6.0'
gem 'aws-sdk', '~> 1.0' # Online storage
gem 'kaminari', '~> 0.14' # Pagination
gem 'money-rails' # Money objects
gem 'ccsv' # Parsing of CSV
gem 'rack-pjax'
gem 'formtastic'

group :development do
  gem 'bullet'
  gem 'sextant' # see routes at /rails/routes
end

group :development_remote do
  gem 'rails_12factor' # STDOUT logging and static assets
end

group :development, :development_remote do
  gem 'meta_request' # Binding with RailsPanel in chrome
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-plus'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails' # Moved here from :test, https://github.com/thoughtbot/factory_girl_rails/issues/89
  gem 'poltergeist'
  gem 'webrat'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'simplecov', :require => false
  gem 'timecop'
  gem 'coveralls', :require => false
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'compass-h5bp'
  gem 'yui-compressor'
  gem 'haml-rails', "< 0.5"
  gem 'jquery-rails'
  gem 'html5-rails'
end

gem 'strong_parameters' # Emulate Strong parameters for Rails 4

if File.exists?('gemfiles/Gemfile.devel') then
  eval File.read('gemfiles/Gemfile.devel'), nil, 'Gemfile.devel' unless ENV['CI']
end
