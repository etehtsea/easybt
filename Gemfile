source 'http://rubygems.org'

gem "rack",                 :git => 'git://github.com/rack/rack.git'
gem 'rails',                :git => 'git://github.com/rails/rails.git'

# Database gems
gem 'bson_ext'
gem 'mongoid',              :git => 'git://github.com/mongoid/mongoid.git'
gem 'mongoid_slug',         :git => 'git://github.com/papercavalier/mongoid-slug.git',
                            :require => 'mongoid/slug'

# File management
gem 'carrierwave',          :git => 'git://github.com/jnicklas/carrierwave.git'

# User management
gem 'devise',               :git => 'git://github.com/plataformatec/devise.git'
gem 'cancan',               :git => 'git://github.com/ryanb/cancan.git'

# Controllers
gem 'responders',           :git => 'git://github.com/plataformatec/responders.git'
gem 'inherited_resources',  :git => 'git://github.com/josevalim/inherited_resources.git'

# View/Design management
gem 'high_voltage',         :git => 'git://github.com/thoughtbot/high_voltage.git'
gem 'compass'
gem 'haml'
gem 'haml-rails'
gem 'rubb'
gem 'formtastic',           :git => 'git://github.com/justinfrench/formtastic.git'

# Ancillary gems
gem 'bencodr'
gem 'curb'
gem 'jquery-rails'

# Testing
group :development, :test do
  gem 'rspec-rails'
  gem 'cucumber-rails',     :git => 'git://github.com/aslakhellesoy/cucumber-rails.git'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'launchy'
end
