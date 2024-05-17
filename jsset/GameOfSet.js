/**
 * Main code 
 */
let game = new GameOfSet();


/**
 * Card class
 */

/**
 * Constructor for card object
 */
function Card(number, color, shading, shape, imageName){
    this.number = number;
    this.color = color;
    this.shading = shading;
    
    this.shape = shape;
    this.id = number + color + shading + shape;
    this.imageName = imageName;

    this.tag = cardTag(number, color, shading, shape, imageName);
    this.tag.select = select;
}

function cardTag(number, color, shading, shape, imageName){
    var imageTag = document.createElement("img");
    imageTag.setAttribute("src", imageName);
    var elementTag = document.createElement("td");
    elementTag.setAttribute("id", number + color + shading + shape);
    elementTag.setAttribute("class", "not-selected");
    elementTag.setAttribute("onclick", "this.select()");
    elementTag.appendChild(imageTag);
    
    return elementTag;
}



function select(){

    if (this.getAttribute("class") == "selected"){
        this.setAttribute("class", "not-selected");
    } else {
        this.setAttribute("class", "selected");
    }


}

/**
 * Method for creating the deck.
 */

function shuffleDeck(deck){
    for (var i = deck.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = deck[i];
        deck[i] = deck[j];
        deck[j] = temp;
    }
}

function createDeck(){
    let deck = new Array(81);
    var index = 0;

    var number = ["one", "two", "three"];
    var color = ["green", "blue", "pink"];
    var shading = ["open", "shaded", "solid"];
    var shape = ["oval", "diamond", "square"];

    for (let w = 0; w < 3; w++){
        for (let x = 0; x < 3; x++){
            for (let y = 0; y < 3; y++){
                for (let z = 0; z < 3; z++){
                    var imageName = "card_images/" + number[w] + "_" + color[x] + "_" + shading[y] + "_" + shape[z] + ".png"; 
                    deck[index] = new Card(number[w], color[x], shading[y], shape[z], imageName);
                    index++;
                }
            }
        }
    }


    shuffleDeck(deck);

    return deck;
}

/**
 *  Creates initial dealt card set
 */

function dealCards(deck){
    let dealt = new Array();
    for (let i = 0; i < 12; i++){
        dealt.push(deck.pop());
    }


    return dealt;
}

/**
 * Updates cards displayed on webpage
 */

function display(dealt){
    var row1 = document.getElementById("row1");
    var row2 = document.getElementById("row2");
    var row3 = document.getElementById("row3");

    for (let i = 0; i < dealt.length; i++){

        if (i % 3 == 0){
            row1.appendChild(dealt[i].tag);
        } else if (i % 3 == 1) {
            row2.appendChild(dealt[i].tag);
        } else {
            row3.appendChild(dealt[i].tag);
        }
    }
}

/**
 * GameOfSet class
 */

function GameOfSet(){
    this.deck = createDeck();
    this.dealt = dealCards(this.deck);
    this.score1 = 0;
    this.score2 = 0;
    display(this.dealt);

}

/**
 * Game engine functions
 */

/**
 * Checks if game is over
 */

function gameOver(){
    return (!hasSet(game.dealt) && game.deck.length == 0);
}

/**
 * Declares winner
 */

function endGame(){
    if (game.score1 > game.score2){
        window.alert("GAME OVER: Player 1 Wins!!!");
    } else if (game.score1 < game.score2){
        window.alert("GAME OVER: Player 2 Wins!!!");
    } else {
        window.alert("GAME OVER: It's a Tie!!!");
    }
}

/**
 * Checks if a given set is a valid set
 */

 function checkSet(cards){
	// length 3 arrays for each attribute of the three Cards
	    let number = [cards[0].number, cards[1].number, cards[2].number];
    	let color = [cards[0].color, cards[1].color, cards[2].color];
    	let shading = [cards[0].shading, cards[1].shading, cards[2].shading];
    	let shape = [cards[0].shape, cards[1].shape, cards[2].shape];

    	//change to array of set to remove duplicates
    	let uniqueNumber = new Set(number);
    	let uniqueColor = new Set(color);
    	let uniqueShading = new Set(shading);
    	let uniqueShape = new Set(shape);

    	return !(uniqueNumber.size == 2 || uniqueColor.size == 2 || uniqueShading.size == 2 || uniqueShape.size == 2);
}

/**
 * Checks if there is a valid set in the dealt cards
 */

 function hasSet(dealt){
	//put all of the possible combinations of 3 from dealt into an array
    var possibleSets = new Array();
    var actualSets = new Array();

	for (let i = 0; i < dealt.length; i++){
    		for (let j = i + 1; j < dealt.length; j++){
    			for (let x = j + 1; x < dealt.length; x++){
        			possibleSets.push([dealt[i], dealt[j], dealt[x]]);
        		}
        	}
        }
        for (let i = 0; i < possibleSets.length; i++){ 
        	if (checkSet(possibleSets[i])){
        		actualSets.push(possibleSets[i]);
        	}
        }
        return actualSets.length > 0
}

