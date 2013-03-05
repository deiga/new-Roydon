Feature: New items appear on shop page

Scenario: There are no items
  Given there are no products
  When I am on the shop page
  Then There are no products

Scenario: There are 4 items
  Given there are 4 products
  When I am on the shop page
  Then There are 4 products

Scenario: There are over over 9 items
  Given there are 12 products
  When I am on the shop page
  Then There are 9 products
