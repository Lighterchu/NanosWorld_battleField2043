

local PERSISTENT_DATA_SETTINGS = {
	KeyBindings = {
		ClassChange = "C",
	}
}

-- just using this for now to open the c menu for the classes 
Client.Subscribe("KeyPress", function(key)
	if (key == PERSISTENT_DATA_SETTINGS.KeyBindings.ClassChange) then
		if (ClassMenuOpened) then
			MyBattlefieldHUD:CallEvent("ToggleClassMenu", false)

			Client.SetInputEnabled(true)
			Client.SetMouseEnabled(false)
			Client.SetChatVisibility(true)

			ClassMenuOpened = false
		else
			
			MyBattlefieldHUD:CallEvent("ToggleClassMenu", true)

			Client.SetInputEnabled(false)
			Client.SetMouseEnabled(true)
			Client.SetChatVisibility(false)

			MyBattlefieldHUD:BringToFront()
			MyBattlefieldHUD:SetFocus()

		    ClassMenuOpened = true
		end
	end
end)
