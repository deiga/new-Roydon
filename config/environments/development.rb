require File.expand_path('../shared_development', __FILE__)
Roydon::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.static_cache_control = nil

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # A dummy setup for development - no deliveries, but logged
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = { :address => 'localhost', :port => 1025 }

  # # Push NewRelic::Rack::DeveloperMode at the bottom
  # config.middleware.use NewRelic::Rack::DeveloperMode
  #
  # S3 config for paperclip
  #config.paperclip_defaults = {:storage => :s3, :s3_credentials => {access_key_id: ENV['S3_ACCESS'], secret_access_key: ENV['S3_SECRET']}, bucket: "roydon-dev", path: ":attachment/:id/:style.:extension", url: ":s3_domain_url"}
end
