require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'timecop'
require 'simplecov'
require 'capybara/rspec'

# tell Capybara about our app class
Capybara.app = Messenger
