task :rspec do
  sh 'bundle exec rspec ./app -c'
end

task :server do
  sh 'cd delivery/web && bundle exec shotgun -o 0.0.0.0 -p 9393 ./app.rb '
end

task :api do
  sh 'cd delivery/api && bundle exec shotgun -o 0.0.0.0 -p 9394 ./app.rb '
end
