Rake::Task["rails_admin:disable_initializer"].clear
namespace :rails_admin do
  desc "Disable rails_admin initializer"
  task :disable_initializer do
    if ENV['SKIP_RAILS_ADMIN_INITIALIZER'].nil?
      ENV['SKIP_RAILS_ADMIN_INITIALIZER'] = 'true'
    end
  end
end
