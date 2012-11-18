# encoding: UTF-8

namespace :homepage do

  desc 'Setup news'
  task :stories do
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

  desc 'Setup shows'
  task :shows do
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
end
