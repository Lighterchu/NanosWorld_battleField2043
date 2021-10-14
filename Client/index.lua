Client.Subscribe("Tick", function(delta_time)   
    --[[
    for k, player in pairs(Player.GetPairs()) do
        Package.Log(NanosUtils.Dump(player:GetControlledCharacter():GetLocation() ))
    end
    ]]
    BattlefieldUpdateHealth(100)
    BattlefieldUpdateArmor(10)
end)

MyBattlefieldHUD = WebUI("My UI", "file:///UI/index.html")




function BattlefieldUpdateHealth(health)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateHealth", health)
end

function BattlefieldUpdateArmor(armor)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateArmor", armor)
end