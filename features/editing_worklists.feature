@javascript @blackbox
Feature: Inline homepage editing
  As an unregistered user
  I to use the product straight away
  So I can try it out without registering

  Background:
    Given I go to the homepage

  Scenario: User adds a section to the worklist
    Given I edit the homepage CV
    And I save my changes
    When I add another section and save it
    Then I should see my new section in the rendered version

  Scenario: User removes e section from the worklist
    Given I edit the homepage CV
    And I save my changes
    When I add another section and save it
    Then I should be able to remove it
