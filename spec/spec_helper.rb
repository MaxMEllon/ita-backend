# frozen_string_literal: true

# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

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
