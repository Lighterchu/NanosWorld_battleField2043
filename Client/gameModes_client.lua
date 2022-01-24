-- Package.RequirePackage("corelib")

    -- Client.Subscribe("KeyPress", function(key_name)
    --     Package.Log(key_name)
    --     if key_name == "One" then
    --         CallServerEvent("SwitchToWeapon")
    --     elseif key_name == "Two" then
    --         CallServerEvent("SwitchToPistol")
    --     elseif key_name == "Three" then
    --         CallServerEvent("SwitchToGrenade")
    --     end
    -- end)

    local ScoreTable = {}

    local CurrentZone = "none"


local DebugLocation = Render.GetViewportSize()
Render.ClearItems(0)
local text = "" -- Text to render on the Canvas.
local location = Vector2D(DebugLocation.X * 0.5, DebugLocation.Y * 0.9) -- Screen space position to render the text.
local font_type = 0 -- Roboto
local font_size = 20 -- Size of the font
local text_color = Color(1, 1, 1, 1) -- Color to render the text.
local kerning = 0 -- Horizontal spacing adjustment to modify the spacing between each letter.
local shadow_color = Color(1, 1, 1, 0) -- Color to render the shadow of the text.
local shadow_offset = Vector2D(1, 1) -- Pixel offset relative to the screen space position to render the shadow of the text.
local is_centered_x = true -- If true, then interpret the screen space position X coordinate as the center of the rendered text.
local is_centered_y = false -- If true, then interpret the screen space position Y coordinate as the center of the rendered text.
local is_outlined = false -- If true, then the text should be rendered with an outline.
local enable_shadow = true -- If true, then shadow will be enabled
local outline_color = Color(1, 1, 1, 0) -- Color to render the outline for the text.

--local DebugText = Render.AddText(0, text, location, font_type, font_size, text_color, kerning, is_centered_x, is_centered_y, enable_shadow, shadow_offset, shadow_color, is_outlined, outline_color)
local AText = Render.AddText(0, "A", Vector2D(-300, 0), 0, 40, Color(1, 0, 0, 0.5), 0, false, false, false, Vector2D(0, 0), Color(0, 0, 0, 1), true, Color(0, 0, 0, 1))
local BText = Render.AddText(0, "B", Vector2D(-300, 0), 0, 40, Color(1, 0, 0, 0.5), 0, false, false, false, Vector2D(0, 0), Color(0, 0, 0, 1), true, Color(0, 0, 0, 1))
local CText = Render.AddText(0, "C", Vector2D(-300, 0), 0, 40, Color(1, 0, 0, 0.5), 0, false, false, false, Vector2D(0, 0), Color(0, 0, 0, 1), true, Color(0, 0, 0, 1))
local CaptureText = Render.AddText(0, "penis", Vector2D(DebugLocation.X * 0.65, DebugLocation.Y * 0.80), 0, 32, Color(1, 1, 1, 1), 0, false, false, false, Vector2D(0, 0), Color(0, 0, 0, 1), true, Color(0, 0, 0, 1))
local ScoreText = Render.AddText(0, "Red Blue", Vector2D(DebugLocation.X * 0.5, DebugLocation.Y * 0.1), 0, 32, Color(1, 1, 1, 1), 0, true, false, false, Vector2D(0, 0), Color(0, 0, 0, 1), true, Color(0, 0, 0, 1))

Client.Subscribe("Tick", function(delta_time)
    local Player = Client.GetLocalPlayer()
    local Char = Player:GetControlledCharacter()
    local CharLocation = Char:GetLocation()
    local location = Render.Project(Vector(-3508, 7485, 400))
    local location2 = Render.Project(Vector(-5524, -4937, 1033))
    local location3 = Render.Project(Vector(2717, -9367, 400))
    --Render.UpdateItemText(0, DebugText, "X: " .. CharLocation.X .. " Y: " .. CharLocation.Y .. " Z: " .. CharLocation.Z)
    if location.X ~= -1.0 or location.Y ~= -1.0 then
        Render.UpdateItemPosition(0, AText, location)
    end
    if location2.X ~= -1.0 or location2.Y ~= -1.0 then
        Render.UpdateItemPosition(0, BText, location2)
    end
    if location3.X ~= -1.0 or location3.Y ~= -1.0 then
        Render.UpdateItemPosition(0, CText, location3)
    end
    if CurrentZone ~= "none" then
        if ScoreTable.Control["Red"][CurrentZone].Controlled then
            Render.UpdateItemText(0, CaptureText, "Secured " .. CurrentZone)
        else
            Render.UpdateItemText(0, CaptureText, "Securing " .. CurrentZone .. " - " .. ScoreTable.Control["Red"][CurrentZone].Score * 0.10 .. "%")
        end
    else
        Render.UpdateItemText(0, CaptureText, "")
    end
    Render.UpdateItemText(0, ScoreText, "Red: " .. ScoreTable.GameScore.Red .. "  Blue: " .. ScoreTable.GameScore.Blue)
end)

SubscribeClientEvent("SendScoreData", function(table)
    if table ~= ScoreTable then
        ScoreTable = table
    end
end)

SubscribeClientEvent("TriggerEnteredZone", function(zone)
    if CurrentZone == "none" then
        CurrentZone = zone
    end
end)

SubscribeClientEvent("TriggerExitedZone", function(zone)
    if zone == CurrentZone then
        CurrentZone = "none"
    end
end)



--[[local RenderText = TextRender(
    Vector(-3508, 7485, 200),
    Rotator(),
    "A",
    Vector(2, 2, 2), -- Scale
    Color(1, 0, 0), -- Red Color
    FontType.OpenSans,
    TextRenderAlignCamera.FaceCamera
)

RenderText:SetMaterial("nanos-world::M_NanosDefault_Translucent_Depth")]]