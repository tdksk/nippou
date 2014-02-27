require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Nippou
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.encoding = "utf-8"

    config.generators do |g|
      g.template_engine :slim
      g.assets false
      g.helper false
    end

    config.autoload_paths += %W(#{config.root}/lib)
  end
end
