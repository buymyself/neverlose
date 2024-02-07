--[[
    github: mcdonaldsfan

    found this hitlog in sigma's 5v5 video XD, a remade for nl
]]

local f1 = Render.InitFont("Verdana", 12, {})
local f2 = Render.InitFont("Verdana", 12, {"b"})
local sx, sy = EngineClient.GetScreenSize().x, EngineClient.GetScreenSize().y
local s = Menu.Switch("LUA", "Enable logger", false)
local y = Menu.SliderInt("LUA", "Y extend", 0, -200, 200)

local log = {

}

local reasons = {
    "resolver",
    "spread",
    "occlusion",
    "prediction error",
}


Cheat.RegisterCallback("events", function(event)
    local localplayer = EntityList.GetLocalPlayer()
    if event:GetName() ~= "player_hurt" then
        return
    end

    local target = EntityList.GetPlayerForUserID(event:GetInt("userid"))
    local attacker = EntityList.GetPlayerForUserID(event:GetInt("attacker"))
    local name = target:GetName()
    local damage = event:GetInt("dmg_health")
    local remaining = event:GetInt("health")

    if attacker == localplayer then
        -- log[#log + 1].dmg = ""..damage..""
        -- log[#log + 1].name = ""..name..""
        -- log[#log + 1].health = remaining
        -- log[#log + 1].alpha = 255
        -- log[#log + 1].ctime = GlobalVars.curtime
        table.insert(log, {
            dmg = tostring(damage),
            name = tostring(name),
            health = remaining,
            alpha = 255,
            r = 25,
            g = 230,
            b = 25,
            ctime = GlobalVars.curtime,
        })
    end
end)

Cheat.RegisterCallback("registered_shot", function(reg) 
    local missreason = reasons[reg.reason]

    if reg.reason == 0 then
        return
    end
    local name = EntityList.GetClientEntity(reg.target_index):GetPlayer():GetName()

    table.insert(log, {
        dmg = tostring(missreason),
        name = tostring(name),
        health = 1,
        alpha = 255,
        r = 235,
        g = 50,
        b = 25,
        ctime = GlobalVars.curtime,
    })
end)

local function render()
    
    if not s:Get() then
        return
    end

    local ye = y:Get()

    for i = 1, #log do
        local dmgx = Render.CalcTextSize(log[i].dmg, 12, f1).x + 2
        local namex = Render.CalcTextSize(log[i].name, 12, f2).x

        Render.Text(log[i].dmg, Vector2.new(sx / 2 - dmgx + 1, sy / 1.8 + i * 12 + 1 + ye), Color.RGBA(0, 0, 0, log[i].alpha), 12, f1)
        Render.Text(log[i].dmg, Vector2.new(sx / 2 - dmgx, sy / 1.8 + i * 12 + ye), Color.RGBA(log[i].r, log[i].g, log[i].b, log[i].alpha), 12, f1)

        Render.Text(log[i].name, Vector2.new(sx / 2 + 2 + 1, sy / 1.8 + i * 12 + 1 + ye), Color.RGBA(0, 0, 0, log[i].alpha), 12, f2)
        Render.Text(log[i].name, Vector2.new(sx / 2 + 2, sy / 1.8 + i * 12 + ye), Color.RGBA(255, 255, 255, log[i].alpha), 12, f2)

        if log[i].health == 0 then
            Render.BoxFilled(Vector2.new(sx / 2 + 2, sy / 1.8 + i * 12 + 6 + ye), Vector2.new(sx / 2 + 2 + namex, sy / 1.8 + i * 12 + 8 + ye), Color.RGBA(230, 0, 0, log[i].alpha))
        end
    end
end

local clearlog = function()
    if #log ~= 0 then
        if #log > 6 then
            table.remove(log, 1)
        end
        for i = 1, #log do
            if log[i] == nil then
                return
            end
            if log[i].ctime + 4 > math.floor(GlobalVars.curtime) then
                return
            end
            log[i].alpha = log[i].alpha - math.floor(GlobalVars.frametime * 300)
    
            if log[i].alpha < 0 then
                table.remove(log, i)
            end
        end
    end
end

local function draw()
    if not EngineClient.IsConnected() then
        table.remove(log, #log)
        return
    end
    render()
    clearlog()
end
Cheat.RegisterCallback("draw", draw)
