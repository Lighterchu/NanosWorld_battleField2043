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
	local Rank = player:GetValue("Rank") or 0
	local Ping = player:GetPing() or 0
	local Name = player:GetName() or "SyedMuhamed" -- Mental mind blank lmao, forgot how to spell
	local ID = player:GetID()
	local Deaths = 0 -- Get Deaths
	local Kills = 0 -- Get Kills
	local Active = true -- Need to get Active?

    MyBattlefieldHUD:CallEvent("UpdatePlayer", JSON.stringify({ID, Active, Name, Rank, Kills, Deaths, Ping}))
end

-- Updates the ping every 5 seconds
Timer.SetInterval(function()
	for k, player in pairs(Player.GetAll()) do
		UpdatePlayerScoreboard(player)
	end
end, 3000)