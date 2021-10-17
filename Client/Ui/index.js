

Events.Subscribe("BattleFieldUpdateHealth", UpdateHealth);
//Events.Subscribe("BattleFieldUpdateArmor", UpdateArmor);
//Events.Subscribe("BattleFieldUpdateTime", UpdateTime);
Events.Subscribe("BattleFieldUpdateAmmo", UpdateWeaponAmmo);


function UpdateWeaponAmmo(enable, clip, bag) {
    if (enable)
        document.querySelector("#weapon_hud_container").style.display = "block";
    else
        document.querySelector("#weapon_hud_container").style.display = "none";
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


