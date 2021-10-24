Package.RequirePackage("corelib")
Package.RequirePackage("nanos-world-weapons")



Assault = Assault or  {}
Assault.name = "Assault"

Assault.Levels = {
    {"Assault", "1"},
    {"Assault Proficiency I", "2"},
    {"Assault Proficiency II","3"},
    {"Assault Proficiency III","4"},
    {"Assault Mastery I","5"},
    {"Assault Mastery II","6"},
    {"Assault Mastery III","7"}
}

Assault.Loadout = {
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
            local weapon = Weapon(location or Vector(), rotation or Rotator(),"nanos-world::SM_Grenade_G67",
            "nanos-world::P_Grenade_Special",
            "nanos-world::A_Explosion_Large")
    
            
            return weapon
        end

    }

    
    
}