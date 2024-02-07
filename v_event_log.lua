--[[
    github: mcdonaldsfan

    gamesense like event log for nl [recoded]
]]

local ffi = require("ffi")

ffi.cdef[[
    typedef unsigned char BYTE;
    typedef void *PVOID;
    typedef PVOID HMODULE;
    typedef const char *LPCSTR;
    typedef int *FARPROC;
    
    HMODULE GetModuleHandleA(
        LPCSTR lpModuleName
    );
    
    FARPROC GetProcAddress(
        HMODULE hModule,
        LPCSTR  lpProcName
    );
    
    typedef struct{
        BYTE r, g, b, a;
    } Color;
    
    typedef void(__cdecl *ColorMsgFn)(Color&, const char*);
]]

local colorprint = function(label, r, g, b, a)
    local ConColorMsg = ffi.cast("ColorMsgFn", ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("tier0.dll"), "?ConColorMsg@@YAXABVColor@@PBDZZ"))
    
    local col = ffi.new("Color")
    col.r = r
    col.g = g
    col.b = b
    col.a = a

    ConColorMsg(col, label)
end

local SWITCH = Menu.Switch
local COMBO = Menu.Combo
local MCOMBO = Menu.MultiCombo
local SLIDERINT = Menu.SliderInt
local TEXT = Menu.Text
local TEXTBOX = Menu.TextBox

local FONT_CONSOLE = Render.InitFont("lucida console", 10, {"r"})
local HITGROUPS = {
    [0] = "generic",
    [1] = "head",
    [2] = "chest",
    [3] = "stomach",
    [4] = "left arm",
    [5] = "right arm",
    [6] = "left leg",
    [7] = "right leg",
    [10] = "gear",
}
local REASONS = {
    [0] = "hit",
    [1] = "resolver",
    [2] = "spread",
    [3] = "occlusion",
    [4] = "prediction error",
}

local loggerfilter = MCOMBO("LUA", "Event log", {"Hit", "Hurt", "Misses", "Purchase"}, -1)
local t = {}

local function addlog(string)
    --insert log function, makes the whole thing easier and cleaner
    table.insert(t, {
        text = string,
        alpha = 255,
        ctime = GlobalVars.curtime,
    })

    colorprint("[logger] ", 180, 230, 20, 255)
    print(string.format("%s \r", string))
end

local function textoutline(string, x, y, r, g, b, a, fontsize, font, middle)
    Render.Text(string, Vector2.new(x + 1, y + 1), Color.RGBA(0, 0, 0, a), fontsize, font, false, middle)
    Render.Text(string, Vector2.new(x, y), Color.RGBA(r, g, b, a), fontsize, font, false, middle)
end


local function firedshot(s)

    if not loggerfilter:Get(3) then
        return
    end

    local reason = REASONS[s.reason]
    local whg = HITGROUPS[s.wanted_hitgroup]
    local hc = s.hitchance
    local bt = s.backtrack
    local wdmg = s.wanted_damage
    local name = EntityList.GetClientEntity(s.target_index):GetPlayer():GetName()
    local sprd = s.spread_degree

    if reason == "hit" then
        return
    end
    --miss
    addlog(string.format("Missed %s's %s(%i) due to %s [sp=%.2f°; hc=%i]", name, whg, wdmg, reason, sprd, hc))
end

Cheat.RegisterCallback("events", function(e)
    local localplayer = EntityList.GetLocalPlayer()
    
    if e:GetName() == "item_purchase" then
        local buyer_id = EntityList.GetPlayerForUserID(e:GetInt("userid"))
        local buyer_name = buyer_id:GetName()
        local item = e:GetString("weapon")

        if buyer_id == localplayer or item == "weapon_unknown" or loggerfilter:Get(4) then
            return
        end
        --purchase
        addlog(string.format("%s bought %s", buyer_name, item))
    end

    if e:GetName() == "player_hurt" then
        local attacker = EntityList.GetPlayerForUserID(e:GetInt("attacker"))
        local target = EntityList.GetPlayerForUserID(e:GetInt("userid"))
        local att_name = attacker:GetName()
        local tar_name = target:GetName()
        local dmg = e:GetInt("dmg_health")
        local remain = e:GetInt("health")
        local hg = HITGROUPS[e:GetInt("hitgroup")]

        if attacker == localplayer and loggerfilter:Get(1) then
            --hit
            addlog(string.format("Hit %s in the %s for %i damage (%i health remaining)", tar_name, hg, dmg, remain))
        end

        if target == localplayer and loggerfilter:Get(2) then
            --hurt
            addlog(string.format("Got hit by %s in the %s for %i damage (%i health remaining)", att_name, hg, dmg, remain))
        end
    end
end)

local function clear()
    if #t == nil then
        --if the table has nothing, return.
        return
    end

    if #t > 6 then
        --if table have more than 6 indexes, removes first index.
        table.remove(t, 1)
    end

    if not EngineClient.IsConnected() then
        --if client isn't connected, remove all the indexes.
        table.remove(t, #t)
        return
    end

    for i = 1, #t do
        --if index has nothing, return.
        if t[i] == nil then
            return
        end
        --timeout
        if t[i].ctime + 6.5 > math.floor(GlobalVars.curtime) then
            return
        end
        --starts fadeaway
        t[i].alpha = t[i].alpha - math.floor(GlobalVars.frametime * 600)
        --if alpha less than 0, removes the index.
        if t[i].alpha < 0 then
            table.remove(t, i)
        end
    end
end

local function render()
    --draw the logs.
    clear()
    for i = 1, #t do
        textoutline(t[i].text, 7, 5 + i * 12 - 12, 255, 255, 255, t[i].alpha, 10, FONT_CONSOLE, false)
    end
end

Cheat.RegisterCallback("draw", render)
Cheat.RegisterCallback("registered_shot", firedshot)
