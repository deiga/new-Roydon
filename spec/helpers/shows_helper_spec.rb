require 'spec_helper'

describe ShowsHelper do

  it { display_show_year(2011).should be 2011 }

  it "should return year range, if month >= 9" do
    Timecop.travel(Date.new(2012, 9, 1))
    display_show_year(2012).should == '2012 - 2013'
  end

  it "should display the current year" do
    year = Date.today.year
    Timecop.travel(Date.new(year, 1, 1))
    display_show_year.should be year
  end
end
