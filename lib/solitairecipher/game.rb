module Solitairecipher

  class Game
    def start
      @output.puts("Do you want to encrypt or decrypt?")
    end

    def submit(intent)
      
      if decrypt?(intent)
        message = ("Enter your code")
      elsif encrypt?(intent)
        message = "Enter your message"
      else
        message = "Please check"
      end
     
      @output.puts(message) 
    
    end

    def keystream(code)
       code = code.gsub(/\s+/, "")
       length = code.length
       keystream = generate_keystream(length)
       @output.puts(keystream)
    end

    def generate_keystream(length)
       @deck = Deck.new
       @result = []
      while @result.length != length
        @deck.move_A
        @deck.move_B
        @deck.triple_cut
        @deck.count_cut
        output_letter = @deck.output_letter 
        @result << output_letter unless output_letter.nil?
      end
     
    end

    def initialize(output)
      @output = output
    end

    def decrypt?(intent)
      intent == 'Decrypt'
    end

    def encrypt?(intent)
      intent == 'Encrypt'
    end

  

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

    def move_A
      move(@deck.index( 'A' ))
    end

    def move_B
      2.times {move(@deck.index('B'))}
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
end
