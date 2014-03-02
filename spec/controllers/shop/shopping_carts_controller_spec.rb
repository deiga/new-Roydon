require 'spec_helper'

describe Shop::ShoppingCartsController do

  subject(:cart) { FactoryGirl.create(:cart) }
  let(:product) { FactoryGirl.create(:product, name: "Test product", price: 5.3) }

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', id: cart.id
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: cart.id
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', id: cart.id
      response.should redirect_to shop_path
    end
  end

  describe "Addition and deletion of items" do
    before(:each) do
      post :add_item, shopping_cart_id: cart.id, id: product.id, options: {}
    end

    context "POST 'add_item'" do
      it "should have one product in cart" do
        cart.items.size.should be 1
      end

      # it "should fail to add item" do
      #   cart.should_receive(:add)
      #   post :add_item, shopping_cart_id: cart.id, id: product, options: {}
      #   flash[:alert].should eq (I18n.t 'shop.cart.add.failure')
      # end
    end

    context "DELETE 'remove_item" do
      it "should remove item from cart" do
        cart.items.size.should be 1
        delete :remove_item, shopping_cart_id: cart.id, id: cart.items.first.id
        cart = assigns(:cart)
        cart.items.should be_empty
        cart.should be_empty
      end

      # it "should fail to remove item" do
      #   cart.should_receive(:remove_item)
      #   delete :remove_item, shopping_cart_id: cart.id, id: cart.items.first.id
      #   flash[:alert].should eq (I18n.t 'shop.cart.remove.failure')
      # end
    end
  end
end
