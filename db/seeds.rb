# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

def create_categories
  categories_yaml = YAML.load_file('db/seed/categories.yml')
  categories_yaml.each do |top_category, category_list|
    parent = TopCategory.new(:name => top_category)
    parent.save!

    unless category_list.nil?
      category_list.each do |category|
        parent.categories.create!(:name => category)
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
end

UserGroup.create( :name => 'Breeder' )
UserGroup.create( :name => 'Groomer' )

if Rails.env.development? 
  admins = YAML.load_file('db/seed/admin.credentials.yml')
  Admin.create!(admins['Timo'])
  #Admin.create!(:email => 'webmaster@roydon.fi', :password => '')
end

create_categories()
create_shows()
create_stories()

