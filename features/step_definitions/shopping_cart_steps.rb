Given /^the following products are in the cart:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |product|
    find("#product-#{product['name'].parameterize}").click_on('Lisää ostoskoriin')
  end
end

When /^I add "(.*?)" to shopping cart$/ do |product_name|
  find("#product-#{product_name.parameterize}").click_on('Lisää ostoskoriin')
end
