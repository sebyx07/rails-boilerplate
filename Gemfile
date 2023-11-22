# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.2'
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '~> 6.4'
gem 'tzinfo-data', platforms: %i[ windows jruby ]
gem 'bootsnap', '~> 1.17', require: false

group :development, :test do
  # gem 'debug', platforms: %i[ mri windows ]
end

group :development do
  gem 'rubocop-rails_config', '~> 1.16'
  gem 'annotate', '~> 3.2'
  gem 'spring', '~> 4.1', '>= 4.1.2'
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
  gem 'redis', '~> 5.0', '>= 5.0.8'
  gem 'web-console', '~> 4.2', '>= 4.2.1'
end

group :test, :development do
  gem 'rspec-rails', '~> 6.1'
  gem 'factory_bot_rails', git: 'https://github.com/leoarnold/factory_bot_rails.git', ref: '8205851fabc026968d82f9fbd50b7ae9f2b5b1e1'
  gem 'ffaker', '~> 2.23'
end

group :production do
  gem 'hiredis-client', '~> 0.18.0'
  gem 'bugsnag', '~> 6.26'
  gem 'falcon', '~> 0.42.3'
end

group :test do
  gem 'vcr', '~> 6.2'
  gem 'webmock', '~> 3.19', '>= 3.19.1'
  gem 'database_cleaner-active_record', '~> 2.1'
  gem 'shoulda-matchers', '~> 5.3'
end

gem 'sidekiq', '~> 7.2'
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
gem 'sidekiq-cron', '~> 1.11'
gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'jb', '~> 0.8.2'
gem 'oj', '~> 3.16', '>= 3.16.1'
gem 'jit_preloader', '~> 2.0'
gem 'pry-rails', '~> 0.3.9'
gem 'vite_rails', '~> 3.0', '>= 3.0.17'
gem 'jsonapi-resources', '~> 0.10.7'
