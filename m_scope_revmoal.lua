--[[
    github: mcdonaldsfan

    simply removes the scope of ssg08
]]
local bit = require "bit"
local W_SCOPE = MatSystem.FindMaterial("models/weapons/v_models/snip_ssg08/snip_ssg08_scope", "")
local W_GLASS = MatSystem.FindMaterial("models/weapons/v_models/snip_ssg08/glass", "")
local s = Menu.Switch("LUA", "Remove scope attachment", false)
local t = Menu.Text("LUA", "PS: ONLY WORKS ON SSG08")

local function draw()
    local sg = s:Get()
    --Sets MATERIAL_VAR_NO_DRAW to true, (1 << 2).
    W_SCOPE:SetMaterialVarFlag(bit.lshift(2, 1), sg)
    W_GLASS:SetMaterialVarFlag(bit.lshift(2, 1), sg)
end

Cheat.RegisterCallback("draw", draw)
