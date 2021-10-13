Package.RequirePackage("nanos-world-sandbox")
--Package.Require("SpawnMenu.lua")


--Player.Unsubscribe("Spawn")
Package.Unsubscribe("Load")
Character.Unsubscribe("Respawn")





-- Called when Players join the server (i.e. Spawn)

--[[
Player.Subscribe("Spawn", function(new_player)
    -- Spawns a Character at position 0, 0, 0 with default's constructor parameters
    local post_apocalyptic = Character(Vector(400, 0, 700), Rotator(0, 0, 0), "nanos-world::SK_PostApocalyptic")
    Package.Log("this also gets called to :) ")
    post_apocalyptic:SetCameraMode(CameraMode.FPSOnly)

    post_apocalyptic:Subscribe("Death", function(chara, last_damage_taken, last_bone_damaged, damage_reason, hit_from, instigator)
	
        post_apocalyptic:Respawn(Vector(400, 0, 100))
	end)

    new_player:Possess(post_apocalyptic)

end)
--]]
Package.Subscribe("Load", function()
    Package.Log("Load Nanos Battlefield 2043")
end)

Package.Subscribe("Unload", function()
    Package.Log("Unload Nanos Battlefield 2043")
end)

Character.Subscribe("Respawn", function(character)
	Package.Log(Character)

    
end)
