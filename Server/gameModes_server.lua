Package.RequirePackage("corelib")
Package.RequirePackage("nanos-world-weapons")

-- local Weapons = {
--     Primary = {
--         ["Rifle"] = {
--             ["AK47"] = NanosWorldWeapons.AK47,
--             ["AK5C"] = NanosWorldWeapons.AK5C,
--             ["GE3"] = NanosWorldWeapons.GE3,
--             ["SA80"] = NanosWorldWeapons.SA80,
--             ["AR4"] = NanosWorldWeapons.AR4,
--             ["ASVAL"] = NanosWorldWeapons.ASVal,
--             ["GE36"] = NanosWorldWeapons.GE36,
--             ["AK74U"] = NanosWorldWeapons.AK74U
--         },
--         ["Smg"] = {
--             ["P90"] = NanosWorldWeapons.P90,
--             ["UMP45"] = NanosWorldWeapons.UMP45,
--             ["AP5"] = NanosWorldWeapons.AP5,
--             ["SMG11"] = NanosWorldWeapons.SMG11,
--         },
--         ["Sniper"] = {
--             ["AWP"] = NanosWorldWeapons.AWP
--         }
--     },
--     Secondary = {
--         ["Pistol"] = {
--             ["MAKAROV"] = NanosWorldWeapons.Makarov,
--             ["M1911"] = NanosWorldWeapons.M1911,
--             ["GLOCK"] = NanosWorldWeapons.Glock,
--             ["DESERTEAGLE"] = NanosWorldWeapons.DesertEagle,
--         },
--         ["Shotgun"] = {
--             ["ITHACA37"] = NanosWorldWeapons.Ithaca37,
--             ["REM870"] = NanosWorldWeapons.Rem870,
--             ["SPAS12"] = NanosWorldWeapons.SPAS12,
--             ["MOSS500"] = NanosWorldWeapons.Moss500
--         }
--     }
-- }

--[[

SubscribeServerEvent("SwitchToWeapon", function(sender, ree, ree2)
    local PlayerChar = sender:GetControlledCharacter()
    local CurrentWeapon = PlayerChar:GetPicked()
    if CurrentWeapon then
        CurrentWeapon:Destroy()
    end
    local Weapon = Weapons.Primary["Rifle"]["AK47"]
    my_weapon = Weapon(Vector(), Rotator())
    PlayerChar:SetWeaponAimMode(0)
    Timer.SetTimeout(function(param1, param2)    
        PlayerChar:PickUp(my_weapon)
        PlayerChar:SetWeaponAimMode(4)
    end, 500)
    
end)

SubscribeServerEvent("SwitchToGrenade", function(sender, ree, ree2)
    local PlayerChar = sender:GetControlledCharacter()
    local CurrentWeapon = PlayerChar:GetPicked()
    if CurrentWeapon then
        CurrentWeapon:Destroy()
    end
    local my_weapon = Grenade(
  Vector(-900, 185, 215),
  Rotator(0, 90, 90),
  "nanos-world::SM_Grenade_G67",
  "nanos-world::P_Grenade_Special",
  "nanos-world::A_Explosion_Large"
)
    PlayerChar:SetWeaponAimMode(0)
    Timer.SetTimeout(function(param1, param2)    
        PlayerChar:PickUp(my_weapon)
        PlayerChar:SetWeaponAimMode(4)
    end, 500)
    
end)

SubscribeServerEvent("SwitchToPistol", function(sender, ree, ree2)
    local PlayerChar = sender:GetControlledCharacter()
    local CurrentWeapon = PlayerChar:GetPicked()
    if CurrentWeapon then
        CurrentWeapon:Destroy()
    end
    local Weapon = Weapons.Secondary["Pistol"]["M1911"]
    my_weapon = Weapon(Vector(), Rotator())
    PlayerChar:SetWeaponAimMode(0)
    Timer.SetTimeout(function(param1, param2)    
        PlayerChar:PickUp(my_weapon)
        PlayerChar:SetWeaponAimMode(4)
    end, 250)
end)

]]

