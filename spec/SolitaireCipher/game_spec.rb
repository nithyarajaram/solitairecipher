require 'spec_helper'

module Solitairecipher 
  describe Game do
    
    before(:each) do
      @output = double('output').as_null_object
      @game = Game.new(@output)
    end

    describe "start" do
      it "sends a message asking if the user wants to encrypt or decrypt" do
        @output.should_receive(:puts).with("Do you want to encrypt or decrypt?")
        @game.start
    end

    describe "submit" do
      it "sends a message asking for the code if the intent is decrypt" do
        @output.should_receive(:puts).with("Enter your code")
        @game.start
        @game.submit('Decrypt')
      end 

      it "sends a message asking for the message if the intent is encrypt" do
       @output.should_receive(:puts).with("Enter your message")
       @game.start
       @game.submit('Encrypt')
      end

      it "sends a message asking the user to check if the intent is not either" do
       @output.should_receive(:puts).with("Please check")
       @game.start
       @game.submit('decipher')
      end
  end

    describe "keystream" do
      it "generates appropriate keystream when code is submitted by user" do
        @output.should_receive(:puts).with("DWJXH YRFDG TMSHP UURXJ")
        @game.start
        @game.keystream('GLNCQ MJAFF FVOMB JIYCB')
      end
    end

end
end
end


     
