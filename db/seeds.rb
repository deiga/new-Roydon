# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

def create_categories
  categories_yaml = YAML.load_file('db/seed/categories.yml')
  categories_yaml.each do |top_category, category_list|
    parent = Category.new(:name => top_category)
    parent.save!

    unless category_list.nil?
      category_list.each do |category|
        parent.children.create(:name => category)
      end
    end
  end
end

def create_shows
  Ccsv.foreach('db/seed/shows.csv') do |line|
    line.each { |str| str.gsub!(/\"/,'') }
    title = line[3]
    len = line.length
    if len > 5
      1.upto(len-4) { |i| title += line[3+i]}
    end
    if len < 5 
      url = nil
    else
      url = line[-1]
    end
    date = Date.strptime(line[1])
    Show.create!(:location => line[0], :date => date,
      :duration => line[2], :title => line[3], :url => url)
  end
end

def create_stories
  Ccsv.foreach('db/seed/news.csv') do |line|
    line.each { |str| str.gsub!(/\"/,'').gsub!(/;/,',') }
    date = Date.strptime(line[0])
    Story.create!(:date => date, :title => line[1],
      :content => line[2])
    Story.create!(:date => date, :title => line[3],
      :content => line[4], :language => 'en')
  end
  Story.create!(:date => Date.today, :title => 'Test news',
    :content => 'Testing. 1 2 3. <br /> BÖÖ!!\n Return')
end

breeder = UserGroup.create!( :name => 'Breeder' )
groomer = UserGroup.create!( :name => 'Groomer' )

if Rails.env.development? 
  admins = YAML.load_file('db/seed/admin.credentials.yml')
  Admin.create!(admins['Timo'])
  Admin.create!(admins['Lotta'])
end

User.create!(:email => 'test@tester.com', :password => 'foofoo',
  :password_confirmation => 'foofoo', :first_name => 'Tester',
  :last_name => 'Test')

breeder.users.create!(:email => 'test2@tester.com', :password => 'foofoo',
  :password_confirmation => 'foofoo', :first_name => 'Tester',
  :last_name => 'Test')

breeder.users.create!(:email => 'test3@tester.com', :password => 'foofoo',
  :password_confirmation => 'foofoo', :first_name => 'Tester',
  :last_name => 'Test')

groomer.users.create!(:email => '1test@tester.com', :password => 'foofoo',
  :password_confirmation => 'foofoo', :first_name => 'Tester',
  :last_name => 'Test')

groomer.users.create!(:email => '2test@tester.com', :password => 'foofoo',
  :password_confirmation => 'foofoo', :first_name => 'Tester',
  :last_name => 'Test')

create_categories()
create_shows()
create_stories()

1.upto(15) do |i|
  test_product = Product.create!(:name => 'Kevytmetallihäkki L', :price => '65', :description => 
    "Paino: 5kg<br />93p 57l 62k<br />2-ovinen, muovipohja<br />Saatavana 7 eri värissä.",
    :image => "http://www.tujomakauppa.net/kuvat/TU4135.jpg")
  test_product.categories << Category.any_in(:name => ['Häkit'])
end


