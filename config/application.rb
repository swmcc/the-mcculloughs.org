require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TheMcculloughs
  class Application < Rails::Application
    config.load_defaults 7.0

    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.assets false
      g.test_framework :rspec, fixture: false
      g.helper_specs false
      g.controller_specs false
      g.system_tests false
      g.view_specs false
    end

    config.to_prepare do
      Devise::SessionsController.layout "auth"
      Devise::RegistrationsController.layout "auth"
      Devise::ConfirmationsController.layout "auth"
      Devise::UnlocksController.layout "auth"
      Devise::PasswordsController.layout "auth"
      Devise::Mailer.layout "mailer"
    end

    config.middleware.use Rack::Deflater

    config.generators.system_tests = nil
  end
end
