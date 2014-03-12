# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

puts "Seeding for env '#{Rails.env}'"

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
    date = Date.strptime(line[1], '%Y-%m-%d')
    Show.create!(location: line[0], date: date,
      duration: line[2], title: line[3], url: url)
  end
end

def create_stories
  Ccsv.foreach('db/seed/news.csv') do |line|
    line.each { |str| str.gsub!(/\"/,'').gsub!(/;/,',') }
    date = Date.strptime(line[0], '%Y-%m-%d')
    Story.create!(date: date, title: line[1],
      content: line[2])
    Story.create!(date: date, title: line[3],
      content: line[4], language: 'en')
  end
  Story.create!(date: Date.today, title: 'Test news',
    content: 'Testing. 1 2 3. <br /> BÖÖ!!\n Return')
end

if Rails.env.development?
  p "Creating admins"
  admins = YAML.load_file('db/seed/admin.credentials.yml')
  # admins.each { |user| admin.users.create!(user)}
  Admin.find_or_create!(admins['Timo'])
end

p "Creating shows"
create_shows()
p "Creating stories"
create_stories()

p "All done!"
