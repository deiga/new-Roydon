require 'spec_helper'

describe Shop::ShoppingCartsController do

  let(:product) { FactoryGirl.create(:product, :name => "Test product", price: 5.3) }

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => Shop::ShoppingCart.create!
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => Shop::ShoppingCart.create!
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :id => Shop::ShoppingCart.create!
      response.should redirect_to shop_path
    end
  end

  describe "POST 'add_item'" do

    it "should have one product in cart" do
      post :add_item, shopping_cart_id: Shop::ShoppingCart.create!, id: product.id, options: {}
      @cart = assigns(:cart)
      @cart.items.size.should be 1
    end

    it "should fail to add item" do
      post :add_item, shopping_cart_id: Shop::ShoppingCart.create!, id: product, options: {}
      @cart = assigns(:cart)
      @cart.should_receive(:add)
      post :add_item, shopping_cart_id: @cart.id, id: product, options: {}
      flash[:alert].should eq (I18n.t 'shop.cart.add.failure')
    end
  end

  describe "DELETE 'remove_item" do
    it "should remove item from cart" do
      post :add_item, shopping_cart_id: Shop::ShoppingCart.create!, id: product, options: {}
      @cart = assigns(:cart)
      @cart.items.size.should be 1
      delete :remove_item, shopping_cart_id: @cart.id, id: @cart.items.first.id
      @cart = assigns(:cart)
      @cart.items.should be_empty
      @cart.should be_empty
    end

    it "should fail to remove item" do
      post :add_item, shopping_cart_id: Shop::ShoppingCart.create!, id: product, options: {}
      @cart = assigns(:cart)
      @cart.should_receive(:remove_item)
      delete :remove_item, shopping_cart_id: @cart.id, id: @cart.items.first.id
      flash[:alert].should eq (I18n.t 'shop.cart.remove.failure')
    end
  end
end
