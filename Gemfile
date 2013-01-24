source :rubygems

ruby '1.9.3'
gem 'rails', '3.2.11'

# Gem for NoSQL DB
gem 'mongoid', '~> 3.0.14'
# Gem for tree structure of categories
gem 'mongoid-ancestry', '~> 0.3.0'
# Gem for attaching images
gem 'mongoid-paperclip', '~> 0.0.8', require: 'mongoid_paperclip'

# Admin view
gem 'rails_admin', '~> 0.3.0'

# WYSIWYG for admin view
gem 'bootstrap-wysihtml5-rails', '~> 0.3.1'

group :production, :staging do
  # Gem for Webserver
  gem 'thin', '~> 1.5.0'
  gem 'newrelic_rpm'
  gem 'dalli', '~> 2.5.0'
  gem 'google-analytics-rails'
end


# Gem for online storage
gem 'aws-sdk', '~> 1.3.4'

# Gem for pagination
gem 'kaminari', '~> 0.14.1'

# Gem for user control
gem 'devise', '~> 2.1.2'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rails3-generators'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
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
  gem 'libv8', '~> 3.11.8'
  gem 'factory_girl_rails'
end

# Asset gems
group :assets do
  gem 'sass-rails', '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.3.0'
  gem 'compass-rails', '~> 1.0.3'
  gem 'compass-h5bp', '~> 0.1.0'
  gem 'yui-compressor'
end

gem 'jquery-rails', '~> 2.1.4'
gem 'html5-rails', '~> 0.0.6'
gem 'haml-rails', '~> 0.3.5'

gem 'money-rails', '~> 0.7.0'

# For seeds
gem 'ccsv'

# To use debugger
# gem 'ruby-debug'

# Strong parameters for Rails 4
gem 'strong_parameters'
