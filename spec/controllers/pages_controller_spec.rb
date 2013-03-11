require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should set correct internationalized title" do
      get :home
      assigns[:title].should eq I18n.t 'pages.home'
    end

    it "should receive call to Show.upcoming scope" do
      Show.should_receive(:first_upcoming)
      get :home
    end

    it "should receive call to Story.newest scope" do
      Story.should_receive(:newest)
      get :home
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "should set correct internationalized title" do
      get :contact
      assigns[:title].should eq I18n.t 'pages.contact'
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should set correct internationalized title" do
      get :about
      assigns[:title].should eq I18n.t 'pages.about'
    end
  end

end
