require 'spec_helper'

describe Shop::ShoppingCartsController do

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => Shop::ShoppingCart.create
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => Shop::ShoppingCart.create
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :id => Shop::ShoppingCart.create
      response.should be_success
    end
  end

  describe "GET 'add_item'" do

    it "should have one product in cart" do
      post :add_item, shopping_cart_id: Shop::ShoppingCart.create, id: FactoryGirl.create(:product, :name => "Test product", price: 5.3), options: {}
      @cart = assigns(:cart)
      @cart.items.size.should be 1
    end
  end

  describe "GET 'remove_item" do
    it "should remove item from cart" do
      prod = FactoryGirl.create(:product, :name => "Test product", price: 5.3)
      post :add_item, shopping_cart_id: Shop::ShoppingCart.create, id: prod, options: {}
      @cart = assigns(:cart)
      @cart.items.size.should be 1
      post :remove_item, shopping_cart_id: @cart, id: @cart.items.first
      @cart = assigns(:cart)
      @cart.should be_empty
    end
  end
end
