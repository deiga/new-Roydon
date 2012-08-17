source :rubygems

ruby '1.9.3'
gem 'rails', '3.1.3'

# Gem for NoSQL DB
gem 'mongoid'

# Admin view
gem 'rails_admin'#, :git => 'git://github.com/sferik/rails_admin.git'
# gem 'rails_admin', :git => 'git://github.com/mshibuya/rails_admin.git', :branch => 'mongoid'

# Gem for Webserver
group :production do
  gem 'thin'
  gem 'newrelic_rpm'
  gem 'dalli'
end

group :develpoment, :test, :cucumber do
	gem 'rspec'
  gem 'rspec-rails'
end

group :test do
  gem 'webrat'
  gem 'autotest'
  gem 'autotest-rails-pure'
  gem 'autotest-fsevent'
  gem 'autotest-growl'
end

group :cucumber do
	gem 'capybara'
	gem 'database_cleaner'
	gem 'cucumber-rails'
	gem 'cucumber'
	gem 'spork'
	gem 'launchy'    # So you can do Then show me the page
end
  
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '!= 3.1.6'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug'


gem "devise"
