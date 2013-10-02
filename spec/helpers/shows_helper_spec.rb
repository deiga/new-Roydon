require 'spec_helper'

describe ShowsHelper do

  after(:each) do
    Timecop.return
  end

  it { display_show_year(2011).should be 2011 }

  it "should return year range, if month >= 9" do
    new_time = Date.new(2012, 9, 1)
    Timecop.travel(new_time)
    new_time.should eq Date.today
    display_show_year(2012).should == '2012 - 2013'
  end

  it "should display the current year" do
    year = Date.today.year
    new_time = Date.new(year, 1, 1)
    Timecop.travel(new_time)
    new_time.should eq Date.today
    display_show_year.should be year
  end
end
