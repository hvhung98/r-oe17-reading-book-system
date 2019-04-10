require_relative "boot"
<<<<<<< HEAD
=======

>>>>>>> cbb8985f37cb571bba4536b814d193f5f6722788
require "rails/all"

Bundler.require(*Rails.groups)

<<<<<<< HEAD
module Project1Demo
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.i18n.available_locales = [:en]
    config.i18n.default_locale = :en
=======
module ReadingBook
  class Application < Rails::Application
    config.load_defaults 5.1

>>>>>>> cbb8985f37cb571bba4536b814d193f5f6722788
  end
end
