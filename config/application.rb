require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Maze3
  class Application < Rails::Application
    config.load_defaults 8.0

    # config.api_only = true  # ✅ Add this line to make Rails work as an API

  config.autoload_lib(ignore: %w[assets tasks])

   end
end
