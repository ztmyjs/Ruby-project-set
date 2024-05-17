# Player class contains information of players and game system 
require_relative "card.rb"
require_relative "deck.rb"

  # chooseSet function will let users to choose 3 cards and determine whether set or not. Score will also be calculated. Correct set plus 1 while wrong set minus 1.
  def chooseSet(deck, score)
    puts "\nCurrent Score: #{score}\nEnter 3 numbers with spaces that make a set or type 'a' to add 3: \n"
    input = gets
    numbers = input.split
    input = input.chomp
    if input == "a"
      if checkAll(deck)
        puts "There is a set.\n"
        chooseSet(deck, score)
      else
        deck.threeMore(1)
        deck.printCardsOnScreen
        chooseSet(deck, score)
      end
    elsif numbers.length == 3 && (0..deck.cardsOnScreen.length-1).include?(numbers[0].to_i) && (0..deck.cardsOnScreen.length-1).include?(numbers[1].to_i) && (0..deck.cardsOnScreen.length-1).include?(numbers[2].to_i) && numbers[0].to_i != numbers[1].to_i && numbers[0].to_i != numbers[2].to_i && numbers[1].to_i != numbers[2].to_i
      if checkSet(numbers[0], numbers[1], numbers[2], deck)
        puts "That was a set!\n"
        deck.clearThree(numbers[0], numbers[1], numbers[2])
        deck.threeMore(0)
        deck.printCardsOnScreen
        if gameEnd(deck)
          puts "The game has ended. Final score: #{score+1}\n"
        else
          chooseSet(deck, score + 1)
        end
      else
        puts "That wasn't a set. Try again!"
        chooseSet(deck, score - 1)
      end
    else
      puts "Invalid input."
      chooseSet(deck, score)
    end
  end

  # checkSet function could determine whether 3 cards are set or not. 3 cards are set if count is 4.
  # set determination rule: (c1==c2 && c2==c3) || (c1!=c2 && c2!=c3 && c1!=c3)
  def checkSet(cardOne, cardTwo, cardThree, deck)
    reachedSet = false
    firstCard = deck.cardsOnScreen[cardOne.to_i]
    secondCard = deck.cardsOnScreen[cardTwo.to_i]
    thirdCard = deck.cardsOnScreen[cardThree.to_i]
    
    count = 0
    if firstCard.color == secondCard.color && secondCard.color == thirdCard.color
      count += 1
    elsif firstCard.color != secondCard.color && secondCard.color != thirdCard.color && firstCard.color != thirdCard.color
      count += 1
    end

    if firstCard.number == secondCard.number && secondCard.number == thirdCard.number
      count += 1
    elsif firstCard.number != secondCard.number && secondCard.number != thirdCard.number && firstCard.number != thirdCard.number
      count += 1
    end

    if firstCard.shade == secondCard.shade && secondCard.shade == thirdCard.shade
      count += 1
    elsif firstCard.shade != secondCard.shade && secondCard.shade != thirdCard.shade && firstCard.shade != thirdCard.shade
      count += 1
    end

    if firstCard.shape == secondCard.shape && secondCard.shape == thirdCard.shape
      count += 1
    elsif firstCard.shape != secondCard.shape && secondCard.shape != thirdCard.shape && firstCard.shape != thirdCard.shape
      count += 1
    end
    count == 4
  end 

  # checkAll function will check all possible set combinations from deck base
  def checkAll(deck)
    setExists = false
    for i in 0..(deck.cardsOnScreen.length - 3) do
      for j in (i+1)..(deck.cardsOnScreen.length - 2) do
        for k in (j+1)..(deck.cardsOnScreen.length - 1) do
          if checkSet(i, j, k, deck)
            puts "#{i} #{j} #{k}"
            setExists = true
          end
        end
      end
    end
    setExists
  end
  # gameEnd function will decide whether the game is over
  def gameEnd(deck)
    !checkAll(deck) && deck.deck.length == 0 
  end

