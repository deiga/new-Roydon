namespace :deploy do

  desc "Deploy to heroku production env"
  task :production do
    puts "deploying to production"
    system "git push production master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-cedar"
    puts "Refreshing missing attachments"
    system "heroku run rake paperclip:refresh:missing_styles -a roydon-cedar"
    puts "done"
  end

  desc "Deploy to heroku staging env"
  task :staging do
    puts "deploying to staging"
    system "git push staging master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-staging"
    puts "Refreshing missing attachments"
    system "heroku run rake paperclip:refresh:missing_styles -a roydon-staging"
    puts "done"
  end

  desc "Deploy to heroku development env"
  task :development do
    puts "deploying to development"
    system "git push development develop:master"
    puts "clearing cache"
    system "heroku run console Rails.cache.clear -a roydon-dev"
    puts "Refreshing missing attachments"
    system "heroku run rake paperclip:refresh:missing_styles -a roydon-dev"
    puts "done"
  end
end
