When(/^I am on the (.*) page$/) do |page_name|
  visit send(page_name.split(/\s+/).push('path').join('_').to_sym)
end

When(/^I follow "(.*?)"$/) do |link_name|
  click_on(link_name)
end

Then(/^I should see "(.*?)" in the title$/) do |expected|
  page.should have_title(expected)
end

Then(/^I should see "(.*?)"(?: in the selector "(.*?)")?$/) do |expected, selector|
  if selector
    page.should have_selector selector, text: expected
  else
    page.should have_content expected
  end
end

Then /^show me the page$/ do
  save_and_open_page
end
