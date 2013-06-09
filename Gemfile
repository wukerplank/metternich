source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

group :test, :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy'      # to open capybara pages in the browser (save_and_open_page)
  gem 'mina'
  gem 'pry'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'thin'
  gem 'quiet_assets'
  gem 'webmock'      # to mock Net::HTTP requests
end

group :production do
  gem 'mysql2'
end

# Configuration
gem 'figaro'

# Authentication
gem 'omniauth'
gem 'omniauth-twitter'

# CSS, Javascript, etc.
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'less-rails'
gem 'twitter-bootstrap-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
