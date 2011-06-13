source 'http://rubygems.org'

gem 'rails'              , :git => 'https://github.com/rails/rails.git',
                           :branch => '3-1-stable'

gem 'unicorn'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'bencodr'
gem 'curb'
gem 'formtastic'         , :git => 'https://github.com/justinfrench/formtastic.git'
gem 'show_for'           , :git => 'https://github.com/plataformatec/show_for.git'

gem 'inherited_resources', :git => 'https://github.com/josevalim/inherited_resources.git'
gem 'mongoid'            , :git => 'https://github.com/mongoid/mongoid.git'
gem 'bson_ext'           , '~> 1.3'
gem 'mongoid_slug'       , :git => 'https://github.com/papercavalier/mongoid-slug.git'
gem 'carrierwave'

group :test, :development do
  gem 'rspec-rails'      , '~> 2.6'
  gem 'capybara'         , :git => 'https://github.com/jnicklas/capybara.git'
  gem 'fabrication'      , :git => 'https://github.com/paulelliott/fabrication.git'
  gem 'forgery'
  gem 'launchy'
  gem 'database_cleaner'
end

group :test do
  gem 'spork'            , '~> 0.9.0.rc'
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
