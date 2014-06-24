# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require "bundler"
Bundler.setup(:default, :development)

unless RUBY_PLATFORM =~ /java/
  require "simplecov"
  require "coveralls"

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
      add_filter "spec"
  end
end

require "savon"
#require "rspec"

# don't have HTTPI lazy-load HTTPClient, because then
# it can't actually be refered to inside the specs.
require "httpclient"

support_files = File.expand_path("spec/support/**/*.rb")
Dir[support_files].each { |file| require file }

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
#Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include SpecSupport
  config.mock_with :mocha
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end

HTTPI.log = false
