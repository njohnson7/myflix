source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# added
# gem 'bootstrap-sass'
gem 'bootstrap', '~> 4.1.1'
gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'
gem 'pg'
gem 'popper_js'
gem 'bootstrap_form', '>= 4.0.0.alpha1'
gem 'carrierwave'
gem 'carrierwave-aws'
gem 'mini_magick'
gem 'stripe'
gem 'stripe_event'
gem 'figaro'
gem 'draper'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # added
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'coolline'
  gem 'pry-coolline'
  gem 'pry-theme'
  gem 'awesome_print'
  gem 'shog'
  gem 'niceql'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-state'
  # gem 'pry-rescue'
  gem 'fabrication'
  gem 'faker'
  gem 'concurrent-ruby', require: 'concurrent'
  gem 'yard'
  gem 'yard-rspec'
  gem 'yard-rails'
  gem 'coderay'
  gem 'yard-coderay'
  gem 'letter_opener'
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # added
  # gem 'thin'
  gem 'better_errors'
  gem "binding_of_caller"
  # gem 'better_errors-pry'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  # added
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'rails-controller-testing'
  # gem "nyan-cat-formatter"
  gem 'launchy'
  gem 'capybara-email'
  gem 'webmock'
  gem 'geckodriver-helper'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
