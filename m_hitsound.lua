--[[
  author: pred#2448

  plays sound on hit
]]

local dir = Menu.TextBox("LUA", "Sound directory", 128, "buttons/arena_switch_press_02")
local vol = Menu.SliderFloat("LUA", "Volume", 1, 0, 1)

Cheat.RegisterCallback("events", function(e)
    if e:GetName() ~= "player_hurt" then
        return
    end
    
    local localplayer = EntityList.GetLocalPlayer()
    local attacker = EntityList.GetPlayerForUserID(e:GetInt("attacker"))
    
    if attacker == localplayer then
        EngineClient.ExecuteClientCmd(string.format("playvol %s %i", dir:Get(), vol:Get()))
    end
end)
