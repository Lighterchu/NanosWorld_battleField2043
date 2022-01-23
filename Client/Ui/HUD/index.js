

Events.Subscribe("BattleFieldUpdateHealth", UpdateHealth);
//Events.Subscribe("BattleFieldUpdateArmor", UpdateArmor);
//Events.Subscribe("BattleFieldUpdateTime", UpdateTime);
Events.Subscribe("BattleFieldUpdateAmmo", UpdateWeaponAmmo);
//using the nanos sandbox one for now just so I can test the ranks 
Events.Subscribe("ToggleScoreboard", ToggleScoreboard);
Events.Subscribe("UpdatePlayer", UpdatePlayer);
Events.Subscribe("ToggleClassMenu", ToggleClassMenu);
Events.Subscribe("AddInventoryItem",changeWeapon)


function ToggleScoreboard(enable) {
	const scoreboard = document.querySelector("#scoreboard");

	if (enable)
		scoreboard.style.display = "block";
	else
		scoreboard.style.display = "none";
}

function UpdatePlayer(params = JSON.stringify({id: 0, active: true, name: 'SyedMuhammed', rank: 0, kills:  0, deaths: 0, ping: 0})) {
    if (typeof params == "string") params = JSON.parse(params);
    else console.warn("Should be a string here");

	const existing_scoreboard_entry = document.querySelector(`#scoreboard_entry_id${toString(params.id)}`);

	if (active) {
		if (existing_scoreboard_entry) {
			const scoreboard_ping = existing_scoreboard_entry.querySelector("td.scoreboard_ping");
			scoreboard_ping.innerHTML = toString(params.ping);

            const scoreboard_rank = existing_scoreboard_entry.querySelector("td.scoreboard_rank");
            scoreboard_rank.innerHTML = toString(params.rank);
			return;
		}

		const scoreboard_entry_tr = document.createElement("tr");
		scoreboard_entry_tr.id = `scoreboard_entry_id${toString(params.id)}`;

		const scoreboard_entry_td_id = document.createElement("td");
		scoreboard_entry_td_id.className = "scoreboard_id";
		scoreboard_entry_td_id.innerHTML = toString(params.id);
		scoreboard_entry_tr.appendChild(scoreboard_entry_td_id);
		
		const scoreboard_entry_td_name = document.createElement("td");
		scoreboard_entry_td_name.className = "scoreboard_name";
		scoreboard_entry_td_name.innerHTML = toString(params.name);
		scoreboard_entry_tr.appendChild(scoreboard_entry_td_name);

        const scoreboard_entry_td_rank = document.createElement("td");
		scoreboard_entry_td_rank.className = "scoreboard_rank";
		scoreboard_entry_td_rank.innerHTML = toString(params.rank);
		scoreboard_entry_tr.appendChild(scoreboard_entry_td_rank);

        const scoreboard_entry_td_kills = document.createElement("td");
		scoreboard_entry_td_rank.className = "scoreboard_kills";
		scoreboard_entry_td_rank.innerHTML = toString(params.kills);
		scoreboard_entry_tr.appendChild(scoreboard_entry_td_kills);
        
        const scoreboard_entry_td_deaths = document.createElement("td");
		scoreboard_entry_td_rank.className = "scoreboard_deaths";
		scoreboard_entry_td_rank.innerHTML = toString(params.deaths);
		scoreboard_entry_tr.appendChild(scoreboard_entry_td_deaths);
		
        const scoreboard_entry_td_ping = document.createElement("td");
		scoreboard_entry_td_ping.className = "scoreboard_ping";
		scoreboard_entry_td_ping.innerHTML = toString(params.ping);
		scoreboard_entry_tr.appendChild(scoreboard_entry_td_ping);
		

		document.querySelector("#scoreboard_tbody").prepend(scoreboard_entry_tr);
	} else {
		if (!existing_scoreboard_entry)
			return;

		existing_scoreboard_entry.remove();
	}
}



