# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rails'
require 'rest-client'
require 'rspec'

URL_DEMOZABLE = 'https://www.demoblaze.com/'
URL_DEMOZABLE_API = 'https://api.demoblaze.com/'

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = "https://www.google.com"
    URL = "https://www.google.com"
    config.default_max_wait_time = 30
end