require 'spec_helper'

describe ShowsController do

  describe "GET 'index'" do
    context "GET before tests" do
      before(:each) { get :index }

      it { response.should be_success }

      it { assigns[:title].should eq I18n.t('shows.title') }

      it { assigns[:year].should eq Date.today.year }
    end

    it "should receive call to Show.upcoming scope" do
      Show.should_receive(:upcoming)
      get :index
    end

    it "should receive call to Show.earlier_this_year scope" do
      Show.should_receive(:earlier_this_year)
      get :index
    end

    context "GET with pervious years" do
      it "should receive call to Show.range for 2012" do
        Show.should_receive(:range).with(Date.new(2012), Date.new(2013))
        get :index, year: 2012
      end

    end

  end

end
