source 'https://rubygems.org'

gem 'rails', '4.1.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

ruby '2.2.0'
# Use sqlite3 as the database for Active Record

# Loads .env into ENV in local environment
gem 'dotenv-rails', :groups => [:development, :test]

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# gem 'turbolinks'

gem 'rmagick', '2.13.2'


gem 'aws-sdk', '~> 1.6'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

##############################
#### DUAL SIDE TEMPLATING ####
gem "therubyracer"
##############################

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'less-rails'
gem 'rspec',           '~> 2.14.0'
gem 'sprockets-rails', '~> 2.0.0'
gem 'railties',        '~> 4.1.0'

gem "font-awesome-rails"

#DEVISE
gem 'devise'
gem "omniauth-github"

#ACTIVE ADMIN
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'sass-rails', github: 'rails/sass-rails'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'formtastic'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'sqlite3', '1.3.9'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

#Dashing related stuff
gem 'puma'

gem 'mailboxer'
# gem 'nokogiri'
# gem 'htmlentities'
gem "paperclip", "~> 4.2"

# Use debugger
# gem 'debugger', group: [:development, :test]