function UpdateWeaponAmmo(typeOfAmmo, clip, bag) {
    //console.log(typeOfAmmo)
    if (typeOfAmmo == "Grenade" && typeOfAmmo != null ) {
        document.querySelector("#weapon_hud_container").style.display = "block";
    }else{
        document.querySelector("#weapon_hud_container").style.display = "none";
    }
    if(typeOfAmmo) {
            document.querySelector("#weapon_hud_container").style.display = "block";
        var greyclip = clip;
        var greybag = bag;
        // Using JQuery, overrides the HTML content of these SPANs with the new Ammo values
        if (clip < 10) {
            clip = "" + clip;
            greyclip = "00" + clip;
        } else if (clip < 100) {
            clip = "" + clip;
            greyclip = "0" + clip;
        }
        if (bag < 10) {
            bag = "" + bag;
            greybag = "00" + bag;
        } else if (bag < 100) {
            bag = "" + bag;
            greybag = "0" + bag;
        }
    }
    document.querySelector("#weapon_ammo_clip").innerHTML = clip;
    document.querySelector("#weapon_ammo_clip_greyed").innerHTML = greyclip;
    document.querySelector("#weapon_ammo_bag").innerHTML = bag;
    document.querySelector("#weapon_ammo_bag_greyed").innerHTML = greybag;
}

// Register for UpdateHealth custom event (from Lua)
function UpdateHealth(health) {
    // Overrides the HTML content of the SPAN with the new health value
    var BarOffset = 100 - health
    document.querySelector("#health_status").innerHTML = health;
    document.querySelector("#health_bar").style.width = `${health}%`;
    document.querySelector("#health_bar").style.left = `${BarOffset}%`;
    if (health <= 25) {
        document.querySelector("#health_status").style.color = "rgb(255, 62, 0)";
        document.querySelector("#health_logo").style.color = "rgb(255, 62, 0)";
        document.querySelector("#health_bar").style.backgroundColor = "rgb(255, 62, 0)";
    } else if (health <= 75) {
        document.querySelector("#health_status").style.color = "rgba(255, 242, 0)";
        document.querySelector("#health_logo").style.color = "rgba(255, 242, 0)";
        document.querySelector("#health_bar").style.backgroundColor = "rgb(255, 242, 0)";
    } else {
        document.querySelector("#health_status").style.color = "rgba(70, 255, 96)";
        document.querySelector("#health_logo").style.color = "rgba(70, 255, 96)";
        document.querySelector("#health_bar").style.backgroundColor = "rgb(70, 255, 96)";
    }
    // Bonus: make the background red when health below 25
    //document.querySelector("#health_container").style.backgroundColor = health <= 25 ? "#ff05053d" : "#0000003d";
}


function changeWeapon(weapon,slot){
    const primaryWeapon = document.getElementById('primary_container')
    const secondaryWeapon = document.getElementById('secondary_container')
    const grenade = document.getElementById('grenade_container')
    const support = document.getElementById('support_container')
    if(weapon){
        if(slot === 1) {
            primaryWeapon.textContent = weapon
            primaryWeapon.style.background = 'rgba(9, 255, 230, 0.796)'
            secondaryWeapon.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            grenade.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            support.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            return
        }
        if(slot === 2) {
            secondaryWeapon.textContent = weapon
            secondaryWeapon.style.backgroundColor = 'rgba(9, 255, 230, 0.796)'
            primaryWeapon.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            grenade.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            support.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            return
        }
        if(slot === 4) {
            
            support.textContent = weapon
            support.style.backgroundColor = 'rgba(9, 255, 230, 0.796)'
            secondaryWeapon.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            primaryWeapon.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            grenade.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            return
        }
        if(slot === 5) {
            console.log("printing Weapon" + weapon)
            grenade.textContent = weapon
            grenade.style.backgroundColor = 'rgba(9, 255, 230, 0.796)'
            support.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            secondaryWeapon.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            primaryWeapon.style.backgroundColor = 'rgba(9, 255, 230, 0.65)'
            return
        }

    }
}


function ToggleClassMenu(is_visible) {
    const class_menu = document.querySelector("#class_menu");
    if (is_visible)
	{
	    class_menu.style.display = "block";
	}
	else
	{
		class_menu.style.display = "none";

	}
}



