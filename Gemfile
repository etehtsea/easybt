source 'http://rubygems.org'

gem "rack",  :git => 'git://github.com/rack/rack.git'
gem 'rails', :git => 'git://github.com/rails/rails.git'

# Database gems
gem 'bson_ext'
gem 'mongoid',        :git => "https://github.com/etehtsea/mongoid.git"
gem 'mongoid_slug',   :git => "git://github.com/papercavalier/mongoid-slug.git",
                      :require => 'mongoid/slug'

# File management
gem 'carrierwave',    '~>0.5.0'

# User management
gem 'devise',          '~>1.1.2'
gem 'cancan',         :git => "https://github.com/ryanb/cancan.git"

# Controllers
gem 'inherited_resources', :git => "https://github.com/josevalim/inherited_resources.git"

# View/Design management
gem 'high_voltage',   :git => "https://github.com/thoughtbot/high_voltage.git"
gem 'compass'
gem 'haml'
gem 'haml-rails'
gem 'rubb'

# Ancillary gems
gem 'bencodr'
gem 'curb'
#gem 'home_run'

# Testing
group :test do
  gem "rspec-rails", "~> 2.1.0", :group => :development
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'
  gem 'factory_girl_rails'
end
