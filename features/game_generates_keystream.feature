Feature: Game generates key stream

  As a game
  when a user submits a message or code
  it should be able to generate the corrensponding key stream value

  Generating keystream:

  Solitaire uses a full deck of 52 cards with two disctinct jokers referred to as A & B here
  Assign numbers to cards
  Ace=1, 2 = 2...J = 10 etc

  The order is Club, Diamonds, Hearts, Spades
  Club base = 0, Diamonds base = 13, Hearts Base = 26, Spades base = 39
  Both jokers 53

  Key the deck: One way is to shuffle and arrange. We are going to arrange in order in a circular form
  Ace of Clubs to King of Spaded and then A joker, B Joker.

  Step 1: Move the A joker down 1 card.

  After step 1 we have "1 2 3 ... 52 B A"

  Step 2: Move the B joker down 2 cards

  After step 2 we have "1 B 2 3 4 ... 52 A"

  Step 3: Perform a triple cut around the two jokers. Move all the cards above Joker A below B and vice verca
  The cards between them do not move

  After Step 3 we have "B 2 3 4 ... 52 A 1"

  Step 4: Perform a count cut using the value of the bottom card. Cut as many cards off the top of the deck as the value of the
  bottom card and reinsert them just above the bottom card

  After ste 4 we have "2 3 4 ... 52 A B 1"

  Sep 5: Finding the output letter. Convert the top card to its value and count down as many cards including the top card itself. 
  Look at the card immediately after the count and convert it into a letter. That is the output. If the output card is a joker, no letter is generated
  in the sequence.

  After step 5 we have "D"

  Step 6: Repeat from step 2 if more letters are needed.

  After repeating from step 2 the required number of times, we should get "DWJXH YRFDG TMSHP UURXJ"
  
  Scenario: Generate keystream
    Given the game prompts the user to enter code
    When  user submits code "GLNCQ MJAFF FVOMB JIYCB"
    Then the game should generate "DWJXH YRFDG TMSHP UURXJ"
