Events.Subscribe("MyAwesomeEvent", function(param1) {
    console.log("Triggered! " + param1);

    // Triggers "MyAwesomeAnswer" on Lua
    Events.Call("MyAwesomeAnswer", "Hey there!");
})

Events.Subscribe("BattleFieldUpdateHealth", UpdateHealth);

function UpdateHealth(health) {
	// Overrides the HTML content of the SPAN with the new health value
	document.querySelector("#health_current").innerHTML = health;

	// Bonus: make the background red when health below 25
	document.querySelector("#health_container").style.backgroundColor = health <= 25 ? "#ff05053d" : "#0000003d";
}