local ATrigger = Trigger(Vector(-3508, 7485, 100), Rotator(), Vector(1500), TriggerType.Sphere, true, Color(1, 0, 0))
local BTrigger = Trigger(Vector(-5524, -4937, 733), Rotator(), Vector(1500), TriggerType.Sphere, true, Color(1, 0, 0))
local CTrigger = Trigger(Vector(2717, -9367, 100), Rotator(), Vector(1500), TriggerType.Sphere, true, Color(1, 0, 0))

Config = {
    GameScore = {
        Red = 0,
        Blue = 0
    },
    Control = {
        ["Red"] = {
            ["A"] = {
                Controlled = false,
                MembersInside = 0,
                Score = 0
            },
            ["B"] = {
                Controlled = false,
                MembersInside = 0,
                Score = 0
            },
            ["C"] = {
                Controlled = false,
                MembersInside = 0,
                Score = 0
            }
        },
        ["Blue"] = {
            ["A"] = {
                Controlled = false,
                MembersInside = 0,
                Score = 0
            },
            ["B"] = {
                Controlled = false,
                MembersInside = 0,
                Score = 0
            },
            ["C"] = {
                Controlled = false,
                MembersInside = 0,
                Score = 0
            }
        }
    },
    ConflictedZones = {
        A = false,
        B = false,
        C = false
    }
}

ATrigger:Subscribe("BeginOverlap", function(self, entity)
    if entity:GetType() == "Character" then
        if entity:GetPlayer() ~= nil then
            Config.Control["Red"]["A"].MembersInside = Config.Control["Red"]["A"].MembersInside + 1
            CallClientEvent("TriggerEnteredZone", entity:GetPlayer(), "A")
        end
    end
end)

ATrigger:Subscribe("EndOverlap", function(self, entity)
    if entity:GetType() == "Character" then
        if entity:GetPlayer() ~= nil then
            if Config.Control["Red"]["A"].MembersInside > 0 then
                Config.Control["Red"]["A"].MembersInside = Config.Control["Red"]["A"].MembersInside - 1
                CallClientEvent("TriggerExitedZone", entity:GetPlayer(), "A")
            end
        end
    end
end)

BTrigger:Subscribe("BeginOverlap", function(self, entity)
    if entity:GetType() == "Character" then
        if entity:GetPlayer() ~= nil then
            Config.Control["Red"]["B"].MembersInside = Config.Control["Red"]["B"].MembersInside + 1
            CallClientEvent("TriggerEnteredZone", entity:GetPlayer(), "B")
        end
    end
end)

BTrigger:Subscribe("EndOverlap", function(self, entity)
    if entity:GetType() == "Character" then
        if entity:GetPlayer() ~= nil then
            Config.Control["Red"]["B"].MembersInside = Config.Control["Red"]["B"].MembersInside - 1
            CallClientEvent("TriggerExitedZone", entity:GetPlayer(), "B")
        end
    end
end)

CTrigger:Subscribe("BeginOverlap", function(self, entity)
    if entity:GetType() == "Character" then
        if entity:GetPlayer() ~= nil then
            Config.Control["Red"]["C"].MembersInside = Config.Control["Red"]["C"].MembersInside + 1
            CallClientEvent("TriggerEnteredZone", entity:GetPlayer(), "C")
        end
    end
end)

CTrigger:Subscribe("EndOverlap", function(self, entity)
    if entity:GetType() == "Character" then
        if entity:GetPlayer() ~= nil then
            Config.Control["Red"]["C"].MembersInside = Config.Control["Red"]["C"].MembersInside - 1
            CallClientEvent("TriggerExitedZone", entity:GetPlayer(), "C")
        end
    end
end)

CreateServerCommand("setfps", function(sender, args)
    PlayerChar = sender:GetControlledCharacter()
    PlayerChar:SetSpeedMultiplier(1.5)
    PlayerChar:SetViewMode(0)
    PlayerChar:SetWeaponAimMode(4)
    RegisterPlayerToFPS(PlayerChar)
    --PlayerChar:Unsubscribe("WeaponAimModeChanged")
end)

