Feature: Inline homepage signup
  As an unregistered user
  I to use the product straight away
  So I can try it out without registering

  Scenario: User edits homepage CV
    Given I go to the homepage
    When I edit the homepage CV
    Then I should be able to save it and register
