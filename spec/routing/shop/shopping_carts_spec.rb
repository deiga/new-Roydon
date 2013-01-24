require 'spec_helper'

describe "routes for Shopping Carts" do
  it "routes shop_shopping_cart_add_item_path to shopping carts controller" do
    cart = Shop::ShoppingCart.new
    product = FactoryGirl.build(:product, name: 'Test 1', price: '2.34')
    expect(get: shop_shopping_cart_add_item_path(cart.id, product.id)).
      to route_to("shop/shopping_carts#add_item", shopping_cart_id: cart.id.to_s, id: product.id.to_s)
  end
  it "routes shop_shopping_cart_remove_item_path to shopping carts controller" do
    cart = Shop::ShoppingCart.new
    product = FactoryGirl.build(:product, name: 'Test 1', price: '2.34')
    expect(get: shop_shopping_cart_remove_item_path(cart.id, product.id)).
      to route_to("shop/shopping_carts#remove_item", shopping_cart_id: cart.id.to_s, id: product.id.to_s)
  end
end
