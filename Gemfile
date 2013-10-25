source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

# postgresql database
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails' 
gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# server
gem 'thin', '>= 1.5.0'

# javascript 
gem 'jquery-rails'
gem 'jquery-ui-rails'

# fonts
gem 'font-awesome-rails'
gem 'google-webfonts'

# view templates
gem 'haml'
gem 'haml-rails'

# mail
gem 'sendgrid', '>= 1.0.1'

# authentication
gem 'devise', '3.0.0'

# permissions
gem 'cancan'

# user roles
gem 'rolify', '3.3.0.rc4'

# forms
gem 'simple_form'

gem "client_side_validations"

# environment variables
gem 'figaro'

# pagination
gem 'kaminari'

# pretty development data
gem 'faker'
gem 'faker-bloocher'
gem 'faker-stoked'
gem 'sprockets-rails', :require => 'sprockets/railtie'

group :development do 

  gem 'hpricot', '0.8.6'
  gem 'ruby_parser', '3.1.1'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rails_best_practices'
end

group :test do 
  
  gem 'minitest-rails-shoulda', '~> 0.4.1'
  gem 'minitest-rails-capybara'
  gem 'minitest-given'
  gem 'wrong'
  gem 'headless', '0.3.1'

  # pretty test output
  gem 'ansi'
  gem 'turn'

  # capybara save_and_open dependency
  gem 'launchy'

end

group :test, :development do
  
  # minitest
  gem 'minitest'
  gem 'minitest-rails', '0.5.2'
    
  # preloads rails app for faster test and development tasks
  gem 'spring'

  # test factories  
  gem 'factory_girl_rails'
  
  # ubuntu notifications for test
  gem 'rb-inotify'
  gem 'rb-fsevent'
  
  # debugging
  gem 'debugger'
  gem 'pry'
  gem 'awesome_print'

  # Guards
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-livereload'
  # gem 'guard-minitest'
  gem 'guard-minitest', github: 'guard/guard-minitest'

  # clean up database between tests
  gem 'database_cleaner'
end

group :production do 
  
  gem 'rails_12factor', group: :production
end

group :doc do

  # bundle exec rake doc:rails generates the API under doc/api.
  # gem 'sdoc', require: false
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby