### Game of Set

### Documentation 
This project is a game set in Ruby. The GUI verson of the game uses the Ruby graphics library "Ruby2D," which needs to be installed before starting this game. In the ruby command line, type out “gem install ruby2d”. After running this statement, a warning will most likely appear on the screen saying which libraries need to be installed in order to use the game. After seeing this warning, call "sudo apt install” with the copied list of libraries above.  After this, the player should be able to run the GUIMain.rb file.
 
The physical card game which we based our game off of includes 81 cards and can be played as a multiplayer or singleplayer game. The 81 cards are all unique. The design class of this game are cards with different shapes, amount of shapes, different coloring and shading. The amount of shapes per card are either one, two or three. The shape itself is either diamonds, flag or oval. The coloring options are red, green, or blue. The last feature is the shading, which is either fill, stripe or empty. Three cards make up one set. In order for cards to classify as a set for each of the four categories just mentioned, the three cards must have either all of the same or all different features, for each specific feature.
 
To start the game, 12 cards will be dealt. The user will be the player of this game. The player will have to look through the deck given and determine if there is a set.  The game cards are shown on the screen visually. In order to pick the cards, the player clicks on different cards. The cards can be selected by left clicking on the image, and deselected by clicking again on the same image. Exactly three cards must be picked if a set is found. If there are not exactly three, the player will be notified and either has to deselect some cards, or select more cards in order to meet the three.  Once three are picked, the player should use the ‘s’ key on their keyboard in order to check for a set. If the user correctly picks a set, those three cards will be replaced with new ones from the deck. Otherwise, there will be a message that what was picked was not a set. If there is not a set, the ‘a’ key needs to be picked in order to add three more cards.  
 
The game continues with the process of dealing by threes into the deck with the ‘a’ key. The player's score is kept by a count of 1. Score adds one if a set is picked correctly, and score is penalized if the set is guessed wrong. The game ends when there are no sets left between the cards on screen and what is left in the deck.

### What is a SET?
A set consists of three cards meeting all of these conditions:
* They all have the same color or have three different colors.
* They all have the same number or have three different numbers.
* They all have the same shape or have three different shape.
* They all have the same shade or have three different shade.

