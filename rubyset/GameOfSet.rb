# GameOfSet.rb: represents an instance of the Game of Set for GUI

require 'ruby2d'
require_relative 'GUICard.rb'
require_relative 'GUIDeck.rb'

class GameOfSet
  
  # intialize 81 card deck using GUIDeck class method
  @@deck = createDeck

  # array that will hold the cards currently dealt/visible
  @@dealt = Array.new

  # setup game window 
  def initialize

    # start with 12 cards. pop them off the deck and reposition to fill three
    # rows. add image to screen to make visible
    for i in (0...12)
      @@dealt[i] = @@deck.pop
      @@dealt[i].reposition((i - 4 * (i/4)) * 96, (i/4) * 135)
      @@dealt[i].image.add
    end

    # display instructions below dealt cards
    @instructions = Array.new(5)
    @instructions[0] = Text.new(
      "Left click on cards to select/deselect.",
      x: 15, y: 420,
      size: 12,
      color: 'black'
    )
    @instructions[1] = Text.new(
      "Press 'a' key to add cards.",
      x: 15, y: 440,
      size: 12,
      color: 'black'
    )
    @instructions[2] = Text.new(
      "Player1: press 's' key to check set.",
      x: 15, y: 460,
      size: 12,
      color: 'black'
    )
    @instructions[3] = Text.new(
      "Player2: press 'k' key to check set.",
      x: 15, y: 480,
      size: 12,
      color: 'black'
    )
    @instructions[4] = Text.new(
      "Press 'h' key for hint. Must have no cards selected.",
      x: 15, y: 500,
        size: 12,
        color: 'black'
    )

    # create the helper. displays tips on bottom of window when user exhibits
    # unexpected behavior (i.e. attempting to check a set with only two cards
    # selected)
    @helper = Text.new(
      "Help:",
      x: 15, y: 525,
      size: 12,
      color: 'red',
      style: 'bold'
    )

    # player scores start at zero
    @p1score = 0
    @p2score = 0

    # display for each player's score
    @scoreboard = Array.new(2)
    @scoreboard[0] = Text.new(
      "Player1: 0",
      x: 500, y: 430,
      size: 15,
      color: 'black',
      style: 'bold'
    )
    @scoreboard[1] = Text.new(
      "Player2: 0",
      x: 500, y: 460,
      size: 15,
      color: 'black',
      style: 'bold'
    )

  end

  # selects cards based on given mouse input x and y
  def selector(x, y)
    for i in (0...@@dealt.length)
      if @@dealt[i].image.contains? x , y
        @@dealt[i].select
      end
    end

  end

  # determines if a given set of Cards of size three is an acceptable set 
  # based on the rules of the game
  def set?(cards)

    # length 3 arrays for each attribute of the three Cards
    number = [cards[0].number, cards[1].number, cards[2].number]
    color = [cards[0].color, cards[1].color, cards[2].color]
    shading = [cards[0].shading, cards[1].shading, cards[2].shading]
    shape = [cards[0].shape, cards[1].shape, cards[2].shape]

    # remove duplicates
    number.uniq!
    color.uniq!
    shading.uniq!
    shape.uniq!

    # attributes must be all same or all different. if one array has a length
    # of two, then there are two same and one different, which is not allowed
    return !(number.length == 2 || color.length == 2 || shading.length == 2 || shape.length == 2)
  end

  # checks if current dealt cards contain a valid set
  def hasSet?

    # store all possible combinations of three of the Cards dealt
    possibleSets = @@dealt.combination(3).to_a
    # store all valid sets from previous array in new array
    actualSets = possibleSets.select {|cards| set?(cards)}
    # length will be greater than zero if a valid set combination is found
    return actualSets.length > 0
  end

  # selects one card from one of the valid sets in the dealt cards
  def hint
    possibleSets = @@dealt.combination(3).to_a
    actualSets = possibleSets.select {|cards| set?(cards)}

    actualSets[0][0].select
  end

  # determines the number of cards on the screen currently selected
  def selectedCards
    return @@dealt.select {|card| card.selected}
  end

  # adds three more cards if no valid set is present in dealt cards
  def addCards
    @@dealt.push @@deck.pop
    @@dealt.push @@deck.pop
    @@dealt.push @@deck.pop
    
    updateDisplay
  end

  # replaces cards after a set is found by user and removed by the program
  def replaceCards(cards)
    for i in (0..2)
      @@dealt[@@dealt.index(cards[i])] = @@deck.pop
      cards[i].clear
    end
    updateDisplay
  end

  # removes cards from dealt array; for when there are more than 12 cards on
  # the screen or when the deck is empty
  def removeCards(cards) 
    for i in (0...cards.length)
      cards[i].clear
      @@dealt.delete(cards[i])
    end
    updateDisplay
  end

  # repositions the cards currently dealt in three rows
  def updateDisplay
    length = @@dealt.length
    columns = length/3
    for i in (0...length)
      @@dealt[i].reposition((i - columns*(i/columns)) * 96, (i/columns) * 135)
      @@dealt[i].image.add
    end
  end

  # changes what is displayed by the helper text
  def updateHelper(string)
    @helper.remove
    @helper = Text.new(
      'Help: ' + string,
      x: 15, y: 525,
      size: 12,
      color: 'red',
      style: 'bold'
    )
  end

  # updates player scores; for when set is found or wrong attempt tried
  def updateScore(player, correct)
    case player
    when 1
      if correct
        @p1score += 1
      elsif !correct && @p1score != 0
        @p1score -= 1
      end
    when 2
      if correct
        @p2score += 1
      elsif !correct && @p2score != 0
        @p2score -= 1
      end
    end

    updateScoreboard
  end

  # updates the displayed scores on the screen
  def updateScoreboard
    @scoreboard[0].remove
    @scoreboard[0] = Text.new(
      "Player1: " + @p1score.to_s,
      x: 500, y: 430,
      size: 15,
      color: 'black',
      style: 'bold'
    )

    @scoreboard[1].remove
    @scoreboard[1] = Text.new(
      "Player2: " + @p2score.to_s,
      x: 500, y: 460,
      size: 15,
      color: 'black',
      style: 'bold'
    )
  end

  # when the deck is empty and there are no more sets present in the dealt
  # cards, the game is over
  def endGame?
    return @@deck.length == 0 && !hasSet?
  end

  # clear remaining cards, determine winnner and display final message to user
  def endGame
    winner = ""
    for card in @@dealt
      card.clear
    end

    @@dealt.clear

    if @p1score > @p2score
      winner = "Player1 wins!"
    elsif @p2score > @p1score
      winner = "Player2 wins!"
    else
      winner = "It's a tie!"
    end

    finalMessage = Text.new(
      winner,
      x: 320, y: 250,
      size: 20,
      color: 'red',
      style: 'bold'
    )
  end

  # number of cards remaining in deck
  def deckLength
    @@deck.length
  end

  # number of cards currently on the screen
  def dealtLength
    @@dealt.length
  end
end

