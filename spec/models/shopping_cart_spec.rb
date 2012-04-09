require 'spec_helper'

describe ShoppingCart do
  
  describe "Emptying" do
    it "should do nothing on an empty cart" do
      empty_shopping_cart = ShoppingCart.new
      empty_shopping_cart.empty
      empty_shopping_cart.size.should be 0
    end

    it "should empty an non-empty cart" do
      cart = ShoppingCart.new
      cart.add Product.new
      cart.size.should be 1
      cart.empty
      cart.size.should be 0
    end
  end
end
