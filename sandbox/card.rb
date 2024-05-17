  # Card class describe a card with 4 different elements: color, shade, shape, number

  # Constructor for Card class
  def initialize
    @color = "red"
    @shade = "fill"
    @shape = "diamond"
    @number = 1
  end

  # Set a single card with four elements
  def setCard(color, shade, shape, number)
    @color = color
    @shade = shade
    @shape = shape
    @number = number
  end
  
  # Print a single card with color, shade, shape and number
  def printCard
    puts "#{@color} #{@shade} #{@shape} #{@number}"
  end
  attr_accessor :color, :shade, :shape, :number
end

