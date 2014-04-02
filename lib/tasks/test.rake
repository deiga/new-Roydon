require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new

task test: [:spec, 'coveralls:push'] #=> 'test:with_coveralls'
