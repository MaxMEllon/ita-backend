source 'https://rubygems.org'

gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'
gem 'jwt'
gem 'lotus-view'
gem 'rake'
gem 'slim'
gem 'sqlite3'

group :development do
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'codecov', require: false
  gem 'database_cleaner'
  gem 'rspec-hanami'
  gem 'simplecov', require: false
end

group :production do
  gem 'puma'
end
