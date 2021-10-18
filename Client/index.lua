Package.Require("Scoreboard.lua")

MyBattlefieldHUD = WebUI("My UI", "file:///Ui/index.html")

Package.Subscribe("Load", function()
    Package.Log("Battlefield 2043 loaded")
	local local_ply = Client.GetLocalPlayer()
	if (local_ply ~= nil) then
		SetPlayerRank(local_ply,1)
		UpdateLocalCharacter(local_ply:GetControlledCharacter())
		local_ply:Subscribe("Possess", function(player, character)
			UpdateLocalCharacter(character)
		end)
	end

	for k, player in pairs(Player.GetAll()) do
		UpdatePlayerScoreboard(player)
	end
end)

function UpdateLocalCharacter(character)
    if (character == nil) then return end
	UpdateHealth(character:GetHealth())
	character:Subscribe("TakeDamage", function(charac, damage, type, bone, from_direction, instigator, causer)
		Sound(Vector(), "nanos-world::A_HitTaken_Feedback", true)
		UpdateHealth(math.max(charac:GetHealth() - damage, 0))
	end)
    Package.Log("why u no work")
	character:Subscribe("Death", function(charac)
		UpdateHealth(0)
	end)

	character:Subscribe("Respawn", function(charac)
		UpdateHealth(100)
	end)

	local current_picked_item = character:GetPicked()

	if (current_picked_item and current_picked_item:GetType() == "Weapon" and not current_picked_item:GetValue("ToolGun")) then
		UpdateAmmo(true, current_picked_item:GetAmmoClip(), current_picked_item:GetAmmoBag())
	end

	character:Subscribe("PickUp", function(charac, object)
		if (object:GetType() == "Weapon" and not object:GetValue("ToolGun")) then
			UpdateAmmo(true, object:GetAmmoClip(), object:GetAmmoBag())

			character:Subscribe("Fire", function(charac, weapon)
                Package.Log("pew pew")
				UpdateAmmo(true, weapon:GetAmmoClip(), weapon:GetAmmoBag())
			end)

			character:Subscribe("Reload", function(charac, weapon, ammo_to_reload)
				UpdateAmmo(true, weapon:GetAmmoClip(), weapon:GetAmmoBag())
			end)
		end
	end)

	character:Subscribe("Drop", function(charac, object)
		UpdateAmmo(false)
		character:Unsubscribe("Fire")
		character:Unsubscribe("Reload")
	end)
end

 

function SetPlayerRank(character,rank)
	if (character == nil) then return end
	character:SetValue("Rank",Assault.Levels[rank][1],true)
end

function UpdateAmmo(enable_ui, ammo, ammo_bag)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateAmmo", enable_ui, ammo, ammo_bag)
end

function UpdateHealth(health)
	MyBattlefieldHUD:CallEvent("BattleFieldUpdateHealth", health)
end

ranks = 0 
Timer.SetInterval(function()
	local local_ply = Client.GetLocalPlayer()
	ranks = ranks + 1
    SetPlayerRank(local_ply,ranks)

end, 3000, "world", 456)