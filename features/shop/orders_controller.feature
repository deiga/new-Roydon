Feature: OrdersController actions should perform correctly

  As a developer
  I want the action render the page correctly

Background: Some products exist

  Given the following products exist:
  | name    | price |
  | Test 1  | 4.2   |
  | Testi 2 | 15.0  |
  | Testi 3 | 7.0   |
  | Testi 4 | 14.0  |
  Given I am on the shop page

Scenario: Shopping cart contains a few products
  Given the following products are in the cart:
    | name  | price  |
    | Test 1  | 4.2 |
  When I follow "Ostoskori"
  # And I am on the edit shopping cart page
  Then I should see "Siirry kassalle"
  And I should see "4,20 €"

Scenario: Shopping cart is empty
  Given the shopping cart is empty
  When I am on the new shop order page
  Then I should see "Your cart is empty"

Scenario: Unregistered user can make order
  Given the following products are in the cart:
    | name    | price |
    | Test 1  | 4.2   |
    | Testi 2 | 15.0  |
    | Testi 3 | 7.0   |
    When I follow "Ostoskori"
    And I follow "Siirry kassalle"
    Then fill in the order form
