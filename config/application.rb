require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myflix
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # added
    config.encoding                                    = 'utf-8'
    config.filter_parameters                          += [:password]
    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
    end
    config.autoload_paths << "#{Rails.root}/lib"
  end
end
