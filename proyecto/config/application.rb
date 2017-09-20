require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Proyecto
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
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
  :user_name=>            'danieltestrails4@gmail.com',
  :password=>             'Probando',
  :authentication=>       'login',
  enable_starttls_auto: true
}
    
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :delayed_job
  end
end
