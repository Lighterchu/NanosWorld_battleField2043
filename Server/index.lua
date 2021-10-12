-- Called when Players join the server (i.e. Spawn)
Player.Subscribe("Spawn", function(new_player)
    -- Spawns a Character at position 0, 0, 0 with default's constructor parameters
    local new_character = Character(Vector(0, -100, 700))
    
    new_character:SetCameraMode(CameraMode.FPSOnly)
    -- Possess the new Character
    new_player:Possess(new_character)
    
    
end)

-- When Player leaves the server, destroy it's Character
Player.Subscribe("Destroy", function(player)
    local character = player:GetControlledCharacter()
    if (character) then
        character:Destroy()
    end
end)