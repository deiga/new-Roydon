Given /^the following products are in the shopping cart:$/ do |table|
  # table is a Cucumber::Ast::Table
  @shopping_cart ||= Shop::ShoppingCart.new
  table.hashes.each do |product|
    @shopping_cart.add Shop::Product.create!(product)
  end
end

Given /^the shopping cart is empty$/ do
  pending # express the regexp above with the code you wish you had
end