Timer.SetInterval(function(param1, param2)
    local RedScoreAdd = 0
    local BlueScoreAdd = 0
    for i, control in pairs(Config.Control["Red"]) do
        if control.Controlled == true then
            RedScoreAdd = RedScoreAdd + 1
        end
    end
    for i, control in pairs(Config.Control["Blue"]) do
        if control.Controlled == true then
            BlueScoreAdd = BlueScoreAdd + 1
        end
    end
    Config.GameScore.Red = Config.GameScore.Red + RedScoreAdd
    Config.GameScore.Blue = Config.GameScore.Blue + BlueScoreAdd
end, 3000)

Server.Subscribe("Tick", function(delta_time)
    if Config.Control["Red"]["A"].MembersInside > 0 and Config.Control["Blue"]["A"].MembersInside == 0 then
        if Config.Control["Red"]["A"].Score < 1000 then
            Config.Control["Red"]["A"].Score = Config.Control["Red"]["A"].Score + 1
        elseif Config.Control["Red"]["A"].Score > 1000 then
            Config.Control["Red"]["A"].Score = 1000
        elseif Config.Control["Red"]["A"].Score == 1000 and not Config.Control["Red"]["A"].Controlled then
            Config.Control["Red"]["A"].Controlled = true
        end
        Config.ConflictedZones.A = false
    elseif Config.Control["Blue"]["A"].MembersInside > 0 and Config.Control["Blue"]["A"].MembersInside == 0 then
        if Config.Control["Blue"]["A"].Score < 1000 then
            Config.Control["Blue"]["A"].Score = Config.Control["Blue"]["A"].Score + 1
        elseif Config.Control["Blue"]["A"].Score > 1000 then
            Config.Control["Blue"]["A"].Score = 1000
        elseif Config.Control["Blue"]["A"].Score == 1000 and not Config.Control["Blue"]["A"].Controlled then
            Config.Control["Blue"]["A"].Controlled = true
        end
        Config.ConflictedZones.A = false
    elseif Config.Control["Red"]["A"].MembersInside > 0 and Config.Control["Blue"]["A"].MembersInside > 0 then
        Config.ConflictedZones.A = true
    end
    if Config.Control["Red"]["B"].MembersInside > 0 and Config.Control["Blue"]["B"].MembersInside == 0 then
        if Config.Control["Red"]["B"].Score < 1000 then
            Config.Control["Red"]["B"].Score = Config.Control["Red"]["B"].Score + 1
        elseif Config.Control["Red"]["B"].Score > 1000 then
            Config.Control["Red"]["B"].Score = 1000
        elseif Config.Control["Red"]["B"].Score == 1000 and not Config.Control["Red"]["B"].Controlled then
            Config.Control["Red"]["B"].Controlled = true
        end
        Config.ConflictedZones.B = false
    elseif Config.Control["Blue"]["B"].MembersInside > 0 and Config.Control["Red"]["B"].MembersInside == 0 then
        if Config.Control["Blue"]["B"].Score < 1000 then
            Config.Control["Blue"]["B"].Score = Config.Control["Blue"]["B"].Score + 1
        elseif Config.Control["Blue"]["B"].Score > 1000 then
            Config.Control["Blue"]["B"].Score = 1000
        elseif Config.Control["Blue"]["B"].Score == 1000 and not Config.Control["Blue"]["B"].Controlled then
            Config.Control["Blue"]["B"].Controlled = true
        end
        Config.ConflictedZones.B = false
    elseif Config.Control["Red"]["B"].MembersInside > 0 and Config.Control["Blue"]["B"].MembersInside > 0 then
        Config.ConflictedZones.B = true
    end
    if Config.Control["Red"]["C"].MembersInside > 0 and Config.Control["Blue"]["C"].MembersInside == 0 then
        if Config.Control["Red"]["C"].Score < 1000 then
            Config.Control["Red"]["C"].Score = Config.Control["Red"]["C"].Score + 1
        elseif Config.Control["Red"]["C"].Score > 1000 then
            Config.Control["Red"]["C"].Score = 1000
        elseif Config.Control["Red"]["C"].Score == 1000 and not Config.Control["Red"]["C"].Controlled then
            Config.Control["Red"]["C"].Controlled = true
        end
        Config.ConflictedZones.C = false
    elseif Config.Control["Blue"]["C"].MembersInside > 0 and Config.Control["Red"]["C"].MembersInside == 0 then
        if Config.Control["Blue"]["C"].Score < 1000 then
            Config.Control["Blue"]["C"].Score = Config.Control["Blue"]["C"].Score + 1
        elseif Config.Control["Blue"]["C"].Score > 1000 then
            Config.Control["Blue"]["C"].Score = 1000
        elseif Config.Control["Blue"]["C"].Score == 1000 and not Config.Control["Blue"]["C"].Controlled then
            Config.Control["Blue"]["C"].Controlled = true
        end
        Config.ConflictedZones.C = false
    elseif Config.Control["Red"]["C"].MembersInside > 0 and Config.Control["Blue"]["C"].MembersInside > 0 then
        Config.ConflictedZones.C = true
    end
    CallClientEvent("SendScoreData", -1, Config)
end)

