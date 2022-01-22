-- Enum of all Inventory Item types
InventoryTypes = {
	primary = 1,
	secondary = 2,
	gadget = 3,
	support = 4,
	grenade = 5

}



-- List of all available Inventory Item types
InventoryItems = {
	["nanos-world::SK_AK47"] = {
		name = "AK47",
		image = "ak47.png",
		spawn = function(pos) return NanosWorldWeapons.AK47(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.primary,
		default_data = {ammo_bag = 1000, ammo_clip = 30},
	},
	["nanos-world::SK_Glock"] = {
		name = "Glock",
		image = "glock.png",
		spawn = function(pos) return NanosWorldWeapons.Glock(pos or Vector(), Rotator()) end,
		slot = 2,
		type = InventoryTypes.secondary,
		default_data = {ammo_bag = 1000, ammo_clip = 17},
	},
	["nanos-world::SM_Grenade_G67"] = {
		name = "Grenade G67",
		image = "grenade.png",
		spawn = function(pos) return Grenade(pos or Vector(), Rotator(), "nanos-world::SM_Grenade_G67") end,
		slot = 5,
		type = InventoryTypes.Grenade,
		default_data = 0,
	},
	["nanos-world::SM_Spraycan_01"] = {
		name = "Smoke Grenade",
		image = "grenade.png",
		spawn = function(pos) return GrenadeType(pos or Vector(), Rotator(), "nanos-world::SM_Spraycan_01") end,
		slot = 4,
		type = InventoryTypes.Grenade,
		default_data = 0,
	},
	["nanos-world::SK_AR4"] = {
		name = "AR4",
		image = "ar4.png",
		spawn = function(pos) return NanosWorldWeapons.AR4(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.primary,
		default_data = {ammo_bag = 1000, ammo_clip = 30},
	},
	["nanos-world::SK_AK74U"] = {
		name = "AK74U",
		image = "ak74u.png",
		spawn = function(pos) return NanosWorldWeapons.AK74U(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.primary,
		default_data = {ammo_bag = 1000, ammo_clip = 30},
	},
	["nanos-world::SK_AP5"] = {
		name = "AP5",
		image = "ap5.png",
		spawn = function(pos) return NanosWorldWeapons.AP5(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.primary,
		default_data = {ammo_bag = 1000, ammo_clip = 30},
	},
	["nanos-world::SK_DesertEagle"] = {
		name = "Desert Eagle",
		image = "deagle.png",
		spawn = function(pos) return NanosWorldWeapons.DesertEagle(pos or Vector(), Rotator()) end,
		slot = 2,
		type = InventoryTypes.Weapon,
		default_data = {ammo_bag = 1000, ammo_clip = 7},
	},
	["nanos-world::SK_GE3"] = {
		name = "GE3",
		image = "ge3.png",
		spawn = function(pos) return NanosWorldWeapons.GE3(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.primary,
		default_data = {ammo_bag = 1000, ammo_clip = 30},
	},
	["nanos-world::SK_SMG11"] = {
		name = "SMG11",
		image = "smg11.png",
		spawn = function(pos) return NanosWorldWeapons.SMG11(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.Weapon,
		default_data = {ammo_bag = 1000, ammo_clip = 32},
	},
	["nanos-world::SK_Moss500"] = {
		name = "Moss 500",
		image = "moss500.png",
		spawn = function(pos) return NanosWorldWeapons.Moss500(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.primary,
		default_data = {ammo_bag = 1000, ammo_clip = 6},
	},
	["nanos-world::SK_AK5C"] = {
		name = "AK5C",
		image = "Ak5c.png",
		spawn = function(pos) return NanosWorldWeapons.AK5C(pos or Vector(), Rotator()) end,
		slot = 1,
		type = InventoryTypes.primary,
		default_data = {ammo_bag = 1000, ammo_clip = 6},
	},
}