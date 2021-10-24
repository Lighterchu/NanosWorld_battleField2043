--Assault class
Package.Require("assault.lua")


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
    local my_weapon = Assault.Equipment.SmokeGrenade()
    Timer.SetTimeout(function(param1, param2)    
        PlayerChar:PickUp(my_weapon)
    end, 500)
    
end)

