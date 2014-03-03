Feature: Shopping cart

  As a buyer
  I want to be able to add products to the cart
  So that I can buy them

Background: Some products exist

  Given the following products exist:
  | name  | price |
  | Testi 1 | 5.0   |
  | Testi 2 | 15.0  |
  | Testi 3 | 7.0   |
  | Testi 4 | 14.0  |
  Given I am on the shop page

Scenario: Add product to cart
  When I add "Testi 4" to shopping cart
  Then I should see "Testi 4" in the selector "#shopping-cart"

Scenario: Shopping Cart contains a few products
  Given the following products are in the cart:
  | name  | price |
  | Testi 1 | 5.0   |
  | Testi 2 | 15.0  |
  | Testi 3 | 7.0   |
  | Testi 4 | 14.0  |
  Then I should see "41 €"

Scenario: Shopping cart is empty
  Given the shopping cart is empty
  When I follow "Ostoskori"
  Then I should be on the edit shop shopping cart page
  And I should see "Ei tuotteita"
