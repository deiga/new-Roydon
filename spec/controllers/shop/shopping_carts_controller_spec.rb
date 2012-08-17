require 'spec_helper'

describe Shop::ShoppingCartsController do

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => ShoppingCart.create
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => ShoppingCart.create
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update', :id => ShoppingCart.create
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :id => ShoppingCart.create
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
end
