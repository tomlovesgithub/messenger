require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'timecop'
require 'simplecov'

# tell Capybara about our app class
Capybara.app = Messenger
