Feature: Pages have dynamic titles

	As a page visitor
	I want to see different titles on each page
	So that I know which page I am on

Scenario: Home page has a title
	When I am on the home page
	Then the title should be "Etusivu | Roydon"

Scenario: Contact page has a title
	When I am on the contact page
	Then the title should be "Yhteystiedot | Roydon"

Scenario: Shop page has a title
	When I am on the shop page
	Then the title should be "Kauppa | Roydon"

Scenario: Shows page has a title
	When I am on the shows page
	Then the title should be "Näyttelyt | Roydon"

Scenario: Stories page has a title
	When I am on the stories page
	Then the title should be "Uutiset | Roydon"
