class Output

  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

end

output ||= Output.new


Given /^I am not yet playing$/ do
end

When /^I start the game$/ do
  game = Solitairecipher::Game.new(output)
  game.start
end

Then /^I should see the message "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Given /^I have seen the prompt to submit my intent$/ do
end

When /^I submit "(.*?)"$/ do |intent|
  game = Solitairecipher::Game.new(output)
  game.start
  game.submit(intent)
end

Then /^I should see "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Given /^the game prompts the user to enter code$/ do
end

When /^user submits code "(.*?)"$/ do |code|
  game = Solitairecipher::Game.new(output)
  game.start
  game.keystream(code)
end

Then /^the game should generate "(.*?)"$/ do |keystream|
  game.output.messages.should include(keystream)
end


