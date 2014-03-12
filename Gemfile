source "https://rubygems.org"

# Declare your gem's dependencies in mall.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

gem 'mongoid', github: 'mongoid/mongoid'
gem 'mongoid-paperclip', github: 'meskyanichi/mongoid-paperclip', require: 'mongoid_paperclip' # attaching images
gem 'formtastic'

gem 'devise', '~> 3.2' # User control
gem 'devise-i18n'

gem 'rails_admin' # Admin view
gem 'bootstrap-wysihtml5-rails', '~> 0.0' # WYSIWYG for admin view

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails' # Moved here from :test, https://github.com/thoughtbot/factory_girl_rails/issues/89
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'coveralls', require: false
  gem 'mongoid-rspec'
end
