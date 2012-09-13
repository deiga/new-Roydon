source :rubygems

ruby '1.9.3'
gem 'rails', '3.1.3'

# Gem for NoSQL DB
gem 'mongoid'
gem 'mongoid_rails_migrations'

# Gem for tree structure of categories
gem 'mongoid-ancestry'

# Admin view
gem 'rails_admin', git: 'git://github.com/sferik/rails_admin.git'

# WYSIWYG for admin view
gem 'bootstrap-wysihtml5-rails'

group :production, :staging do
  # Gem for Webserver
  gem 'thin'
  gem 'newrelic_rpm'
  gem 'dalli'
  gem 'google-analytics-rails'

  # Gem for online storage
  gem 'aws-sdk', '~> 1.3.4'
end

# Gem for attaching images
# gem "paperclip", "~> 3.0"
gem 'mongoid-paperclip', require: 'mongoid_paperclip'

# Gem for reading seed data
gem 'ccsv'

# Gem for pagination
gem 'kaminari'

# Gem for user control
gem 'devise'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'bullet'
  gem 'rails3-generators'
end

group :test do
  gem 'webrat'
  gem 'autotest'
  gem 'autotest-rails-pure'
  gem 'autotest-fsevent'
  gem 'autotest-growl'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'therubyracer', :platform => :ruby
  gem 'factory_girl_rails'
end

# Asset gems
group :assets do
  gem 'sass-rails', '!= 3.1.6'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'compass-h5bp'
  gem 'yui-compressor'
end

gem 'jquery-rails'
gem 'html5-rails'
gem 'haml-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug'
