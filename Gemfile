source :rubygems

ruby '1.9.3'
gem 'rails', '3.1.3'

# Gem for NoSQL DB
gem 'mongoid'
gem 'mongoid_rails_migrations'
# Gem for tree structure of categories
gem 'mongoid-ancestry'

# Admin view
gem 'rails_admin'

group :production, :staging do
  # Gem for Webserver
  gem 'thin'
  gem 'newrelic_rpm'
  gem 'dalli'
  gem 'google-analytics-rails'
end

# Gem for reading seed data
gem 'ccsv'

# Gem for pagination
gem 'kaminari'

# Gem for user control
gem 'devise'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
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
  gem 'factory_girl'
end

# Asset gems
gem 'sass-rails', '!= 3.1.6'
gem 'coffee-rails'
gem 'uglifier'
gem 'yui-compressor'
gem 'jquery-rails'
gem 'haml-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug'
