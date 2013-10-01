require File.expand_path('../shared_development', __FILE__)
Roydon::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :yui
  config.assets.compile = false
  config.assets.digest = true
  config.assets.precompile += %w( polyfills.js )

  config.whiny_nils = true
  config.log_level = :debug
  config.logger.level = Logger.const_get(
    ENV['LOG_LEVEL'] ? ENV['LOG_LEVEL'].upcase : 'DEBUG'
  )

  config.action_controller.perform_caching = false

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'roydon.fi' }
  # A dummy setup for development - no deliveries, but logged
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"

  # S3 config for paperclip
  config.paperclip_defaults = {:storage => :s3, :s3_credentials => {access_key_id: ENV['S3_ACCESS'], secret_access_key: ENV['S3_SECRET']}, bucket: "roydon-dev", path: ":attachment/:id/:style.:extension", url: ":s3_domain_url"}
  Paperclip.options[:log] = false
end
