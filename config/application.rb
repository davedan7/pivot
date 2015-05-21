require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"


config.serve_static_assets = true

Bundler.require(*Rails.groups)

module HipsterBytes
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.exceptions_app = routes
    config.action_mailer.perform_deliveries = true
    config.action_mailer.delivery_method = :smtp

    ActionMailer::Base.smtp_settings = {
      user_name: ENV["SENDGRID_USERNAME"],
      password: ENV["SENDGRID_PASSWORD"],
      domain: "hipsterbytes.herokuapp.com",
      address: "smtp.sendgrid.net",
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
    }
  end
end
