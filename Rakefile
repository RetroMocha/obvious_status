require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'app'
  t.libs << 'delivery'
  t.libs << 'external'
  t.libs << 'test'
  # guarantee code coverage (SimpleCov) is loaded first
  t.test_files = FileList['test/test_helper.rb'] +
                 FileList['test/**/*_test.rb']
end

task :server do
  sh 'cd delivery/web && bundle exec rerun app.rb '
end

task default: :test
