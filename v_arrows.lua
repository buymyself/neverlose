--[[
  github: mcdonaldsfan

  simple inverter arrows and direction arrows
]]

local entity = EntityList
local client = EngineClient

local mcombo = Menu.MultiCombo("LUA", "Arrows", {"Invert", "Yaw base"}, 0)
local clr = Menu.ColorEdit("LUA", "Color", Color.RGBA(150, 150, 255, 205))
local sx, sy = client.GetScreenSize().x, client.GetScreenSize().y

local function draw()
    if not client.IsConnected() then
        return
    end
    if entity.GetLocalPlayer():GetProp("m_iHealth") == 0 then
        return
    end
    local invert = AntiAim.GetInverterState() --inverter
    local l = false --left
    local r = false --right
    local b = false --backward
    local ic1 = Color.RGBA(25, 25, 25, 150) --leftinvert color
    local ic2 = Color.RGBA(25, 25, 25, 150) --rightinvert color
    local lc = Color.RGBA(25, 25, 25, 150) --left color
    local rc = Color.RGBA(25, 25, 25, 150) --right color
    local bc = Color.RGBA(25, 25, 25, 150) --backward color
    local binds = Cheat.GetBinds()
    local clr = clr:GetColor()

    if invert then
        ic1 = clr
    else
        ic2 = clr
    end

    for i = 1, #binds do
        if binds[i]:GetName() == "Yaw Base" and binds[i]:GetValue() == "Left" then
            l = true
            lc = clr
        end
        if binds[i]:GetName() == "Yaw Base" and binds[i]:GetValue() == "Right" then
            r = true
            rc = clr
        end
        if binds[i]:GetName() == "Yaw Base" and binds[i]:GetValue() == "Backward" then
            b = true
            bc = clr
        end
    end
    if mcombo:Get(1) then
        --invert arrows
        Render.PolyFilled(ic1, Vector2.new(sx / 2 - 30, sy / 1.93 - 5), Vector2.new(sx / 2 - 15, sy / 1.93 + 10), Vector2.new(sx / 2 - 35, sy / 1.93 + 10)) --left
        Render.PolyFilled(ic2, Vector2.new(sx / 2 + 30, sy / 1.93 - 5), Vector2.new(sx / 2 + 15, sy / 1.93 + 10), Vector2.new(sx / 2 + 35, sy / 1.93 + 10)) --right
    end
    if mcombo:Get(2) then
        --direction arrows
        Render.PolyFilled(bc, Vector2.new(sx / 2 - 10, sy / 1.93 + 15), Vector2.new(sx / 2 + 10, sy / 1.93 + 15), Vector2.new(sx / 2, sy / 1.93 + 30)) --back
        Render.PolyFilled(lc, Vector2.new(sx / 2 - 35, sy / 2 - 10), Vector2.new(sx / 2 - 35, sy / 2 + 10), Vector2.new(sx / 2 - 50, sy / 2)) --left
        Render.PolyFilled(rc, Vector2.new(sx / 2 + 35, sy / 2 - 10), Vector2.new(sx / 2 + 35, sy / 2 + 10), Vector2.new(sx / 2 + 50, sy / 2)) --right
    end
end

Cheat.RegisterCallback("draw", draw)
