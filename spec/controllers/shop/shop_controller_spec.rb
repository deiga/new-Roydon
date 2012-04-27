require 'spec_helper'

describe Shop::ShopController do
	render_views

	describe "GET 'index'" do
		it "returns http success" do
			get 'index'
			response.should be_success
		end

		it "should call the model price calculation" do
			@shopping_cart = session[:shopping_cart] ||= ShoppingCart.new 
			@shopping_cart.add Product.create(:price => 5.3)
			@shopping_cart.should_receive(:price)
			get 'index'
		end
	end

end
