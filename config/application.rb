require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Instasheet
  class Application < Rails::Application
    
    config.autoload_paths += %W(#{Rails.root}/lib)
    
    # JavaScript files you want as :defaults (application.js is always included).
    config.action_view.javascript_expansions[:defaults] = %w(libs/modernizr libs/jquery libs/rails)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    
    config.action_mailer.default_url_options = { :host => 'instasheet.phenotypic.co.uk' }
    
  end
end
