source 'https://rubygems.org'

gem 'sinatra'
gem 'rake'
gem 'rack', '1.5.2'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'sinatra-reloader'
gem 'require_all'
gem 'thin'
gem 'bcrypt'

group :development do
  gem 'sqlite3'
  gem 'shotgun'
  gem 'tux'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end

group :production do
  gem 'mysql2', '0.3.16'
end
