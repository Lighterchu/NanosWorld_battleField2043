Client.Subscribe("Tick", function(delta_time)   
    --[[
    for k, player in pairs(Player.GetPairs()) do
        Package.Log(NanosUtils.Dump(player:GetControlledCharacter():GetLocation() ))
    end
    ]]
    BattlefieldUpdateHealth(100000000)
end)

MyBattlefieldHUD = WebUI("My UI", "file:///UI/index.html")

-- When the HTML is ready, triggers an Event in there
MyBattlefieldHUD:Subscribe("Ready", function()
    MyBattlefieldHUD:CallEvent("MyAwesomeEvent", "Hello! You are ready!")
end)

MyBattlefieldHUD:Subscribe("BattleFieldUpdateHealth", function(param1)
    Package.Log("Received an answer! Message: " .. param1)
end)


function BattlefieldUpdateHealth(health)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateHealth", health)
end