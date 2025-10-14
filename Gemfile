source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.6'
gem 'concurrent-ruby', '1.3.4' # TODO: this is temporary for updating to rails 6.0.6

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

gem 'nokogiri', '~> 1.18', '>= 1.18.9', force_ruby_platform: true

# Use Puma as the app server
gem 'puma', '~> 5.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'

# Use JavaScript with Vite [https://github.com/sergii/vite_rails]
gem 'vite_rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Authentication
gem 'devise', '~> 4.9'
gem 'omniauth', '~> 2.1'
gem 'omniauth-cul', '~> 0.2'

# Columbia CAS authentication
gem 'cul_omniauth', '~> 0.7.0'

# Use MySQL for deployed server environments
gem 'mysql2'

# Fetch ldap details - first name, last name, etc.
gem 'net-ldap'

# Cross-Origin Resource Sharing for Key Resources JSON
gem 'rack-cors', require: 'rack/cors'

# For cleaning up leading and trailing whitespace on model attributes
gem 'strip_attributes', '~> 1.9'

# Forcing psych 3 (not 4) so that yaml aliases can be used with Rails 6.0
gem 'psych', '<4'

gem 'rainbow', '~>3.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Deployment
  gem "capistrano", "~> 3.14", require: false
  gem 'capistrano-cul', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  # Just add it to your Gemfile and require it in your Capfile.
  gem 'capistrano-passenger', require: false

  # Better error page for Rack apps
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  # For testing with chromedriver
  gem 'selenium-webdriver', '~> 4.16.0'
end

# # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
