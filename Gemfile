source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# System
gem 'bootsnap', require: false
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'rails'
gem 'tzinfo-data'

# Dry-rb bundle
gem 'dry-initializer'
gem 'dry-types'
gem 'dry-validation'

# Trailblazer bundle
gem 'trailblazer-rails'

# API documentation generator
gem 'apipie-rails'

# Background processing
gem 'sidekiq'

group :development, :test do
  gem 'awesome_print'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
end

group :development do
  gem 'bullet'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'pronto', require: false
  gem 'pronto-brakeman', require: false
  gem 'pronto-fasterer', require: false
  gem 'pronto-rails_best_practices', require: false
  gem 'pronto-rails_schema', require: false
  gem 'pronto-rubocop', require: false
  gem 'simplecov', require: false
end
