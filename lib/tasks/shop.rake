namespace :shop do

  desc 'Add categories'
  task :categories do
    categories_yaml = YAML.load_file('db/seed/categories.yml')
    categories_yaml.each do |top_category, category_list|
      parent = Shop::Category.new(:name => top_category)
      parent.save!

      unless category_list.nil?
        category_list.each do |category|
          parent.children.create(:name => category)
        end
      end
    end
  end

  desc 'Add user groups'
  task :user_groups do
    breeder = Shop::UserGroup.create!( :name => :breeder )
    groomer = Shop::UserGroup.create!( :name => :groomer )
    admin = Shop::UserGroup.create! name: :admin
  end
end
