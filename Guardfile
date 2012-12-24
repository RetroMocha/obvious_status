guard 'rspec', :cli => "--color",  :spec_paths => ["app/spec"] do
  watch(%r{^app/spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$}) { |m| "app/spec/#{m[1]}_spec.rb" }
end
