--[[
    github: 2ptr

    simple mindmg override indicator [feel free to use it.]
]]

local function draw()

    local overrided = false
    local getbinds = Cheat.GetBinds()
    local sx, sy = EngineClient.GetScreenSize().x, EngineClient.GetScreenSize().y
    local val

    for i = 1, #getbinds do
        if getbinds[i]:GetName() == "Minimum Damage" then
            overrided = true
            val = tostring(getbinds[i]:GetValue())
        end
    end

    if overrided then
        Render.Text(val, Vector2.new(sx / 2 + 10, sy / 2 - 20), Color.RGBA(255, 255, 255, 255), 10)
    end

end
Cheat.RegisterCallback("draw", draw)
