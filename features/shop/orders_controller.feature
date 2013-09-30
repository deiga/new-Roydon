Feature: OrdersController new should render correct page

  As a developer
  I want the action render the page correctly

Background: Some products exist

  Given the following products exist:
  | name  | price  |
  | Test 1  | 4.2 |

Scenario: Shopping cart contains a few products
  Given I am on the shop page
  Given the following products are in the cart:
    | name  | price  |
    | Test 1  | 4.2 |
  And I am on the shop page
  When I follow "Ostoskori"
  # And I am on the edit shopping cart page
  And I should see "Osta tuotteet"

