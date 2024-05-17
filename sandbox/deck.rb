# Deck class contains cards that possibly be chosen

require_relative "card.rb"

class Deck
  def initialize
    @deck = [] 
    @cardsOnScreen = []
  end
  
  # Set deck with 81 different cards
  def setDeck
    color = ["red", "green", "blue"]
    shade = ["fill", "empty", "stripe"]
    shape = ["diamond", "flag", "oval"]
    number = [1, 2, 3]
    numCards = 0
    for i in color do
      for j in shade do
        for l in shape do
          for k in number do
           c = Card.new
           c.setCard(i, j, l, k) 
           @deck[numCards] = c
           numCards+= 1
          end
        end
      end
    end
  end
  
  # Get 12 cards from deck base to screen and delete them in deck base
  def startDeal
    @deck.shuffle!
    for i in 0..11 do
      cardDealt = @deck.delete_at(i)
      @cardsOnScreen.append cardDealt
    end
    printCardsOnScreen
  end
  
  # Print 12 cards with color, shade, shape and number
  def printCardsOnScreen
    for i in (0..@cardsOnScreen.length-1) do
      puts i
      @cardsOnScreen[i].printCard
    end
  end
  
  # Change three cards to screen
  def threeMore(i)
   if (@cardsOnScreen.length < 12 || i == 1) && @deck.length > 0 
     for i in 0..2    
       cardDealt = @deck.delete_at(0)
       @cardsOnScreen.append cardDealt
     end
   end
  end
  
  # Delete three cards from screen
  def clearThree(i, j, k)
   array = [i, j, k]
   array.sort
   @cardsOnScreen.delete_at(k.to_i)
   @cardsOnScreen.delete_at(j.to_i)
   @cardsOnScreen.delete_at(i.to_i)
  end
  attr_reader :deck
  attr_reader :cardsOnScreen
end

