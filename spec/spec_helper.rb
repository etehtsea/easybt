require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    config.before(:suite) { DatabaseCleaner.strategy = :truncation }
    config.before(:each)  { DatabaseCleaner.start }
    config.after(:each)   { DatabaseCleaner.clean }
  end

  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

Spork.each_run do
end
