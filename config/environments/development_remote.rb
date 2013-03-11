Roydon::Application.configure do
  config.cache_classes = false

  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=2592000"

  config.assets.compress = false
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :yui
  config.assets.compile = false
  config.assets.digest = true
  config.assets.precompile += %w( polyfills.js )
  config.assets.debug = true

  config.whiny_nils = true
  config.log_level = :debug
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger.const_get(
    ENV['LOG_LEVEL'] ? ENV['LOG_LEVEL'].upcase : 'DEBUG'
  )

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'roydon.fi' }
  # A dummy setup for development - no deliveries, but logged
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # S3 config for paperclip
  config.paperclip_defaults = {:storage => :s3, :s3_credentials => {access_key_id: ENV['S3_ACCESS'], secret_access_key: ENV['S3_SECRET']}, bucket: "roydon-dev", path: ":attachment/:id/:style.:extension", url: ":s3_domain_url"}
end