function RegisterPlayerToFPS(PlayerChar)
    local IsSprinting = false
    local IsSwimming = false
    local IsSkyDiving = false

    PlayerChar:Subscribe("ViewModeChanged", function(self, old_state, new_state)
        PlayerChar:SetViewMode(0)
    end)

    PlayerChar:Subscribe("FallingModeChanged", function(self, old_state, new_state)
        if new_state == 7 then
            IsSkyDiving = true
            
            Timer.SetTimeout(function()
                PlayerChar:SetWeaponAimMode(0)
            end, 100)
        else
            IsSkyDiving = false
            if PlayerChar:GetWeaponAimMode() == 0 then
                PlayerChar:SetWeaponAimMode(4)
            end
        end
        PlayerChar:SetGaitMode(0)
    end)

    PlayerChar:Subscribe("GaitModeChanged", function(self, old_state, new_state)
        if new_state == 2 then
            IsSprinting = true
            PlayerChar:SetSpeedMultiplier(1.65)
            PlayerChar:SetWeaponAimMode(0)
            --PlayerChar:SetCanAim(false)
        else
            IsSprinting = false
            PlayerChar:SetSpeedMultiplier(1.5)
            --PlayerChar:SetCanAim(true)
            if PlayerChar:GetWeaponAimMode() == 0 then
                PlayerChar:SetWeaponAimMode(4)
            end
        end
    end)

    Character.Subscribe("Fire", function(self, weapon)
        if IsSprinting then
            PlayerChar:SetGaitMode(1)
                IsSprinting = false
        end
    end)
    
    PlayerChar:Subscribe("WeaponAimModeChanged", function(self, old_state, new_state)
        if (not IsSprinting and not IsSwimming and not IsSkyDiving) then
            if new_state == 3 then
                PlayerChar:SetWeaponAimMode(1)
            elseif new_state == 0 then
                PlayerChar:SetWeaponAimMode(4)
            end
        else
            if IsSprinting and new_state ~= 0 then
                PlayerChar:SetGaitMode(1)
                IsSprinting = false
                Timer.SetTimeout(function()
                    if new_state ~= 3 then
                        PlayerChar:SetWeaponAimMode(new_state)
                    else
                        PlayerChar:SetWeaponAimMode(1)
                    end
                end, 1)
                
            end
            if PlayerChar:GetWeaponAimMode() ~= 0 then
                PlayerChar:SetWeaponAimMode(0)
            end
        end
    end)
end

function ErrorHandle(err)
    Server.BroadcastChatMessage(err)
end