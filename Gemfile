# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "puma", "~> 5.0"
gem "rails", "~> 6.1.0"
gem "sqlite3", "~> 1.4"

# Assets
gem "jbuilder", "~> 2.7"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

# Caching
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Auth
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Other
gem "simple_form"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
  gem "pry-byebug"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "foreman"
  gem "letter_opener"
  gem "listen", "~> 3.3"
  gem "pry"
  gem "pry-rails"
  gem "spring"
  gem "web-console", ">= 4.1.0"

  # linting
  gem "erb_lint", require: false
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-shopify", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
