Feature: Shopping Cart can calculate it's price

	As a buyer
	I want to be able to see the price of my order

Background: products in shopping cart

  Given the following products are in the cart:
  | name	| price |
  | Testi 1 | 5.0  	|
  | Testi 2 | 15.0 	|
  | Testi 3 | 7.0   |
  | Testi 4 | 14.0 	|

Scenario: Shopping Cart contains a few products
	Given I am on the shop page
	Then I should see "41.0 €"
