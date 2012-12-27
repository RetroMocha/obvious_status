task :rspec do
  sh 'rspec ./app -c'
end

task :server do
  sh 'cd delivery/web && shotgun -o 0.0.0.0 ./app.rb '
end

task :api do
  sh 'cd delivery/api && shotgun -o 0.0.0.0 ./app.rb '
end
