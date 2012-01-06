require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title", 
        :content => "Roydon | Home")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", 
        :content => "Roydon | Contact")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title", 
        :content => "Roydon | About")
    end
  end

  describe "GET 'shows'" do
    it "returns http success" do
      get 'shows'
      response.should be_success
    end

    it "should have the right title" do
      get 'shows'
      response.should have_selector("title", 
        :content => "Roydon | Shows")
    end
  end

end
