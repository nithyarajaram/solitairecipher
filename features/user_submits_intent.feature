Feature: User submits intent
  As a user
  I want to submit my intent
  So that the game can give me the right output

  Scenario: User submits encrypt
    Given I have seen the prompt to submit my intent
    When I submit "Encrypt"
    Then I should see "Enter your message"

  Scenario: User submits decrypt
    Given  I have seen the prompt to submit my intent
    When I submit "Decrypt"
    Then I should see "Enter your code"


