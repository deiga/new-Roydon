require 'spec_helper'

describe Show do

	before(:each) do
		@attr = { :location => 'Helsinki', :url => 'http://foo.bar', 
			:title => 'Test Show', :date => Date.new(2012, 3, 1)}
	end

	it "should create a new Show given valid attributes" do
		Show.create!(@attr)
	end

	it "should require a title" do
		no_title_show = Show.new(@attr.merge(:title => ""))
		no_title_show.should_not be_valid
	end

	it "should require a url" do
		no_title_show = Show.new(@attr.merge(:url => ""))
		no_title_show.should_not be_valid
	end

	it "should require a location" do
		no_title_show = Show.new(@attr.merge(:location => ""))
		no_title_show.should_not be_valid
	end

	it "should require a date" do
		no_title_show = Show.new(@attr.merge(:date => ""))
		no_title_show.should_not be_valid
	end

	it "should require a date" do
		no_title_show = Show.new(@attr.merge(:date => ""))
		no_title_show.should_not be_valid
	end

	it "should require a numerical duration" do
		no_title_show = Show.new(@attr.merge(:duration => "kaksi"))
		no_title_show.should_not be_valid
	end

	it "should require a duration greater than 0" do
		no_title_show = Show.new(@attr.merge(:duration => -1))
		no_title_show.should_not be_valid
	end

	it "should require a valid URL" do
		no_title_show = Show.new(@attr.merge(:url => 'foo.bar'))
		no_title_show.should_not be_valid
	end
end