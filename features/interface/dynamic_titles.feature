Feature: Pages have dynamic titles

	As a page visitor
	So that I know which page I am on
	I want to see different titles on each page

Scenario: Home page has a title
	When I go to the home page
	Then the title should be "Etusivu | Roydon"

Scenario: Contact page has a title
	When I go to the contact page
	Then the title should be "Yhteystiedot | Roydon"

Scenario: Shop page has a title
	When I go to the shop page
	Then the title should be "Kauppa | Roydon"

Scenario: Shows page has a title
	When I go to the shows page
	Then the title should be "Näyttelyt | Roydon"

Scenario: Stories page has a title
	When I go to the stories page
	Then the title should be "Uutiset | Roydon"
