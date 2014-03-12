require 'spec_helper'

describe Mall::ProductsController do

  describe "GET 'index'" do
    it "returns http success without category" do
      get 'index'
      response.should be_success
    end
    it "should return http success with category" do
      get :index, category: 'hakit'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: BSON::ObjectId.new
      response.should_not be_success
    end
  end

end
