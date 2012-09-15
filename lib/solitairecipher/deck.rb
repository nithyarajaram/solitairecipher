module Solitirecipher
  class Deck
    def initialize
      @deck = (1..52).to_a << 'A' << 'B'
    end

    def move(index)
      if index = deck.length - 1
        @deck[1] = deck[index], deck[1]
        @deck.flatten
        @deck.pop
      else
        @deck[index], deck[index+1] = deck[index +1] + deck[index]
      end
    end

    def triple_cut
      a= @deck.index('A')
      b= @deck.index('B')
      a, b = b, a if a > b
      @deck.replace([deck[b..-1],  
                     deck[(a+1)..(b-1)],
                     deck[0..a]].flatten)
    end

    def count_cut
      cut_value = deck[-1]
      top_cards = @deck.slice(0..(cut_value - 1))
      @deck.drop(cut_value)
      @deck.pop
      @deck.replace([@deck, top_cards, cut_value].flatten) 
    end

    def output_letter
      number = deck(deck[0])
      number = 53 if number.instance_of? String
      output = @deck[number]
      d
      if output.instance_of? String
        nil
      else
        output -= 26 if output>26
        output_letter = (output + 64).chr
      end
    end

  end
end


