# GUICard.rb: defines Card class; used to model each card in 81 card deck on
# GUI

require 'ruby2d'

class Card

  #attributes
  attr_accessor :number
  attr_accessor :color
  attr_accessor :shading
  attr_accessor :shape

  def initialize(name, number, color, shading, shape, x, y)
    @number = number
    @color = color
    @shading = shading
    @shape = shape

    # image display for card. remove clears image from screen, will be enabled
    # when card is dealt
    @image = Image.new(
      name,
      x: x, y: y,
      width: 96, height: 135,
      z: 2
    )
    @image.remove

    # gray rectangle behind card to represent being 'selected'
    @selected = false
    @highlight = Rectangle.new(
      x: x, y: y,
      width: 96, height: 135,
      color: 'gray',
      z: 1
    )
    @highlight.remove
  end

  # toggles gray background for card on screen
  def select
    if !@selected
      @highlight.add
      @selected = true
    else
      @highlight.remove
      @selected = false
    end
  end

  # updates coordinates for image and highlight; repositions in window
  def reposition(x, y)
    @image.x = x
    @image.y = y

    @highlight.x = x
    @highlight.y = y
  end

  # remove image and highlight; clears card from window
  def clear
    @image.remove
    @highlight.remove
  end

  # returns the image instance
  def image
    @image
  end

  # returns if selected or not
  def selected
    @selected
  end

end

