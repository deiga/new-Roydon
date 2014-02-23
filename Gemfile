source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '~> 4.0'

gem 'mongoid', github: 'mongoid/mongoid'
gem 'mongoid-ancestry', github: 'deiga/mongoid-ancestry', branch: 'mongoid4' # tree structure of categories
gem 'mongoid-paperclip', git: 'https://github.com/meskyanichi/mongoid-paperclip.git', :require => 'mongoid_paperclip' # attaching images
gem 'mongo_session_store-rails3' # Mongoid SessionStore

gem 'devise', '~> 3.2' # User control
gem 'devise-i18n'
gem 'rails_admin' # Admin view
gem 'bootstrap-wysihtml5-rails', '~> 0.0' # WYSIWYG for admin view

gem 'unicorn' # Webserver

gem "rack-timeout" # Timeout requests

group :production, :staging do
  gem 'newrelic_rpm' # Statistics
  gem 'dalli', '~> 2.0'
  gem 'memcachier'
end

gem 'nokogiri'
gem 'aws-sdk', '~> 1.0' # Online storage
gem 'kaminari', '~> 0.0' # Pagination
# gem "money"#, "~> 6.0.1.beta3"
gem 'money-rails' # Money objects
gem 'ccsv' # Parsing of CSV
gem 'rack-pjax'
gem 'formtastic'

group :development_remote, :production, :staging do
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

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'compass-rails'
gem 'compass-h5bp'
gem 'yui-compressor'
gem 'haml-rails'
gem 'jquery-rails'
gem 'html5-rails'

if File.exists?('gemfiles/Gemfile.devel') then
  eval File.read('gemfiles/Gemfile.devel'), nil, 'Gemfile.devel' unless ENV['CI']
end
