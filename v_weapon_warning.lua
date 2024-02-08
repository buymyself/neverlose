--[[
    github: 2ptr

    desc: very simple weapon warnings
]]

local FONT_CALIBRI = Render.InitFont("calibri", 20, {"b"})
local sx, sy = EngineClient.GetScreenSize().x, EngineClient.GetScreenSize().y
local mc = Menu.MultiCombo("LUA", "Notifications", {"Reload", "Inaccuracy", "High ping", "Shifting tickbase", "Damage override"}, -1)
local ps = Menu.SliderInt("LUA", "Ping warning", 120, 100, 200)

local function shadow_under_text(text, size, font, x, y, r, g, b, a)
    local calc = Render.CalcTextSize(text, size, font)
    local x_a = calc.x
    local y_a = calc.y

    Render.GradientBoxFilled(Vector2.new(x, y + y_a / 2 + 6), Vector2.new(x + x_a / 2 + 7, y - y_a / 2 - 7), Color.RGBA(20, 20, 20, 95), Color.RGBA(20, 20, 20, 0), Color.RGBA(20, 20, 20, 95), Color.RGBA(20, 20, 20, 0))
    Render.GradientBoxFilled(Vector2.new(x, y + y_a / 2 + 6), Vector2.new(x - x_a / 2 - 7, y - y_a / 2 - 7), Color.RGBA(20, 20, 20, 95), Color.RGBA(20, 20, 20, 0), Color.RGBA(20, 20, 20, 95), Color.RGBA(20, 20, 20, 0))
    
    Render.Text(text, Vector2.new(x + 1, y), Color.RGBA(20, 20, 20, a), size, font, false, true)
    Render.Text(text, Vector2.new(x, y), Color.RGBA(r, g, b, a), size, font, false, true)
end

local function draw()
    local localplayer = EntityList.GetClientEntity(EngineClient.GetLocalPlayer()):GetPlayer()
    local weapon = localplayer:GetActiveWeapon()

    if weapon == nil then
        return
    end

    local clip1 = weapon:GetProp("m_iClip1")
    local inaccuracy = weapon:GetInaccuracy(weapon)
    local fa = math.min(math.floor(math.sin((GlobalVars.realtime % 2.8) * 4) * 175 + 50), 255)
    local ping = math.floor(EngineClient.GetNetChannelInfo():GetLatency(0) * 1000)
    local gc = Exploits.GetCharge()
    local y = 0
    local getbinds = Cheat.GetBinds()
    local dt = false
    local overrided = false
    local val = 0

    for i = 1, #getbinds do
        if getbinds[i]:GetName() == "Minimum Damage" then
            overrided = true
            val = tostring(getbinds[i]:GetValue())
        end
        if getbinds[i]:GetName() == "Double Tap" then
            dt = true
        end
    end

    if ping >= ps:Get() and mc:Get(3) then
        shadow_under_text("*HIGH PING*", 20, FONT_CALIBRI, sx / 2, sy - sy + 120 + y, 255, 0, 0, 255)
        y = y + 36
    end

    if weapon:IsGun() and weapon:GetClassId() ~= 268 then
        -- if item is a gun
        if clip1 <= 2 and mc:Get(1) then   
            shadow_under_text("!RELOAD!", 20, FONT_CALIBRI, sx / 2, sy - sy + 120 + y, 255, 0, 0, 255)
            y = y + 36
        end
        if inaccuracy >= 0.34 and mc:Get(2) then
            shadow_under_text("^HIGH INACCURACY^", 20, FONT_CALIBRI, sx / 2, sy - sy + 120 + y, 255, 0, 0, 255)
            y = y + 36
        end
    
    end
    if gc < 1 and dt and mc:Get(4) then
        shadow_under_text(string.format("SHIFTING %.4f", gc), 20, FONT_CALIBRI, sx / 2, sy - sy + 120 + y, 255, 0, 0, 255)
        y = y + 36
    end

    if overrided and mc:Get(5) then
        shadow_under_text(string.format("DMG: %i", val), 20, FONT_CALIBRI, sx / 2, sy - sy + 120 + y, 255, 255, 255, 255)
        y = y + 36
    end
end

Cheat.RegisterCallback("draw", function()
    if not EngineClient.IsConnected() then
        return
    end
    local localplayer = EntityList.GetLocalPlayer()
    if localplayer:GetProp("m_iHealth") == 0 then
        return
    end
    draw()
end)
