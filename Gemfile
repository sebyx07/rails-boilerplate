# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.2'
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '~> 6.4'
gem 'tzinfo-data', platforms: %i[ windows jruby ]
gem 'bootsnap', '~> 1.17', require: false

group :development, :test do
  gem 'debug', platforms: %i[ mri windows ]
end

group :development do
  gem 'rubocop-rails_config', '~> 1.16'
  gem 'annotate', '~> 3.2'
  gem 'spring', '~> 4.1', '>= 4.1.2'
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
end

group :test, :test do
  gem 'rspec-rails', '~> 6.1'
  gem 'factory_bot_rails', '~> 6.4'
end
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
