source 'https://rubygems.org'

gem 'rails', '~> 5.1.4'

# server
gem 'puma', '~> 3.0'

# database
gem 'pg'

# frontend
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

# backend
gem 'devise'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma'
  gem 'sshkit-sudo'
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'rspec-sidekiq'
end