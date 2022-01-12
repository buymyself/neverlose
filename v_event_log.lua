--[[
    author: pred

    gamesense like event logs
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

local ConsolePrint = function(label, r, g, b, a)
    local ConColorMsg = ffi.cast("ColorMsgFn", ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("tier0.dll"), "?ConColorMsg@@YAXABVColor@@PBDZZ"))
    
    local col = ffi.new("Color")
    col.r = r
    col.g = g
    col.b = b
    col.a = a

    ConColorMsg(col, label)
end

local log = {
}
local console = Render.InitFont("lucida console", 10, {"r"})
local hitboxes = {
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
local reasons = {
    "resolver",
    "spread",
    "occlusion",
    "prediction error",
}

local drawlog = function(prefix, prefix_r, prefix_g, prefix_b, prefix_a, text, print_text)
    log[#log + 1] = {
        text,
        255,
        math.floor(GlobalVars.curtime),
    }
    ConsolePrint(prefix, prefix_r, prefix_g, prefix_b, prefix_a)
    print(print_text)
end

Cheat.RegisterCallback("events", function(event)
    local localplayer = EntityList.GetLocalPlayer()
    if event:GetName() == "item_purchase" then
        if event:GetName() ~= "item_purchase" then
            return
        end
        local buyerid = EntityList.GetPlayerForUserID(event:GetInt("userid"))
        local item = event:GetString("weapon")
        if buyerid ~= localplayer and item ~= "weapon_unknown" and buyerid ~= nil then
            local buyer = buyer_ent:GetName()
            drawlog("[log] ", 180, 230, 20, 255, string.format("%s bought %s", buyer, item), string.format("%s bought %s\r", buyer, item))
        end
    end
    if event:GetName() == "player_hurt" then
        local target = EntityList.GetPlayerForUserID(event:GetInt("userid"))
        local attacker = EntityList.GetPlayerForUserID(event:GetInt("attacker"))
        local target_name = target:GetName()
        local dmghealth = event:GetInt("dmg_health")
        local healthremain = event:GetInt("health")
        local hitbox = hitboxes[event:GetInt("hitgroup")]
        if attacker == localplayer then
            drawlog("[log] ", 180, 230, 20, 255, string.format("Hit %s in the %s for %s damage (%s health remaining)", target_name, hitbox, dmghealth, healthremain), string.format("Hit %s in the %s for %s damage (%s health remaining)\r", target_name, hitbox, dmghealth, healthremain))
        end
    end
end)

Cheat.RegisterCallback("registered_shot", function(reg) 
    local missreason = reasons[reg.reason]
    if reg.reason == 0 then
        return
    end
    drawlog("[log] ", 180, 230, 20, 255, string.format("Missed shot due to %s", missreason), string.format("Missed shot due to %s\r", missreason))
end)

local clearlog = function()

    if #log ~= 0 then
        if EngineClient:IsConnected() == false then
            table.remove(log, #log)
        end 

        if #log > 6 then
            table.remove(log, 1)
        end
        
        if log[1][3] + 5 < math.floor(GlobalVars.curtime) then
            log[1][2] = log[1][2] - math.floor(GlobalVars.frametime * 600)
            if log[1][2] < 0 then
                table.remove(log, 1)
            end
        end
    end
end

local drawlog = function()
    clearlog()
    for i = 1, #log do
        Render.Text(""..log[i][1].."", Vector2.new(7 + 1, 5 + i * 12 + 1 - 12), Color.RGBA(0, 0, 0, log[i][2]), 10, console)
        Render.Text(""..log[i][1].."", Vector2.new(7, 5 + i * 12 - 12), Color.RGBA(255, 255, 255, log[i][2]), 10, console)
    end
end

Cheat.RegisterCallback("draw", function()
    if EngineClient.IsConnected() == false then 
        return 
    end
    drawlog()
end)
