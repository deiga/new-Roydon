namespace :deploy do

  task :production do
    puts "deploying to production"
    system "git push production master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-cedar"
    puts "Refreshing missing attachments"
    system "heroku run rake paperclip:refresh:missing_styles"
    puts "done"
  end

  task :staging do
    puts "deploying to staging"
    system "git push staging master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-staging"
    puts "Refreshing missing attachments"
    system "heroku run rake paperclip:refresh:missing_styles"
    puts "done"
  end

  task :development do
    puts "deploying to development"
    system "git push development master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-dev"
    puts "Refreshing missing attachments"
    system "heroku run rake paperclip:refresh:missing_styles"
    puts "done"
  end
end
