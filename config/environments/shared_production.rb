Roydon::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Compress JavaScripts and CSS
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += %w( polyfills.js )
  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs.
  config.assets.digest = true

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  client = Dalli::Client.new
  config.action_dispatch.rack_cache = {
    :metastore    => client,
    :entitystore  => client
  }

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store
  config.cache_store = :dalli_store

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # ActionMailer Config
  config.action_mailer.default_url_options = { host: 'roydon.fi' }

  # Setup for production - deliveries, no errors raised
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default charset: "utf-8"

  config.eager_load = true

  # Setup for S3
  config.paperclip_defaults = {storage: :s3, s3_credentials: {access_key_id: ENV['S3_ACCESS'], secret_access_key: ENV['S3_SECRET']}, bucket: "roydon-prod", path: ":attachment/:id/:style.:extension", url: ":s3_domain_url"}
  Paperclip.options[:log] = false

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = false

   # Use default logging formatter so that PID and timestamp are not suppressed.
   config.log_formatter = ::Logger::Formatter.new
end
