require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'
require 'amazon/ecs' # 追記
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sls
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local


    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # lib配下のライブラリを読み込む
    config.autoload_paths += %W(#{config.root}/lib)
    # service配下のライブラリを読み込む
    config.autoload_paths += %W(#{config.root}/app/services)

    Amazon::Ecs.options = {
      associate_tag:     ENV['AMAZON_ASSOCIATE_ID'],
      AWS_access_key_id: ENV['AWS_ACCESS_KEY'],
      AWS_secret_key:    ENV['AWS_SECRET_ACCESS_KEY']
    }
  end
end
