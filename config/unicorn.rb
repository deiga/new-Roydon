# If you have a very small app you may be able to
# increase this, but in general 3 workers seems to
# work best
if ENV["RAILS_ENV"] == "development"
  worker_processes 1
else
  worker_processes Integer(ENV.fetch('UNICORN_WORKERS', 3))
end

# Load your app into the master before forking
# workers for super-fast worker spawn times
preload_app true

# Immediately restart any workers that
# haven't responded within 30 seconds
timeout 29

before_exec do |server|
  ENV['RUBY_GC_MALLOC_LIMIT']=16000000
end

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

end
