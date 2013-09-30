require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new
Cucumber::Rake::Task.new

task :test => [:spec, :cucumber, 'coveralls:push'] #=> 'test:with_coveralls'
task :default => :test
