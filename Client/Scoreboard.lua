-- Toggles the Scoreboard
Client.Subscribe("KeyUp", function(key_name)
    if (key_name == "Tab") then
		MyBattlefieldHUD:CallEvent("ToggleScoreboard", false)
	end
end)

-- Toggles the Scoreboard
Client.Subscribe("KeyDown", function(key_name)
	if (key_name == "Tab") then
        MyBattlefieldHUD:CallEvent("ToggleScoreboard", true)
	end
end)

function UpdatePlayerScoreboard(player)
    --this is only for a place holder for now, while I work out how to attach this to a player :) 
    MyBattlefieldHUD:CallEvent("UpdatePlayer", player:GetID(), true, player:GetName(), player:GetValue("Rank"),player:GetPing())
end

-- Updates the ping every 5 seconds
Timer.SetInterval(function()
	for k, player in pairs(Player.GetAll()) do
		UpdatePlayerScoreboard(player)
	end
end, 3000)