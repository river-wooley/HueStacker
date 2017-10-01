//Moves the cards based on user input.

var up = keyboard_check(vk_up) || keyboard_check(ord('W'));
var left = keyboard_check(vk_left) || keyboard_check(ord('A'));
var down = keyboard_check(vk_down) || keyboard_check(ord('S'));
var right = keyboard_check(vk_right) || keyboard_check(ord('D'));

global.uniqueMove = false;
var newCard = false;

if(up){
    while(y > MIN_Y && !place_meeting(x, y - global.collisionDist, AbstractCard)){ //move card
        y -= 1;
        global.uniqueMove = true;
    }
    
    if(place_meeting(x, y - global.collisionDist, object_index)){ //if collision, make new card
        instance_destroy();
        with(instance_nearest(x, y - global.collisionDist, object_index)){
            instance_change(object_index + (2 - global.difficulty), true);
        }
        newCard = true;
    }
}

else if(left){
    while(x > MIN_X && !place_meeting(x - global.collisionDist, y, AbstractCard)){ //move card
        x -= 1;
        global.uniqueMove = true;
    }
    
    if(place_meeting(x - global.collisionDist, y, object_index)){ //if collision, make new card
        instance_destroy();
        with(instance_nearest(x - global.collisionDist, y, AbstractCard)){
            instance_change(object_index + (2 - global.difficulty), true);
        }
        newCard = true;
    }
}

else if(down){
    while(y < MAX_Y && !place_meeting(x, y + global.collisionDist, AbstractCard)){ //move card
        y += 1;
        global.uniqueMove = true;
    }
    
    if(place_meeting(x, y + global.collisionDist, object_index)){ //if collision, make new card
        instance_destroy();
        with(instance_nearest(x, y + global.collisionDist, object_index)){
            instance_change(object_index + (2 - global.difficulty), true);
        }
        newCard = true;
    }
}

else if(right){
    while(x < MAX_X && !place_meeting(x + global.collisionDist, y, AbstractCard)){ //move card
        x += 1;
        global.uniqueMove = true;
    }
    
    if(place_meeting(x + global.collisionDist, y, object_index)){ //if collision, make new card
        instance_destroy();
        with(instance_nearest(x + global.collisionDist, y, object_index)){
            instance_change(object_index + (2 - global.difficulty), true);
        }
        newCard = true;
    }
}

if(newCard){
    score += 200;
    if(global.difficulty = 1){
        score += 50;
    }
}
else if(global.uniqueMove && !newCard){
    score -= 10;
    if(global.difficulty == 1){
        score -= 10;
    }
}
