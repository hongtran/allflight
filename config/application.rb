require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module Iflight
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.action_mailer.preview_path = "#{Rails.root}/spec/mailers/previews"
    config.action_mailer.asset_host = 'http://iflight.herokuapp.com'
    config.active_job.queue_adapter = :async
    config.to_prepare do
      Devise::Mailer.layout 'mailer'
    end
  end
end
