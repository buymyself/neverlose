local getvel = function(p)
    local vel0, vel1 = p:GetProp('m_vecVelocity[0]'), p:GetProp('m_vecVelocity[1]')
    return math.floor(math.sqrt(vel0 ^ 2 + vel1 ^ 2))
end

local entity = EntityList
local leanang = Menu.SliderInt("LUA", "Lean angle", 0, -180, 180)
local leanon = Menu.Switch("LUA", "Lean on low velocity", false)

local function lean(cmd)
    local localplayer = entity.GetLocalPlayer()
    if leanon:Get() then
        if getvel(localplayer) > 80 then
            return
        end
        cmd.viewangles.roll = leanang:Get()
    else
        cmd.viewangles.roll = leanang:Get()
    end
end

Cheat.RegisterCallback("prediction", lean)
