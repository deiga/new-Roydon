require 'spec_helper'

describe "routes for Shopping Carts" do

  before(:each) do
    @cart = Shop::ShoppingCart.create!
  end

  after(:each) do
    @cart.destroy
  end

  it "routes shop_shopping_cart_add_item_path to shopping carts controller" do

    product = FactoryGirl.build(:product, name: 'Test 1', price: '2.34')
    expect(post: shop_shopping_cart_add_item_path(@cart.id, product.id)).
      to route_to("shop/shopping_carts#add_item", shopping_cart_id: @cart.id.to_s, id: product.id.to_s)
  end

  it "routes shop_shopping_cart_remove_item_path to shopping carts controller" do
    product = FactoryGirl.build(:product, name: 'Test 1', price: '2.34')
    expect(delete: shop_shopping_cart_remove_item_path(@cart.id, product.id)).
      to route_to("shop/shopping_carts#remove_item", shopping_cart_id: @cart.id.to_s, id: product.id.to_s)
  end
end
