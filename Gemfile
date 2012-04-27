source :rubygems

gem 'rails', '3.1.3'

# Gem for NoSQL DB
gem "mongoid", "~> 2.4"
gem "bson_ext", "~> 1.5"
gem "mongoid_rails_migrations"

# Admin view
#gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'rails_admin', :git => 'git://github.com/mshibuya/rails_admin.git', :branch => 'mongoid'

# Gem for Webserver
gem 'thin'

# Gem for reading seed data
gem 'ccsv'

# Gem for pagination
gem 'kaminari'

# Gem for tree structure of categories
gem 'mongoid-ancestry'

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
end
  
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '= 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug'


gem "devise"
