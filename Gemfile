source :rubygems

ruby '1.9.3'
gem 'rails', '3.2.11'

gem 'mongoid', '~> 3.0' # MongoDB
gem 'mongoid-ancestry', '~> 0.3' # tree structure of categories
gem 'mongoid-paperclip', '~> 0.0', require: 'mongoid_paperclip' # attaching images

gem 'rails_admin' # Admin view

gem 'bootstrap-wysihtml5-rails', '~> 0.3' # WYSIWYG for admin view

group :production, :staging do
  gem 'thin', '~> 1.5.0' # Webserver
  gem 'newrelic_rpm' # Statistics
  gem 'dalli', '~> 2.5.0'
  gem 'google-analytics-rails'
end

gem 'aws-sdk', '~> 1.8' # Online storage

gem 'kaminari', '~> 0.14' # Pagination

gem 'devise', '~> 2.2' # User control

group :development, :test do
  gem 'rspec', '> 2.1'
  gem 'rspec-rails'
  gem 'rails3-generators'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request' # Binding with RailsPanel in chrome
  gem 'bullet'
  gem 'sextant' # see routes at /rails/routes
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
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'therubyracer', :platform => :ruby
  gem 'factory_girl_rails'
end

group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '~> 1.3'
  gem 'compass-rails', '~> 1.0'
  gem 'compass-h5bp', '~> 0.1'
  gem 'yui-compressor'
end

gem 'jquery-rails', '~> 2.2'
gem 'html5-rails', '~> 0.0'
gem 'haml-rails', '~> 0.3'

gem 'money-rails', '~> 0.7'

gem 'ccsv' # Parsing of CSV

# To use debugger
# gem 'ruby-debug'

gem 'strong_parameters' # Emulate Strong parameters for Rails 4
