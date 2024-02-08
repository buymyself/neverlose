--[[
    github: 2ptr

    "+" like bullet impact for neverlose
]]

local sc = Menu.SwitchColor("LUA", "Bullet Impact", false, Color.RGBA(255, 255, 255))
local sc_l = Menu.SliderInt("LUA", "Length", 6, 2, 10)
local t = {

}

Cheat.RegisterCallback("events", function(e)
    if e:GetName() ~= "bullet_impact" then
        return
    end
    local fire_plr = EntityList.GetPlayerForUserID(e:GetInt("userid"))
    local localplayer = EntityList.GetLocalPlayer()
    if fire_plr ~= localplayer then
        return
    end
    table.insert(t, {
        x = e:GetInt("x"),
        y = e:GetInt("y"),
        z = e:GetInt("z"),
        a = 255,
        ctime = GlobalVars.curtime,
    })
end)

local function removeimpact()
    if #t == nil then
        return
    end

    for i = 1, #t do
        if t[i] == nil then
            return
        end

        if not EngineClient.IsConnected() then
            table.remove(t, #t)
            return
        end

        if t[i].ctime + 4 > math.floor(GlobalVars.curtime) then
            return
        end

        t[i].a = t[i].a - math.floor(GlobalVars.frametime * 300)

        if t[i].a < 0 then
            table.remove(t, i)
        end
    end
end

local function render()
    if not EngineClient.IsConnected() then
        return
    end

    if not sc:Get() then
        return
    end

    removeimpact()
    local clr = sc:GetColor()
    local r = clr.r
    local g = clr.g
    local b = clr.b    
    local l = sc_l:Get()

    for i = 1, #t do

        local screen_pos = Render.WorldToScreen(Vector.new(t[i].x, t[i].y, t[i].z))

        local sx = screen_pos.x
        local sy = screen_pos.y

        Render.Line(Vector2.new(sx, sy - l), Vector2.new(sx, sy + l), Color.new(r, g, b, (t[i].a / 255)))
        Render.Line(Vector2.new(sx - l, sy), Vector2.new(sx + l, sy), Color.new(r, g, b, (t[i].a / 255)))
    end
end


Cheat.RegisterCallback("draw", render)
