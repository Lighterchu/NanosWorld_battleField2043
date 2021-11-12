Package.RequirePackage("nanos-world-weapons")




Support = Support or  {}
Support.name = "Support"

Support.Levels = {
    {"Support", "1"},
    {"Support Proficiency I", "2"},
    {"Support Proficiency II","3"},
    {"Support Proficiency III","4"},
    {"Support Mastery I","5"},
    {"Support Mastery II","6"},
    {"Support Mastery III","7"}
}



Support.Loadout = {
    Primary = {
        AK47 = function(location, rotation)
            local weapon = Weapon(location or Vector(), rotation or Rotator(), "nanos-world::SK_AK47")
    
            weapon:SetAmmoSettings(30, 1000)
            weapon:SetDamage(45)
            weapon:SetSpread(40)
            weapon:SetRecoil(1)
            weapon:SetBulletSettings(1, 20000, 20000, Color(100, 58, 0))
            weapon:SetSightTransform(Vector(0, 0, -1), Rotator(-1.5, 0, 0))
            weapon:SetLeftHandTransform(Vector(22, 0, 9), Rotator(0, 60, 90))
            weapon:SetRightHandOffset(Vector(-10, 0, 0))
            weapon:SetHandlingMode(HandlingMode.DoubleHandedWeapon)
            weapon:SetCadence(0.1)
            weapon:SetWallbangSettings(50, 0.75)
    
            weapon:SetParticlesBulletTrail("nanos-world::P_Bullet_Trail")
            weapon:SetParticlesBarrel("nanos-world::P_Weapon_BarrelSmoke")
            weapon:SetParticlesShells("nanos-world::P_Weapon_Shells_762x39")
    
            weapon:SetSoundDry("nanos-world::A_Rifle_Dry")
            weapon:SetSoundLoad("nanos-world::A_Rifle_Load")
            weapon:SetSoundUnload("nanos-world::A_Rifle_Unload")
            weapon:SetSoundZooming("nanos-world::A_AimZoom")
            weapon:SetSoundAim("nanos-world::A_Rattle")
            weapon:SetSoundFire("nanos-world::A_AK47_Shot")
    
            weapon:SetAnimationCharacterFire("nanos-world::AM_Mannequin_Sight_Fire")
            weapon:SetAnimationReload("nanos-world::AM_Mannequin_Reload_Rifle")
            weapon:SetAnimationFire("nanos-world::A_AK47_Fire")
    
            weapon:SetMagazineMesh("nanos-world::SM_AK47_Mag_Empty")
            weapon:SetCrosshairMaterial("nanos-world::MI_Crosshair_Regular")
            return weapon
        end,
        GE3 = function(location, rotation)
            local weapon = Weapon(location or Vector(), rotation or Rotator(), "nanos-world::SK_GE3")
    
            weapon:SetAmmoSettings(30, 1000)
            weapon:SetDamage(25)
            weapon:SetSpread(40)
            weapon:SetRecoil(1)
            weapon:SetBulletSettings(1, 20000, 20000, Color(100, 58, 0))
            weapon:SetSightTransform(Vector(0, 0, -3), Rotator(-1.5, 0, 0))
            weapon:SetLeftHandTransform(Vector(22, 0, 9), Rotator(0, 60, 90))
            weapon:SetRightHandOffset(Vector(-10, 0, 0))
            weapon:SetHandlingMode(HandlingMode.SingleHandedWeapon)
            weapon:SetCadence(0.1)
            weapon:SetWallbangSettings(50, 0.75)
    
            weapon:SetParticlesBulletTrail("nanos-world::P_Bullet_Trail")
            weapon:SetParticlesBarrel("nanos-world::P_Weapon_BarrelSmoke")
            weapon:SetParticlesShells("nanos-world::P_Weapon_Shells_762x39")
    
            weapon:SetSoundDry("nanos-world::A_Rifle_Dry")
            weapon:SetSoundLoad("nanos-world::A_Rifle_Load")
            weapon:SetSoundUnload("nanos-world::A_Rifle_Unload")
            weapon:SetSoundZooming("nanos-world::A_AimZoom")
            weapon:SetSoundAim("nanos-world::A_Rattle")
            weapon:SetSoundFire("nanos-world::A_AK47_Shot")
    
            weapon:SetAnimationCharacterFire("nanos-world::AM_Mannequin_Sight_Fire")
            weapon:SetAnimationReload("nanos-world::AM_Mannequin_Reload_Rifle")
            weapon:SetAnimationFire("nanos-world::A_AK47_Fire")
    
            weapon:SetMagazineMesh("nanos-world::SM_AK47_Mag_Empty")
            weapon:SetCrosshairMaterial("nanos-world::MI_Crosshair_Submachine")
            return weapon
        end,
        AP5 = function(location, rotation)
            local weapon = Weapon(location or Vector(), rotation or Rotator(), "nanos-world::SK_ASVal")
    
            weapon:SetAmmoSettings(30, 1000)
            weapon:SetDamage(33)
            weapon:SetSpread(40)
            weapon:SetRecoil(1)
            weapon:SetBulletSettings(1, 20000, 20000, Color(100, 58, 0))
            weapon:SetSightTransform(Vector(0, 0, -3), Rotator(-1.5, 0, 0))
            weapon:SetLeftHandTransform(Vector(22, 0, 9), Rotator(0, 60, 90))
            weapon:SetRightHandOffset(Vector(-10, 0, 0))
            weapon:SetHandlingMode(HandlingMode.SingleHandedWeapon)
            weapon:SetCadence(0.1)
            weapon:SetWallbangSettings(50, 0.75)
    
            weapon:SetParticlesBulletTrail("nanos-world::P_Bullet_Trail")
            weapon:SetParticlesBarrel("nanos-world::P_Weapon_BarrelSmoke")
            weapon:SetParticlesShells("nanos-world::P_Weapon_Shells_762x39")
    
            weapon:SetSoundDry("nanos-world::A_Rifle_Dry")
            weapon:SetSoundLoad("nanos-world::A_Rifle_Load")
            weapon:SetSoundUnload("nanos-world::A_Rifle_Unload")
            weapon:SetSoundZooming("nanos-world::A_AimZoom")
            weapon:SetSoundAim("nanos-world::A_Rattle")
            weapon:SetSoundFire("nanos-world::A_AK47_Shot")
    
            weapon:SetAnimationCharacterFire("nanos-world::AM_Mannequin_Sight_Fire")
            weapon:SetAnimationReload("nanos-world::AM_Mannequin_Reload_Rifle")
            weapon:SetAnimationFire("nanos-world::A_AK47_Fire")
    
            weapon:SetMagazineMesh("nanos-world::SM_AK47_Mag_Empty")
            weapon:SetCrosshairMaterial("nanos-world::MI_Crosshair_Submachine")
            return weapon
        end,
        AK5C = function(location, rotation)
            local weapon = Weapon(location or Vector(), rotation or Rotator(), "nanos-world::SK_AK5C")
    
            weapon:SetAmmoSettings(30, 1000)
            weapon:SetDamage(40)
            weapon:SetSpread(2)
            weapon:SetRecoil(1)
            weapon:SetBulletSettings(1, 20000, 20000, Color(100, 58, 0))
            weapon:SetSightTransform(Vector(0, 0, -2), Rotator(-1.5, 0, 0))
            weapon:SetLeftHandTransform(Vector(22, 0, 9), Rotator(0, 60, 90))
            weapon:SetRightHandOffset(Vector(-10, 0, 0))
            weapon:SetHandlingMode(HandlingMode.SingleHandedWeapon)
            weapon:SetCadence(0.1)
            weapon:SetWallbangSettings(50, 0.75)
    
            weapon:SetParticlesBulletTrail("nanos-world::P_Bullet_Trail")
            weapon:SetParticlesBarrel("nanos-world::P_Weapon_BarrelSmoke")
            weapon:SetParticlesShells("nanos-world::P_Weapon_Shells_762x39")
    
            weapon:SetSoundDry("nanos-world::A_Rifle_Dry")
            weapon:SetSoundLoad("nanos-world::A_Rifle_Load")
            weapon:SetSoundUnload("nanos-world::A_Rifle_Unload")
            weapon:SetSoundZooming("nanos-world::A_AimZoom")
            weapon:SetSoundAim("nanos-world::A_Rattle")
            weapon:SetSoundFire("nanos-world::A_AK47_Shot")
    
            weapon:SetAnimationCharacterFire("nanos-world::AM_Mannequin_Sight_Fire")
            weapon:SetAnimationReload("nanos-world::AM_Mannequin_Reload_Rifle")
            weapon:SetAnimationFire("nanos-world::A_AK5C_Fire")
    
            weapon:SetMagazineMesh("nanos-world::SM_AK5C_Mag")
            weapon:SetCrosshairMaterial("nanos-world::MI_Crosshair_Regular_X")
            return weapon
        end
    },

    Secondary = {},
    Equipment = {
        SmokeGrenade = function(location, rotation)
            local Smoke = GrenadeType()
                return Smoke
        end
    }
}


--only able to make one grenade for now 
function GrenadeType(color)
    local weapon = Grenade(location or Vector(), rotation or Rotator(),"nanos-world::SM_Spraycan_01","nanos-world::P_Weapon_BarrelSmoke")
    weapon:SetMaterial("nanos-world::M_NanosMasked")

-- paints it red
weapon:SetMaterialColorParameter("Tint", color or  Color(0, 0, 0))
    
    weapon:SetDamage(0, 0, 0, 0, 0)
    Grenade.Subscribe("Explode", function(self)
        local grabPos = self:GetLocation()
        Package.Log(grabPos)
            local i = 0 
            local smokeOverTime = 1
            Timer.SetInterval(function()
                if(i == 20 ) then return false end
                i = i + 1
                    if (i  > 10 ) then 
                        smokeOverTime = 0
                    else
                        smokeOverTime = smokeOverTime + 0.5
                    end 
                local particle_asset = "nanos-world::P_Smoke"
                local particle_burst = Particle(grabPos, Rotator(), particle_asset, false , true)
                particle_burst:SetScale(Vector(smokeOverTime,smokeOverTime,smokeOverTime))
                particle_burst:SetLifeSpan(10)
            end,1000)
        end)
    return weapon
end