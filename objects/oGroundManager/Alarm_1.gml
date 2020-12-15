/// @description Ground me, baby
var whatToGenerate = noone;

if(genCounter <= 0) {
	if(lastGenerated == "gap") {
		lastGenerated = "ground";
	}
	else {
		lastGenerated = choose("ground", "gap");
	}
	if(lastGenerated == "ground") {
		genCounter = irandom_range(5, 15);
		//here's where the height logic should go
		var whichWay = choose(1,-1);
		var changer;
		if(whichWay == 1) {
			changer = irandom_range(25,100);
			if(currHeight + changer > maxHeight) currHeight = maxHeight;
			else currHeight += changer;
		}
		else {
			changer = irandom_range(-25,-100);
			if(currHeight + changer < minHeight) currHeight = minHeight;
			else currHeight += changer;
		}
	}
	else {
		genCounter = irandom_range(4, 6);
	}
}
else {
	genCounter--;
}

if(lastGenerated == "ground") {
	whatToGenerate = oGround;
}
else {
	whatToGenerate = noone;
}

if(room == roomTitleScreen) whatToGenerate = oGround;

if(whatToGenerate != noone) {
	with (instance_create_layer(600, currHeight, "Ground", whatToGenerate)) {
		myStep = oGameManager.currSpeed + 0;
	}
}
alarm[1] = demoTimer