# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

UserGroup.create( :name => 'Breeder' )
UserGroup.create( :name => 'Groomer' )

if Rails.env.development? 
  admins = YAML.load_file('db/seed/admin.credentials.yml')
  Admin.create!(admins['Timo'])
  #Admin.create!(:email => 'webmaster@roydon.fi', :password => '')
end

['Turkinhoito', 'Trimmaus', 'Hyvinvointi' 'Koulutus', 'Syötävät', 
 'Ruokakupit', 'Taluttimet', 'Pannat', 'Valjaat & Liivit', 'Häkit',
 'Makuualustat', 'Aitaukset & portit', 'Lelut', 'Muut'].
 each do |name|
  TopCategory.create(:name => name)
end

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

Ccsv.foreach('db/seed/news.csv') do |line|
  line.each { |str| str.gsub!(/\"/,'') }
  date = Date.strptime(line[0])
  Story.create!(:date => date, :title => line[1],
    :content => line[2])
end