# frozen_string_literal: true

require "capybara/rails"
require "capybara/rspec"
require "capybara-screenshot/rspec"
require "selenium/webdriver"

# Keep only the screenshots generated from the last failing test suite
Capybara::Screenshot.prune_strategy = :keep_last_run

# Register capybara headless driver
Capybara.register_driver :selenium_headless do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions": { args: ["headless", "no-sandbox", "disable-gpu", "window-size=1366x768"] }
  )

  Capybara::Selenium::Driver.new app,
    browser: :remote,
    url: "http://selenium_chrome:4444/wd/hub",
    capabilities: capabilities
end

# Register capybara driver to use with VNC
Capybara.register_driver :selenium do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions": { args: ["no-sandbox", "window-size=1366x768"] }
  )

  Capybara::Selenium::Driver.new app,
    browser: :remote,
    url: "http://selenium_chrome:4444/wd/hub",
    capabilities: capabilities
end

# Configure Capybara driver for js tests
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    Capybara.server_host = "0.0.0.0"
    Capybara.app_host = "http://#{ENV.fetch("HOSTNAME")}:#{Capybara.server_port}"
    driven_by :selenium_headless
  end
end
