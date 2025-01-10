source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.2'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"
gem 'active_model_serializers', '~> 0.10.14'
# Use Active Storage variant to resize images
# [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'ostruct'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'devise', '~> 4.9'
gem 'devise-i18n'

gem 'httparty', '~> 0.22.0'

gem 'rails-i18n', '~> 7.0'

gem 'jwt', '~> 2.9'

gem 'csv'
gem 'write_xlsx'

gem 'pghero'

gem 'get_process_mem'

gem 'bullet'

gem 'health_check', '~> 3.1'

gem 'activeadmin', '~> 3.2'
gem 'activeadmin_addons', '~> 1.10'

# Use for generating ERD diagrams
gem 'rails-erd'

gem 'wannabe_bool'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'

  # gem "rubocop-rails-omakase", require: false
  gem 'rubocop', '~> 1.70', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  # Use for storing credentials and not uploading them to github. Loads ENV variables from .env file
  gem 'dotenv-rails'

  # Use for static analysis of security vulnerabilities
  gem 'brakeman', require: false

  # Use for static analysis of code quality
  gem 'rubycritic', require: false

  # Factories
  gem 'factory_bot_rails'
  gem 'faker'

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'parallel_tests', '~> 4'
  gem 'rspec-rails', '~> 7.1.0'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'annotate'
  gem 'web-console'
end

group :test do
  # Code coverage
  gem 'simplecov', require: false

  gem 'timecop', '~> 0.9.10'
  gem 'vcr', '~> 6.3'

  gem 'rspec-deep-ignore-order-matcher'

  gem 'shoulda-matchers', '~> 6.4'
  # For stubbing HTTP requests
  gem 'webmock', '~> 3.24'
  # For testing performance
  gem 'test-prof', '~> 1.3'
  # For testing background jobs
  gem 'rspec-sidekiq', '~> 5.0'
  # For cleaning the database between tests
  gem 'database_cleaner', '~> 2.1'
end

gem 'sidekiq', '~> 7.3'
gem 'sidekiq-failures'
gem 'sidekiq-scheduler', '~> 5.0'
gem 'sidekiq-unique-jobs', '~> 8.0'
