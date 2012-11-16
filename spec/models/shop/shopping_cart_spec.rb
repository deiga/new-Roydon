require 'spec_helper'

describe Shop::ShoppingCart do

  describe "calling empty" do
    it "should do nothing on an empty cart" do
      empty_shopping_cart = Shop::ShoppingCart.create!
      empty_shopping_cart.empty
      empty_shopping_cart.size.should be 0
    end

    it "should empty an non-empty cart" do
      cart = Shop::ShoppingCart.create!
      cart.add Shop::Product.create!(:name => 'Test 42', :price => 2.3)
      cart.size.should be 1
      cart.empty
      cart.size.should be 0
    end
  end

  describe "item manipulation" do
    it "should have 1 item after adding 1 item" do
      cart = Shop::ShoppingCart.create!
      cart.add Shop::Product.create!(name: 'Test 23', price: 4.2)
      cart.size.should be 1
    end

    it "should have 1 less item after item quantitty goes to 0" do
      cart = Shop::ShoppingCart.create!
      cart.add Shop::Product.create!(name: 'Test 23', price: 4.2)
      cart.add Shop::Product.create!(name: 'Test 24', price: 4.2)
      cart.size.should be 2
      cart.items.first.quantity = 0
      cart.size.should be 1
    end

    it "should have 2 items after incrementation" do
      cart = Shop::ShoppingCart.create!
      cart.add Shop::Product.create!(name: 'Test 25', price: 4.2)
      cart.size.should be 1
      cart.items.first.quantity = 2
      cart.size.should be 2
    end
  end
end
