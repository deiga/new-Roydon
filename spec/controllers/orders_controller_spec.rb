require 'spec_helper'

describe Mall::OrdersController do

  describe "GET 'new'" do
    it "should redirect to shop index with empty cart" do
      get 'new'
      response.should redirect_to(shop_url)
    end

    it "should render new order" do
      cart = Mall::ShoppingCart.create!
      session[:shopping_cart_id] = cart.id
      prod = FactoryGirl.create(:product, name: 'Test 23', price: 4.2)
      cart.add prod
      get :new
      response.should be_success
      prod.destroy
      cart.destroy
    end
  end

  describe "GET 'show'" do
    it "should render 'show' for order" do
      get 'show', id: FactoryGirl.create(:order)
      response.should be_success
    end

    it "should not render 'show' for random order " do
      get 'show', id: BSON::ObjectId.new
      response.should_not be_success
    end

    it "should be an routing error" do
      expect{ get 'show' }.to raise_error(ActionController::RoutingError)
    end
  end

  describe "POST 'create'" do

    # TODO move tests to cucumber

    # it "should create order" do
    #   Mall::Order.any_instance.stub(:valid?).and_return(true)
    #   post :create
    #   assigns[:order].should_not be_new_record
    #   response.should redirect_to(shop_url)
    # end

    # it "should render new order page if errors" do
    #   Mall::Order.any_instance.stub(:valid?).and_return(false)
    #   post :create
    #   assigns[:order].should be_new_record
    #   response.should render_template(:new)
    # end

    # it "should pass params to order" do
    #   test_order = FactoryGirl.build(:order)
    #   post :create, shop_order: test_order.attributes.merge({ address: test_order.address})
    #   assigns[:order].message.should eq test_order.message
    #   assigns[:order].address.should eq test_order.address
    #   assigns[:order].price.should eq test_order.price
    # end
  end

end
