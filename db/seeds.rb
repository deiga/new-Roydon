# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
puts "Seeding for env '#{Rails.env}'"

def create_shows
  shows = YAML.load_file('db/seed/shows.yml')
  shows.each do |show|
    date = Date.strptime(show['aika'])
    Show.find_or_create_by(location: show['paikka'], date: date, duration: show['kesto'], title: show['nimi'], url: show['link'])
  end 
end

def create_stories
  news = YAML.load_file('db/seed/news.yml')
  news.each do |news_item|
    date = Date.strptime(news_item['date'])
    Story.find_or_create_by(date: date, title: news_item['head'], content: news_item['content'])
    Story.find_or_create_by(date: date, title: news_item['headEn'], content: news_item['contEn'], language: 'en')
  end 
end


p "Creating shows"
create_shows
p "Creating stories"
create_stories

p "All done!"