ENV['RACK_ENV'] = 'test'

require './app/app'
require './app/models/link'
require 'dm-rspec'
require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'database_cleaner'
require 'simplecov'
require 'simplecov-console'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:suite) do
   DatabaseCleaner.strategy = :transaction
   DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include(DataMapper::Matchers)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
