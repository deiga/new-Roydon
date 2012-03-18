require 'spec_helper'

describe Show do

  before :each do
    @attr = { :location => 'Helsinki', :url => 'http://foo.bar',
     :title => 'Test Show', :date => Date.new(2012, 3, 1)}
  end

  it "should create a new Show given valid attributes" do
    created = Show.create!(@attr)
  end

  it "should contain documents" do
    Show.create!(@attr)
    allShows = Show.all
    allShows.should_not be_empty
  end

  it "should be empty" do
    allShows = Show.all
    allShows.should be_empty
  end

  it "should require a title" do
    no_title_show = Show.new(@attr.merge(:title => ""))
    no_title_show.should_not be_valid
  end

  it "should require a url" do
    no_url_show = Show.new(@attr.merge(:url => ""))
    no_url_show.should_not be_valid
  end

  it "should require a location" do
    no_location_show = Show.new(@attr.merge(:location => ""))
    no_location_show.should_not be_valid
  end

  it "should require a date" do
    no_date_show = Show.new(@attr.merge(:date => ""))
    no_date_show.should_not be_valid
  end

  it "should require a numerical duration" do
    non_numerical_duration_show = Show.new(@attr.merge(:duration => "kaksi"))
    non_numerical_duration_show.should_not be_valid
  end

  it "should require a duration greater than 0" do
    negative_duration_show = Show.new(@attr.merge(:duration => -1))
    negative_duration_show.should_not be_valid
  end

  it "should require a valid URL" do
    invalid_url_show = Show.new(@attr.merge(:url => 'foo.bar'))
    invalid_url_show.should_not be_valid
  end
end