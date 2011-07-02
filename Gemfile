source 'http://rubygems.org'

gem 'rails'              , :git => 'https://github.com/rails/rails.git' \
                         , :branch => '3-1-stable'

gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'bencodr'
gem 'curb'

gem 'carrierwave'        , :git => 'https://github.com/jnicklas/carrierwave.git'
gem 'rack-gridfs'        , :git => 'https://github.com/etehtsea/rack-gridfs.git' \
                         , :branch => 'require-fix'

gem 'formtastic'         , :git => 'https://github.com/justinfrench/formtastic.git'
gem 'show_for'           , :git => 'https://github.com/plataformatec/show_for.git'

gem 'inherited_resources', :git => 'https://github.com/josevalim/inherited_resources.git'
gem 'mongoid'            , :git => 'https://github.com/mongoid/mongoid.git'
gem 'mongoid_slug'       , :git => 'https://github.com/papercavalier/mongoid-slug.git'
gem 'bson_ext'           , '~> 1.3'
gem 'therubyracer'       , '~> 0.9'
gem 'devise'
gem 'cancan'

group :development do
  gem 'thin'
end

group :test, :development do
  gem 'rspec-rails'      , '~> 2.6'
  gem 'capybara'
  gem 'ffaker'
  gem 'fabrication'      , :git => 'https://github.com/paulelliott/fabrication.git'
  gem 'launchy'          , '1.0.0',
                           :git => 'https://github.com/etehtsea/launchy.git' \
                         , :branch => 'patch-1'
  gem 'database_cleaner'
end

group :test do
  gem 'spork'            , '~> 0.9.0.rc'
  gem 'guard'            , :git => 'https://github.com/guard/guard.git'
  gem 'guard-spork'      , '~> 0.1'
  gem 'guard-rspec'      , '~> 0.3'
  gem 'guard-bundler'    , '~> 0.1'
  gem 'delorean'         , '~> 1.0'

  if RUBY_PLATFORM =~ /darwin/i
    gem 'rb-fsevent'     , '>= 0.4.0', :require => false
    gem 'growl'          , '~> 1.0.3', :require => false
  end

  if RUBY_PLATFORM  =~ /linux/i
    gem 'rb-inotify'     , '>= 0.8.5', :require => false
    gem 'libnotify'      , '~> 0.1.3', :require => false
  end
end
