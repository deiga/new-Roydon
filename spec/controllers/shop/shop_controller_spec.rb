# encoding: UTF-8
require 'spec_helper'

describe Shop::ShopController do

	shared_examples "set_cart" do
		it "should call set_cart" do
			controller.should_receive(:set_cart)
			get :index
		end

		it "should create a shopping cart" do
			get :index
			@cart = assigns(:cart)
			@cart.should be_a(Shop::ShoppingCart)
			@cart.should_not be_nil
			@cart.should be_empty
		end
	end

	describe "GET 'index'" do

		it "returns http success" do
			get :index
			response.should be_success
		end

		include_examples "set_cart"
	end

  describe "GET 'search'" do
    it "should retutn http success" do
      get :search, search: 'Test search'
      response.should be_success
    end
  end

end
