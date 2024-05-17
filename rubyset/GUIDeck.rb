# GUIDeck.rb: initalizes each card in 81 card deck for the Game of Set. image
# files are stored in a folder 'card_images.zip' that needs to be unzipped

require 'ruby2d'
require_relative 'GUICard.rb'

def createDeck

  deck = Array.new(81)
  index = 0;

  # iterate through each possible attribute combination and initialize card
  # for each. store in array. png file names match pattern shown below
  for number in ['one','two','three']
    for color in ['green','blue','pink']
      for shading in ['open','shaded','solid']
        for shape in ['oval','diamond','square']
          name = 'card_images/'+number+'_'+color+'_'+shading+'_'+shape+'.png'
          deck[index] = Card.new(name, number, color, shading, shape, 0, 0)
          index += 1
        end
      end
    end
  end

  # shuffles the cards
  deck.shuffle!

  return deck
end
