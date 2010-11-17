source 'http://rubygems.org'

gem 'rails',          '~>3.0.0'

# Database gems
gem 'bson_ext'
gem 'mongoid',        :git => "https://github.com/mongoid/mongoid.git",
                      :tag => "2.0.0.beta.20"
gem 'mongoid_slug',   :git => "git://github.com/etehtsea/mongoid-slug.git",
                      :require => 'mongoid/slug'

# File management
gem 'carrierwave',    '~>0.5.0'

# User management
gem 'devise',          '~>1.1.2'
gem 'cancan',         :git => "https://github.com/bowsersenior/cancan.git"

# View/Design management
gem 'high_voltage',   :git => "https://github.com/thoughtbot/high_voltage.git"
gem 'compass'
gem 'haml'
gem 'haml-rails'
gem 'rubb'

# Ancillary gems
gem 'bencodr'
gem 'curb'
gem 'home_run'

group :test, :development do
  gem "rspec-rails", "~> 2.1.0"
end

group :development do
  gem "wirble"
end

# Testing
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'
  gem 'factory_girl_rails'
end
