@wip
Feature: Adding items to shopping cart

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

Scenario: Add product to cart
  Given I am on the shop page
  When I follow "Lisää ostoskoriin" within "Test 4"
  Then show me the page
