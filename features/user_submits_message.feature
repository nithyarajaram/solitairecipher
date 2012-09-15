Feature: User submits message to encrypt
  
  As a user
  I want to submit my message
  So that I can get it encrypted

  Encryption: 
  Given the message is "Code in Ruby, live longer"
  Step 1: Discard any non A-Z character and uppercase everything. Split them into 
  groups with 5 letters each, using X in the last group to pad

  After Step 1 we have "CODEI NRUBY LIVEL ONGER"

  Step 2: Generate a keystream letter for each letter in the message.

  After step 2 we have "DWJXH YRFDG TMSHP UURXJ"

  Step 3: Convert the message from step 1 into numbers (A=1, B=2)

  After step 3 we have "3 15 4 5 9  14 18 21 2 25  12 9 22 5 12  15 14 7 5 18"

  Step 4: Convert the message from step 2(keystream) into numbers

  After step 4 we have "4 23 10 24 8  25 18 6 4 7  20 13 19 8 16  21 21 18 24 10"

  Step 5: Add the message number of step3 and keystream numbers of step4. Subtract 26 from result
  if it is greater than 26

  After step 5 we have "7 12 14 3 17  13 10 1 6 6  6 22 15 13 2  10 9 25 3 2"

  Step6 6: Convert the numbers back to letters

  After step 6 we have " GLNCQ MJAFF FVOMB JIYCB"

  Scenario: Submit input
    Given I was prompted to enter the message
    When I submit "Code in Ruby, live longer"
    Then I should receive "GLNCQ MJAFF FVOMB JIYCB"



