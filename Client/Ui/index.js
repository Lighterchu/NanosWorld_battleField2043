

Events.Subscribe("BattleFieldUpdateHealth", UpdateHealth);
Events.Subscribe("BattleFieldUpdateArmor", UpdateArmor);
Events.Subscribe("BattleFieldUpdateTime", UpdateTime);


function UpdateHealth(health) {
	// Overrides the HTML content of the SPAN with the new health value
	document.querySelector("#health_current").innerHTML = health;

	// Bonus: make the background red when health below 25
	//document.querySelector("#health_container").style.backgroundColor = health <= 25 ? "#ff05053d" : "#0000003d";
}

function UpdateArmor(armor) {
	// Overrides the HTML content of the SPAN with the new health value
	document.querySelector("#armor_current").innerHTML = armor;

	//Bonus: make the background red when health below 25
	//document.querySelector("#health_container").style.backgroundColor = health <= 25 ? "#ff05053d" : "#0000003d";
}

function UpdateTime(time) {
	// Overrides the HTML content of the SPAN with the new health value
	document.querySelector("#scoreTime").innerHTML = time;

	//Bonus: make the background red when health below 25
	//document.querySelector("#health_container").style.backgroundColor = health <= 25 ? "#ff05053d" : "#0000003d";
}

