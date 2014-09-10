require 'support/async_helpers'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.javascript_driver = ENV.fetch("JS_DRIVER", "selenium").to_sym

RSpec.configure do |config|
  config.include AsyncHelpers
end

