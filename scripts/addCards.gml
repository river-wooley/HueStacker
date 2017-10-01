//addCards()

if(instance_number(AbstractCard) == MAX_CARDS){
    show_message("You lose!");
    game_end();
}

var multiplierX = irandom(3);
var multiplierY = irandom(3);

if(instance_number(AbstractCard) < MAX_CARDS){
    show_debug_message("Adding cards...");
    var currentX = MIN_X + multiplierX * 128, currentY = MIN_Y + multiplierY * 128;
    
    for(var i = 0; i < instance_number(AbstractCard); i++){
        var otherCard = instance_find(AbstractCard, i);
        if(abs(currentX - otherCard.x) < global.collisionDist && abs(currentY - otherCard.y) < global.collisionDist){
            show_debug_message("Rerolling...");
            addCards(); //collision -> reroll
            return 0;
        }
    }
    var nextCard = irandom(1);
    show_debug_message("Creating...");
    if(nextCard == 0 || !instance_number(AbstractCard) <= 5)
        instance_create(currentX, currentY, Card0);
    else if(nextCard == 1)
        instance_create(currentX, currentY, Card1);
}
