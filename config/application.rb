require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Comirepo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators.template_engine = :slim

    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local
    config.encoding = 'utf-8'

    config.active_job.queue_adapter = :sidekiq

    if defined?(AwsSsmEnv) && ENV['DOCKER_BUILD'] != 1
      AwsSsmEnv.load(
        path: "/#{ENV['RAILS_ENV']}/comeel",
        ssm_client_args: {
          access_key_id: ENV['AWS_ACCESS'],
          secret_access_key: ENV['AWS_SECRET'],
          region: 'ap-northeast-1',
        },
        overwrite: true
      )
    end
  end
end
