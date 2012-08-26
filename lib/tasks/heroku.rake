namespace :deploy do

  task :production do
    puts "deploying to production"
    system "git push production master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-cedar"
    puts "done"
  end

  task :staging do
    puts "deploying to staging"
    system "git push staging master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-staging"
    puts "done"
  end
end
