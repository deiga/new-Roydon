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
			@shopping_cart = assigns(:shopping_cart)
			@shopping_cart.should be_a(ShoppingCart)
			@shopping_cart.should_not be_nil
			@shopping_cart.should be_empty
		end
	end

	describe "GET 'index'" do

		it "returns http success" do
			get :index
			response.should be_success
		end

		include_examples "set_cart"
	end

	describe "GET 'add_to_cart'" do

		def do_add_to_cart
			get :add_to_cart, product: Product.create(:name => "Test product", price: 5.3)
		end

		include_examples "set_cart"

		it "should have one product in cart" do
			do_add_to_cart
			@shopping_cart = assigns(:shopping_cart)
			@shopping_cart.products.size.should be 1
		end
	end

end
