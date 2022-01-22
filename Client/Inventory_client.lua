-- Stores the UI Instance
WeaponHUD = nil

-- Stores when the UI is ready
IsUIReady = false

-- Stores when the LocalPlayer is ready
IsLocalPlayerReady = false

-- Stores all keys used for inventory shortcut
InventoryKeyBinding = {
	["One"] = 1,
	["Two"] = 2,
	["Three"] = 3,
	["Four"] = 4,
	["Five"] = 5
}

-- When package loads, verify if LocalPlayer already exists (eg. when reloading the package), then try to get and store it's controlled character
-- Package.Subscribe("Load", function()
-- 	-- Creates a WebUI for the Inventory
-- 	WeaponHUD = WebUI("InventoryHUD", "file:///UI/INVENTORY/index.html")

-- 	WeaponHUD:Subscribe("Ready", function()
-- 		IsUIReady = true
-- 		SetupUI()
-- 	end)
-- end)

Package.Subscribe("Unload", function()
	MyBattlefieldHUD:Destroy()
end)

-- Catches KeyUp event to see if it was pressed any Inventory Shortcut key
Client.Subscribe("KeyUp", function(KeyName)
	slot = -1
	if (InventoryKeyBinding[KeyName]) then
		slot = InventoryKeyBinding[KeyName]
	end
	
	-- If pressed any shortcut key
	if (slot ~= -1) then
		local inventory = Client.GetLocalPlayer():GetValue("Inventory") or {}
		local dump_text = NanosUtils.Dump(inventory)

		Package.Log(dump_text)
		-- Verifies if I have any item in the index of that inventory or if I pressed 0 (means remove all items from hand), then send 'SwitchInventoryItem' to server to switch my current item
		if (inventory[slot] or slot == 0) then
			Package.Log(slot)
			Events.CallRemote("SwitchInventoryItem", slot)
		end
	end
end)

Events.Subscribe("SwitchedInventoryItem", function(slot)
	MyBattlefieldHUD:CallEvent("SwitchedInventoryItem", slot)
end)

-- When LocalPlayer spawns, sets an event on it to trigger when we possesses a new character, to store the local controlled character locally. This event is only called once, see Package.Subscribe("Load") to load it when reloading a package
Client.Subscribe("SpawnLocalPlayer", function(local_player)
	IsLocalPlayerReady = true
end)

-- Receives a new item on the inventory
Events.Subscribe("GiveInventoryItem", function(inventory_item_id)
	Package.Log("this is what we are getting for th inventory " .." " .. inventory_item_id)
	-- Gets if the item exists item from InventoryItems list
	local InventoryItem = InventoryItems[inventory_item_id]

	-- Gets my inventory, sets the item at the slot and saves it again
	local inventory = Client.GetLocalPlayer():GetValue("Inventory") or {}
	inventory[InventoryItem.slot] = {id = inventory_item_id}
	Client.GetLocalPlayer():SetValue("Inventory", inventory)
	Package.Log("this is what we are printing " ..InventoryItem.name .. " " .. InventoryItem.slot)
	-- Calls HUD to add this item to the screen
	if (MyBattlefieldHUD) then
		MyBattlefieldHUD:CallEvent("AddInventoryItem",InventoryItem.name,InventoryItem.slot)
	end
end)

-- Removes the item from inventory (called from server)
Events.Subscribe("RemoveInventoryItem", function(slot)
	-- Gets my inventory, sets the item at slot to nil and saves it again
	local inventory = Client.GetLocalPlayer():GetValue("Inventory") or {}
	inventory[slot] = nil
	Client.GetLocalPlayer():SetValue("Inventory", inventory)

	-- Calls HUD to remove it from screen
	if (MyBattlefieldHUD) then
		MyBattlefieldHUD:CallEvent("RemoveInventoryItem", slot)
	end
end)

