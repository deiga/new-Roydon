Given /^the following products are in the cart:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |product|
    steps %Q{
      When I add "#{product['name']}" to shopping cart
    }
  end
end

When /^I add "(.*?)" to shopping cart$/ do |product_name|
  find("#product-#{product_name.parameterize}").click_on('Lisää ostoskoriin')
end
