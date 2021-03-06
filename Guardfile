guard 'bundler' do
  watch('Gemfile')
end

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' }, :wait => 30 do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/app_config.yml')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('spec/spec_helper.rb')
  watch(%r{^spec/fabricators/.+_fabricator\.rb})
end

guard 'rspec', :cli => "-c -f documentation --fail-fast --drb",
               :version => 2,
               :all_after_pass => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^extras/(.+)\.rb$})     { |m| "spec/extras/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/requests/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
end


