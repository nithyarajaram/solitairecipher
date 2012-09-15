Feature: User submits code to decrypt
  
  As a user
  I want to submit my code
  So that I can get it decrypted

  Decryption:
  Given the code is "GLNCQ MJAFF FVOMB JIYCB"

  Step 1: Generate key stream values for each letter in the code.

  After step 1 we have "DWJXH YRFDG TMSHP UURXJ"
  
  Step 2: Generate numbers for all the letters in the code.

  After step 2 we have "7 12 14 3 17  13 10 1 6 6  6 22 15 13 2  10 9 25 3 2"

  Step 3: Generate numbers for all the letters in the key stream.

  After step 3 we have "4 23 10 24 8  25 18 6 4 7  20 13 19 8 16  21 21 18 24 10"

  Step 4:  Subtract the key stream numbers from step 3 from the message numbers in step 2
  If the message number is less than or equal to the key stream number, add 26 to the message number. 
  For eg, 1-22 = 5 (27 - 22)

  After step 4 we have "3 15 4 5 9  14 18 21 2 25  12 9 22 5 12  15 14 7 5 18"

  Step 5: Convert the numbers from step 4 back to letters.

  After step 5 we have "CODEI NRUBY LIVEL ONGER"

  Scenario: Submit code
    Given I was prompted to enter the code
    When I submit "GLNCQ MJAFF FVOMB JIYCB"
    Then I should receive "CODEI NRUBY LIVEL ONGER"