/**
 * Number of selected cards
 */

function numSelected(){
    var count = 0;
    for (let i = 0; i < game.dealt.length; i++){
        if (game.dealt[i].tag.getAttribute("class") == "selected"){
            count++;
        }
    }

    return count;
}

/**
 * Array of cards selected
 */

function getSelectedCards(){

    let selectedCards = new Array();
    for (let i = 0; i < game.dealt.length; i++){
        if (game.dealt[i].tag.getAttribute("class") == "selected"){
            selectedCards.push(game.dealt[i]);
        }
    }

    return selectedCards;
}

/**
 * Removes a set of cards without replacing
 */

function removeCards(cards){
    for (let i = 0; i < 3; i++){
        cards[i].tag.parentNode.removeChild(cards[i].tag);
    }

    game.dealt = game.dealt.filter(card => card.tag.getAttribute("class") != "selected");
}

/**
 * Replaces a set of cards on screen
 */

function replaceCards(cards){
    game.dealt = game.dealt.filter(card => card.tag.getAttribute("class") != "selected");
    
    for (let i = 0; i < 3; i++){
        let newCard = game.deck.pop();
        cards[i].tag.parentNode.appendChild(newCard.tag);
        game.dealt.push(newCard);
        cards[i].tag.parentNode.removeChild(cards[i].tag);
    }
}

/**
 * Adds cards if allowed when user pushes ADD button
 */

function addCards(){
    if (gameOver()){
        window.alert("Game has ended! Refresh the page to play again!");
    } else if (!hasSet(game.dealt)){
    var row1 = document.getElementById("row1");
    var row2 = document.getElementById("row2");
    var row3 = document.getElementById("row3");

    var new1 = game.deck.pop();
    var new2 = game.deck.pop();
    var new3 = game.deck.pop();

    game.dealt.push(new1);
    game.dealt.push(new2);
    game.dealt.push(new3);

    row1.appendChild(new1.tag);
    row2.appendChild(new2.tag);
    row3.appendChild(new3.tag);
    } else if (game.deck.length == 0) {
        window.alert("Cannot add cards. There are no more cards in the deck!");
    } else {
        window.alert("Cannot add cards. There is a set in the dealt cards!");
    }
}

/**
 * Gives user a hint on request
 */

function hint(){
    var dealt = game.dealt;
    if (gameOver()){
        window.alert("Game has ended! Refresh the page to play again!");
    } else if (hasSet(dealt)){
        var possibleSets = new Array();
    var actualSets = new Array();

	for (let i = 0; i < dealt.length; i++){
    		for (let j = i + 1; j < dealt.length; j++){
    			for (let x = j + 1; x < dealt.length; x++){
        			possibleSets.push([dealt[i], dealt[j], dealt[x]]);
        		}
        	}
        }
        for (let i = 0; i < possibleSets.length; i++){ 
        	if (checkSet(possibleSets[i])){
        		actualSets.push(possibleSets[i]);
        	}
        }
        actualSets[0][0].tag.setAttribute("class", "selected");
    } else {
        window.alert("No valid sets present!");
    }
}

/**
 * Controller and event functions
 */

/**
 * User calls "set"
 */

function setButton(){
    if (gameOver()){
        window.alert("Game has ended! Refresh the page to play again!");
    } else if (numSelected() == 3){
        let selectedCards = getSelectedCards();
        if (checkSet(selectedCards)) {
            game.score1++;
            if (game.dealt.length > 12 || game.deck.length == 0){
                removeCards(selectedCards);
            } else {
               replaceCards(selectedCards);
            }
            if (gameOver()){
                endGame();
            }
        } else {
            if (game.score1 > 0){
                game.score1--;
            }
            window.alert("Not a valid set!");
        }
        updateScore();
    } else {
        window.alert("Must have three cards selected to check for a set!");
    }
}

function setButton2(){
    if (gameOver()){
        window.alert("Game has ended! Refresh the page to play again!");
    } else if (numSelected() == 3){
        let selectedCards = getSelectedCards();
        if (checkSet(selectedCards)) {
            game.score2++; 
            if (game.dealt.length > 12 || game.deck.length == 0){
                removeCards(selectedCards);
            } else {
               replaceCards(selectedCards);
            }
            if (gameOver()){
                endGame();
            }
        } else {
            if (game.score2 > 0){
                game.score2--;
            }
            
            window.alert("Not a valid set!");
        }
        updateScore();
    } else {
        window.alert("Must have three cards selected to check for a set!");
    }
}

/**
 * Update score on screen
 */

function updateScore(){
    var p1 = document.getElementById("player1Score");
    var p2 = document.getElementById("player2Score");

    p1.firstChild.nodeValue = "Player1: " + game.score1;
    p2.firstChild.nodeValue = "Player2: " + game.score2;
}


