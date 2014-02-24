require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

load(File.expand_path('../heroku_env.rb', __FILE__))

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Roydon
  class Application < Rails::Application

    # Use jquery-pjax
    config.middleware.use Rack::Pjax

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Code is not reloaded between requests
    config.cache_classes = true

    config.static_cache_control = "public, max-age=31536000"

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Helsinki'

    I18n.config.enforce_available_locales = true
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.default_locale = :fi
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.assets.initialize_on_precompile = false

    config.generators do |g|
      g.hidden_namespaces << :test_unit << :erb << :active_record
      g.template_engine :haml
      g.test_framework :rspec, :fixture => true, :views => false, :fixture_replacement => :factory_girl, :view_specs => false
      g.view_specs false
      g.helper_specs false
      g.helper false
    end

    # Prepend all log lines with the following tags.
    # config.log_tags = [ :subdomain, :uuid ]

    config.exceptions_app = self.routes
    # 404 catcher
    config.after_initialize do |app|
      app.routes.append{ match '*a', :to => 'errors#no_route' } unless config.consider_all_requests_local
    end
  end

end
