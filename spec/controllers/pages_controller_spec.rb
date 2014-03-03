require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end

    it "should set correct internationalized title" do
      get :home
      expect(assigns[:title]).to eq I18n.t 'pages.home'
    end

    it "should receive call to Show.upcoming scope" do
      expect(Show).to receive(:upcoming)
      get :home
    end

    it "should receive call to Story.newest scope" do
      expect(Story).to receive(:newest)
      get :home
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      expect(response).to be_success
    end

    it "should set correct internationalized title" do
      get :contact
      expect(assigns[:title]).to eq I18n.t 'pages.contact'
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      expect(response).to be_success
    end

    it "should set correct internationalized title" do
      get :about
      expect(assigns[:title]).to eq I18n.t 'pages.about'
    end
  end

end
