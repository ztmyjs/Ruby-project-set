# group4-rubyset

Documentation:
 
Setup:
 
This project is The Game of Set implemented with Ruby on Rails. The only additional library needed to run the game is the “Ruby2D” gem. In the command line, enter
	gem install ruby2d
There will most likely be an error with the installation due to not having the required libraries needed for the Ruby2D gem. The error will list each needed library, so copy the list and in the command line enter
	sudo apt install #{copied list}
After those libraries are successfully installed, re enter the command to install the Ruby2D gem. You are now able to run GUIMain.rb to start the game.
 
Game:
 
The physical card game which we based our game off of includes 81 cards and can be played as a multiplayer or singleplayer game. The 81 cards are all unique. The design class of this game are cards with different shapes, amount of shapes, different coloring and shading. The amount of shapes per card are either one, two or three. The shape itself is either diamonds, flag or oval. The coloring options are red, green, or blue. The last feature is the shading, which is either fill, stripe or empty. Three cards make up one set. In order for cards to classify as a set, for each of the four categories just mentioned, the three cards must have either all of the same or all different features, for each specific feature.
 
Play:

When the game starts, 12 cards are dealt to the screen. The mouse is used to select the cards using the left click. When three cards are selected, the player can press the ‘s’ key to check if it is a valid set. If valid, the player’s score will increase by 1 and the cards will either be replaced or removed depending on the amount of cards dealt and cards remaining in the deck. Otherwise the player will lose one point. If no sets are present, pressing the ‘a’ key will add three more cards or will display a help message if the dealt cards contain a set. The game can be played with one or two players. Single player mode is a good way to practice recognizing sets. The player can press the ‘h’ key for a hint, which selects one card in a valid set. All cards on screen must be deselected in order to use the hint feature. For multiplayer, it is up to the players to decide what rules they want to play by. It is recommended that each player keeps their hand down until calling “set,” at which point the player would take the mouse, select the cards immediately, and press their corresponding set check key (player 2 uses the ‘k’ key). The game ends when there are no sets left on screen and the deck is empty. The winner is displayed on the screen. To play again, close the window and re-run the program.
