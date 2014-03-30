@javascript
Feature: Initial landing page feature
  As an unregistered user
  When I arrive on the site
  I want to see a template worklist

  @javascript
  Scenario: User arrives on landing page
    Given I go to the homepage
    Then I should see the templates

