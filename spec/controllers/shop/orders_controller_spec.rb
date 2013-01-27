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
      prod = FactoryGirl.create(:product, name: 'Test 23', price: 4.2)
      cart.add prod
      get :new
      response.should be_success
      prod.destroy
      cart.destroy
    end
  end

  describe "POST 'create'" do
    it "should render 'new' action" do
      post :create
      response.should render_template 'new'
    end

    it "should create order" do
      order = FactoryGirl.build(:order)
      lambda {
        post :create, shop_order: order.attributes
      }.should change(Shop::Order, :count)
      response.should redirect_to(shop_url)
    end
  end

end
