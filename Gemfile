source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.0'
gem 'rails-api'
gem 'rack-cors', require: 'rack/cors'
gem 'rack-rewrite', require: 'rack/rewrite'
gem 'redis'
gem 'uuidtools'

# gem 'gem_auth', :path => '../gem_auth'
gem 'gem_auth', git: 'git@github.com:ifactorylab/gem_auth.git'

# Use postgresql as the database for Active Record
gem 'pg'

group :production do
  gem 'rails_12factor'
  gem 'puma'
end

group :development do
  gem 'spring'
end

group :test, :development do
  gem 'awesome_print', require: 'ap'
  gem 'byebug'
  gem 'pry'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov',      :require => false
  gem 'simplecov-rcov', :require => false
end