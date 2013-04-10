Feature: Pages have dynamic titles

	As a page visitor
	I want to see different titles on each page
	So that I know which page I am on

Scenario: Home page has a title
	When I am on the home page
	Then I should see "Etusivu | Roydon" in the title

Scenario: Contact page has a title
	When I am on the contact page
  Then I should see "Yhteystiedot | Roydon" in the title

Scenario: Shop page has a title
	When I am on the shop page
  Then I should see "Kauppa | Roydon" in the title

Scenario: Shows page has a title
	When I am on the shows page
  Then I should see "Näyttelyt | Roydon" in the title

Scenario: Stories page has a title
	When I am on the stories page
  Then I should see "Uutiset | Roydon" in the title
