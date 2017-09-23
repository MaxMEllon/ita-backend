# frozen_string_literal: true

# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

if ENV['CI'] == 'true'
  require 'simplecov'
  require 'codacy-coverage'

  SimpleCov.start
  Codacy::Reporter.start
end

require_relative '../config/environment'
# require 'minitest/autorun'
require 'rspec/hanami'
require_relative './web/controllers/helpers'

RSpec.configure do |c|
  c.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  c.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  c.include RSpec::Hanami::Matchers
  c.include Controllers::Helpers
end

Hanami.boot

if ENV['CI'] == 'true'
  require 'codecov'

  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
