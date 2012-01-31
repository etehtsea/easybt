source 'http://rubygems.org'

gem 'rails'              , '~> 3.2.1'

gem 'jquery-rails'
gem 'haml-rails'
gem 'bencodr'
gem 'curb'

gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'rack-gridfs'        , :require => 'rack/gridfs'
gem 'formtastic'
gem 'show_for'

gem 'inherited_resources', :git => 'https://github.com/josevalim/inherited_resources.git'
gem 'mongoid'
gem 'mongoid_slug'       , :git => 'https://github.com/hakanensari/mongoid-slug.git'
gem 'bson_ext'           , '~> 1.3'
gem 'devise'
gem 'cancan'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-script'
  gem 'uglifier'
end

group :test, :development do
  gem 'rspec-rails'      , '~> 2.6'
  gem 'capybara'
  gem 'ffaker'
  gem 'fabrication'      , :git => 'https://github.com/paulelliott/fabrication.git'
  gem 'launchy'
  gem 'database_cleaner'
end

group :test do
  gem 'spork'            , '~> 1.0.0.rc'
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
