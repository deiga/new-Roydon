When(/^I am on the (.*) page$/) do |page_name|
  visit send(page_name.split(/\s+/).push('path').join('_').to_sym)
end

When(/^I follow "(.*?)"(?: in the selector "(.*?)")?$/) do |link_name, selector|
  if selector
    find(selector).click_on(link_name)
  else
    find_link(link_name).trigger('click')
  end
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

Then(/^I submit the form "(.*?)"$/) do  |button|
  click_button(button)
end

Then(/^I should be on the (.*) page$/) do |page_name|
  object_id = current_path.match(BSON_ID_REGEX).to_s
  path_name = page_name.split(/\s+/).push('path').join('_').to_sym
  if object_id.present?
    expect(current_path).to eq send(path_name, object_id)
  else
    expect(current_path).to eq send(path_name)
  end
end
