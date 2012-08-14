# encoding: UTF-8
require 'spec_helper'

describe Shop::ShopController do
	render_views

	describe "GET 'index'" do
		it "returns http success" do
			get 'index'
			response.should be_success
		end

		it "should call the model price calculation" do
			@shopping_cart = ShoppingCart.find_or_create_by(session[:shopping_cart_id])
			session[:shopping_cart_id] = @shopping_cart.id.to_s
			@shopping_cart.add Product.create(:price => 5.3)
			@shopping_cart.should_receive(:price)
			get 'index'
			# page.should have_css('span#price', :content => "5.3 €")
		end
	end

end
