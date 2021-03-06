require File.expand_path('../boot', __FILE__)
#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'rubygems'
require 'csv'
require 'rails/all'

require 'iconv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Proyecto
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.i18n.default_locale = :es

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.to_prepare do
    Devise::SessionsController.layout "devise.html.erb"
    Devise::RegistrationsController.layout "devise.html.erb"
    Devise::ConfirmationsController.layout "devise.html.erb"
    Devise::UnlocksController.layout "devise.html.erb"
    Devise::PasswordsController.layout "devise.html.erb"
end
    ActionMailer::Base.smtp_settings = {
  :address =>             'smtp.gmail.com',
  :domain  =>             'mail.google.com',
  :port    =>              587,
  :user_name=>            'gerencia.elemetrica@gmail.com',
  :password=>             'elemetrica16',
  :authentication=>       'login',
  enable_starttls_auto: true
}
    
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :delayed_job
  end
end
