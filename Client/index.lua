Client.Subscribe("Tick", function(delta_time)   
    --[[
    for k, player in pairs(Player.GetPairs()) do
        Package.Log(NanosUtils.Dump(player:GetControlledCharacter():GetLocation() ))
    end
    ]]
end)