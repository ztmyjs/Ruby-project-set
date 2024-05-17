# GUIMain.rb: main controller for the Game of Set. Handles i/o and manipulates
# game state accordingly

require 'ruby2d'
require_relative 'GameOfSet.rb'

# initialize the game. set title and increase height to make room for
# instructions, score, and helper
game = GameOfSet.new
set title: 'The Game of Set'
set background: 'white'
set height: 560

# handles mouse click event. When left click, mouse x and y coordinates are
# read and passed to selector method
on :mouse_down do |event|
  case event.button
  when :left
    x = Window.mouse_x
    y = Window.mouse_y
    game.selector(x, y)
  end
end

# handles keyboard input
on :key_down do |event|
  case event.key
  # player 1 uses s key to check if the current selected cards make a valid set
  when 's'    

    # determine how many cards are selected
    cards = game.selectedCards

    # in the case that exactly three cards are selected and make a valid set
    # there are two possible situations: either the deck is empty or there
    # are more than 12 cards on screen, in which the cards selected will just
    # be removed. Otherwise they need to be replaced by new cards from the 
    # deck. Helper statements displayed if unexpected behavior occurs
    if cards.length == 3 && game.set?(cards) && game.deckLength > 0 && game.dealtLength <= 12
      game.replaceCards(cards)
      game.updateScore(1, true)
      game.updateHelper('')
    elsif cards.length == 3 && game.set?(cards) && (game.dealtLength > 12 || game.deckLength == 0)
      game.removeCards(cards)
      game.updateScore(1, true)
      game.updateHelper('')
    elsif cards.length > 3
      game.updateHelper('More than 3 cards selected!')
    elsif cards.length < 3
      game.updateHelper('Less than 3 cards selected!')
    elsif game.endGame?
      game.updateHelper('Game has ended. Restart program to play again!')
    else
      game.updateHelper('Not a valid set!')
      game.updateScore(1, false)
    end

    # end the game when it's time
    if game.endGame?
      game.endGame
    end
    
    # the code here is the same as above except player 2's score is updated
  when 'k'
    cards = game.selectedCards
    if cards.length == 3 && game.set?(cards) && game.deckLength > 0 && game.dealtLength <= 12
      game.replaceCards(cards)
      game.updateScore(2, true)
      game.updateHelper('')
    elsif cards.length == 3 && game.set?(cards) && (game.dealtLength > 12 || game.deckLength == 0)
      game.removeCards(cards)
      game.updateScore(2, true)
      game.updateHelper('')
    elsif cards.length > 3
      game.updateHelper('More than 3 cards selected!')
    elsif cards.length < 3
      game.updateHelper('Less than 3 cards selected!')
    elsif game.endGame?
      game.updateHelper('Game has ended. Restart the program to play again!')
    else
      game.updateHelper('Not a valid set!')
      game.updateScore(2, false)
    end

    if game.endGame?
      game.endGame
    end

    # add cards to the deck when needed and allowed. display helper messages
    # for wrong behavior
  when 'a'
    if game.deckLength > 0 && !game.hasSet?
      game.addCards
    elsif game.deckLength > 0 && game.hasSet?
      game.updateHelper('Cannot add cards. The dealt cards contain a set!')
    elsif game.deckLength == 0 && game.hasSet?
      game.updateHelper('Deck is empty. No more cards to add!')
    elsif game.endGame?
      game.updateHelper('Game has ended. Restart the program to play again!')
    end
  # selects one card from valid set on screen if conditions are met
  when 'h'
    selected = game.selectedCards
    if selected.length == 0 && game.hasSet?
      game.hint
      game.updateHelper('One card of set selected!')
    elsif !game.hasSet?
      game.updateHelper('No sets in dealt cards!')
    elsif selected.length > 0
      game.updateHelper('Deselect all cards to get hint!')
    end
  end
end

show
