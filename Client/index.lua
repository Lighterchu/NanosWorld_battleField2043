local bullets = 1000

Client.Subscribe("Tick", function(delta_time)   
    --[[
    for k, player in pairs(Player.GetPairs()) do
        Package.Log(NanosUtils.Dump(player:GetControlledCharacter():GetLocation() ))
    end
    ]]
    bullets = bullets - 1

    BattlefieldUpdateHealth(100)
    BattlefieldUpdateArmor(100)
    BattlefieldUpdateAmmo(30,bullets)
end)

MyBattlefieldHUD = WebUI("My UI", "file:///UI/index.html")




function BattlefieldUpdateHealth(health)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateHealth", health)
end

function BattlefieldUpdateArmor(armor)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateArmor", armor)
end

function BattlefieldUpdateAmmo(mag,clip)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateAmmo", mag,clip)
end