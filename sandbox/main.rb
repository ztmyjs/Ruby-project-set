#this is the main file
require_relative "deck.rb"
require_relative "play.rb"

puts "Welcome to the game of set."
d = Deck.new
d.setDeck
d.startDeal
chooseSet(d, 0) 
