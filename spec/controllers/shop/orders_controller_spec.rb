require 'spec_helper'

describe Shop::OrdersController do

  describe "GET 'new'" do
    it "should redirect to shop index with empty cart" do
      get 'new'
      response.should redirect_to(shop_url)
    end

    it "should render new order" do
      cart = Shop::ShoppingCart.create
      session[:shopping_cart_id] = cart.id
      cart.add Shop::Product.create!(name: 'Test 23', price: 4.2)

      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should render 'new' action" do
      post :create
      response.should render_template 'new'
    end
  end

end
