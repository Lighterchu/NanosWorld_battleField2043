--Package.RequirePackage("nanos-world-sandbox")
--Package.RequirePackage("corelib")
--Package.Require("SpawnMenu.lua")


--Player.Unsubscribe("Spawn")
--Package.Unsubscribe("Load")
Character.Unsubscribe("Respawn")

Package.Require("assault.lua")





-- Called when Players join the server (i.e. Spawn)


Package.Subscribe("Load", function()
    Package.Log("Load Nanos Battlefield 2043")
end)

Package.Subscribe("Unload", function()
    Package.Log("Unload Nanos Battlefield 2043")
end)

Character.Subscribe("Respawn", function(character)
	Package.Log(Character)

    
end)
CreateServerCommand("setRank", function(sender, args)
    PlayerChar = sender:GetControlledCharacter()
    SetPlayerRank(PlayerChar,args[1])
    
end)

function SetPlayerRank(character,rank)
	if (character == nil) then return end
	character:SetValue("Rank",Assault.Levels[rank][1],true)
end





Package.Log(Assault.Levels[1][2])

SubscribeServerEvent("SwitchToWeapon", function(sender, ree, ree2)
    local PlayerChar = sender:GetControlledCharacter()
    local CurrentWeapon = PlayerChar:GetPicked()
    if CurrentWeapon then
        CurrentWeapon:Destroy()
    end
    local weapon = Assault.Loadout.Primary.AK47()
    Timer.SetTimeout(function(param1, param2)    
        PlayerChar:PickUp(weapon)
    end, 500)
    
end)

SubscribeServerEvent("SwitchToGrenade", function(sender, ree, ree2)
    local PlayerChar = sender:GetControlledCharacter()
    local CurrentWeapon = PlayerChar:GetPicked()
    if CurrentWeapon then
        CurrentWeapon:Destroy()
    end
    local my_weapon = Assault.Loadout.Equipment.SmokeGrenade()
    
    Timer.SetTimeout(function(param1, param2)    
        PlayerChar:PickUp(my_weapon)
    end, 500)
    
end)

