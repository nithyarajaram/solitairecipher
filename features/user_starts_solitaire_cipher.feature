Feature: User starts Solitaire Cipher

  As a user
  I want to start Solitaire Cipher
  In order to encrypt or decrypt

  Scenario: Start game
    Given I am not yet playing
    When I start the game
    Then I should see the message "Do you want to encrypt or decrypt?"



