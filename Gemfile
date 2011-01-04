source 'http://rubygems.org'

gem "rack",  :git => 'git://github.com/rack/rack.git'
gem 'rails', :git => 'git://github.com/rails/rails.git'

# Database gems
gem 'bson_ext'
gem 'mongoid',      :git => "git://github.com/etehtsea/mongoid.git"
gem 'mongoid_slug',   :git => "git://github.com/papercavalier/mongoid-slug.git",
                      :require => 'mongoid/slug'

# File management
gem 'carrierwave',    :git => "git://github.com/etehtsea/carrierwave.git",
                      :branch => 'rails31'

# User management
gem 'devise',         :git => "git://github.com/plataformatec/devise.git"
gem 'cancan',         :git => "git://github.com/ryanb/cancan.git",
                      :ref => '2d31cbd'

# Controllers
gem 'responders',          :git => "git://github.com/plataformatec/responders.git"
gem 'inherited_resources', :git => "git://github.com/etehtsea/inherited_resources.git",
                           :branch => 'rails31'

#gem 'inherited_resources_views', :git => "git://github.com/fredwu/inherited_resources_views.git"
#gem 'hpricot'
#gem 'ruby_parser'

# View/Design management
gem 'high_voltage',   :git => "https://github.com/thoughtbot/high_voltage.git"
gem 'compass'
gem 'haml'
gem 'haml-rails'
gem 'rubb'
gem 'formtastic',     :git => "https://github.com/justinfrench/formtastic.git"

# Ancillary gems
gem 'bencodr'
gem 'curb'
gem 'eventmachine'
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
