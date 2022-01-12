--[[
    author: pred#2448

    my messy ass code, a very simple conditional aa.
    please do not paste this shit into ur script and make it paid ty!
]]

local onground = function(ent)
    return bit.band(ent:GetProp('DT_BasePlayer', 'm_fFlags'), bit.lshift(1, 0)) == 1
end
local induck = function(ent)
    return bit.band(ent:GetProp('DT_BasePlayer', 'm_fFlags'), bit.lshift(1, 1)) ~= 0
end
local getvel = function(ent)
    local vel0, vel1 = ent:GetProp('m_vecVelocity[0]'), ent:GetProp('m_vecVelocity[1]')
    return math.floor(math.sqrt(vel0 * vel0 + vel1 * vel1))
end

local SWITCH = Menu.Switch
local COMBO = Menu.Combo
local MCOMBO = Menu.MultiCombo
local SLIDERINT = Menu.SliderInt
local TEXT = Menu.Text
local FONT_TAHOMA = Render.InitFont("tahoma", 12, {"b", "r"})

local ref = {
    standing = {
        aa = {
            enable = SWITCH("[S] Main", "Enable Anti Aim", false),
            pitch = COMBO("[S] Main", "Pitch", {"Disabled", "Down", "Fake Down", "Fake Up"}, 0),
            yaw_base = COMBO("[S] Main", "Yaw Base", {"Foward", "Backward", "Right", "Left", "At Target", "Freestanding"}, 0),
            yaw_add = SLIDERINT("[S] Main", "Yaw Add", 0, -180, 180),
            yaw_mod = COMBO("[S] Main", "Yaw Modifier", {"Disabled", "Center", "Offset", "Random", "Spin"}, 0),
            modifier_deg = SLIDERINT("[S] Main", "Modifier Degree", 0, -180, 180),
        },

        fake = {
            enable = SWITCH("[S] Fake Angle", "Enable Fake Angle", false),
            invert = SWITCH("[S] Fake Angle", "Inverter", false, "Inverts fake angle."),
            l_limit = SLIDERINT("[S] Fake Angle", "Left Limit", 60, 0, 60),
            r_limit = SLIDERINT("[S] Fake Angle", "Right Limit", 60, 0, 60),
            fake_opt = MCOMBO("[S] Fake Angle", "Fake Options", {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}, 0),
            lby_mode = COMBO("[S] Fake Angle", "LBY Mode", {"Disabled", "Opposite", "Sway"}, 0),
            freestand = COMBO("[S] Fake Angle", "Freestanding Desync", {"Off", "Peek Fake", "Peek Real"}, 0),
            desync_os = COMBO("[S] Fake Angle", "Desync On Shot", {"Disabled", "Opposite", "Freestanding", "Switch"}, 0),
        },

        fakelag = {
            enable = SWITCH("[S] Fake Lag", "Enable Fake Lag", false),
            limit = SLIDERINT("[S] Fake Lag", "Limit", 14, 0, 14),
            random = SLIDERINT("[S] Fake Lag", "Randomization", 0, 0, 14),

        },
    },

    moving = {
        aa = {
            enable = SWITCH("[M] Main", "Enable Anti Aim", false),
            pitch = COMBO("[M] Main", "Pitch", {"Disabled", "Down", "Fake Down", "Fake Up"}, 0),
            yaw_base = COMBO("[M] Main", "Yaw Base", {"Foward", "Backward", "Right", "Left", "At Target", "Freestanding"}, 0),
            yaw_add = SLIDERINT("[M] Main", "Yaw Add", 0, -180, 180),
            yaw_mod = COMBO("[M] Main", "Yaw Modifier", {"Disabled", "Center", "Offset", "Random", "Spin"}, 0),
            modifier_deg = SLIDERINT("[M] Main", "Modifier Degree", 0, -180, 180),
        },

        fake = {
            enable = SWITCH("[M] Fake Angle", "Enable Fake Angle", false),
            invert = SWITCH("[M] Fake Angle", "Inverter", false, "Inverts fake angle."),
            l_limit = SLIDERINT("[M] Fake Angle", "Left Limit", 60, 0, 60),
            r_limit = SLIDERINT("[M] Fake Angle", "Right Limit", 60, 0, 60),
            fake_opt = MCOMBO("[M] Fake Angle", "Fake Options", {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}, 0),
            lby_mode = COMBO("[M] Fake Angle", "LBY Mode", {"Disabled", "Opposite", "Sway"}, 0),
            freestand = COMBO("[M] Fake Angle", "Freestanding Desync", {"Off", "Peek Fake", "Peek Real"}, 0),
            desync_os = COMBO("[M] Fake Angle", "Desync On Shot", {"Disabled", "Opposite", "Freestanding", "Switch"}, 0),
        },

        fakelag = {
            enable = SWITCH("[M] Fake Lag", "Enable Fake Lag", false),
            limit = SLIDERINT("[M] Fake Lag", "Limit", 14, 0, 14),
            random = SLIDERINT("[M] Fake Lag", "Randomization", 0, 0, 14),

        },
    },

    inair = {
        aa = {
            enable = SWITCH("[IA] Main", "Enable Anti Aim", false),
            pitch = COMBO("[IA] Main", "Pitch", {"Disabled", "Down", "Fake Down", "Fake Up"}, 0),
            yaw_base = COMBO("[IA] Main", "Yaw Base", {"Foward", "Backward", "Right", "Left", "At Target", "Freestanding"}, 0),
            yaw_add = SLIDERINT("[IA] Main", "Yaw Add", 0, -180, 180),
            yaw_mod = COMBO("[IA] Main", "Yaw Modifier", {"Disabled", "Center", "Offset", "Random", "Spin"}, 0),
            modifier_deg = SLIDERINT("[IA] Main", "Modifier Degree", 0, -180, 180),
        },

        fake = {
            enable = SWITCH("[IA] Fake Angle", "Enable Fake Angle", false),
            invert = SWITCH("[IA] Fake Angle", "Inverter", false, "Inverts fake angle."),
            l_limit = SLIDERINT("[IA] Fake Angle", "Left Limit", 60, 0, 60),
            r_limit = SLIDERINT("[IA] Fake Angle", "Right Limit", 60, 0, 60),
            fake_opt = MCOMBO("[IA] Fake Angle", "Fake Options", {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}, 0),
            lby_mode = COMBO("[IA] Fake Angle", "LBY Mode", {"Disabled", "Opposite", "Sway"}, 0),
            freestand = COMBO("[IA] Fake Angle", "Freestanding Desync", {"Off", "Peek Fake", "Peek Real"}, 0),
            desync_os = COMBO("[IA] Fake Angle", "Desync On Shot", {"Disabled", "Opposite", "Freestanding", "Switch"}, 0),
        },

        fakelag = {
            enable = SWITCH("[IA] Fake Lag", "Enable Fake Lag", false),
            limit = SLIDERINT("[IA] Fake Lag", "Limit", 14, 0, 14),
            random = SLIDERINT("[IA] Fake Lag", "Randomization", 0, 0, 14),

        },
    },

    crouching = {
        aa = {
            enable = SWITCH("[C] Main", "Enable Anti Aim", false),
            pitch = COMBO("[C] Main", "Pitch", {"Disabled", "Down", "Fake Down", "Fake Up"}, 0),
            yaw_base = COMBO("[C] Main", "Yaw Base", {"Foward", "Backward", "Right", "Left", "At Target", "Freestanding"}, 0),
            yaw_add = SLIDERINT("[C] Main", "Yaw Add", 0, -180, 180),
            yaw_mod = COMBO("[C] Main", "Yaw Modifier", {"Disabled", "Center", "Offset", "Random", "Spin"}, 0),
            modifier_deg = SLIDERINT("[C] Main", "Modifier Degree", 0, -180, 180),
        },

        fake = {
            enable = SWITCH("[C] Fake Angle", "Enable Fake Angle", false),
            invert = SWITCH("[C] Fake Angle", "Inverter", false, "Inverts fake angle."),
            l_limit = SLIDERINT("[C] Fake Angle", "Left Limit", 60, 0, 60),
            r_limit = SLIDERINT("[C] Fake Angle", "Right Limit", 60, 0, 60),
            fake_opt = MCOMBO("[C] Fake Angle", "Fake Options", {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}, 0),
            lby_mode = COMBO("[C] Fake Angle", "LBY Mode", {"Disabled", "Opposite", "Sway"}, 0),
            freestand = COMBO("[C] Fake Angle", "Freestanding Desync", {"Off", "Peek Fake", "Peek Real"}, 0),
            desync_os = COMBO("[C] Fake Angle", "Desync On Shot", {"Disabled", "Opposite", "Freestanding", "Switch"}, 0),
        },

        fakelag = {
            enable = SWITCH("[C] Fake Lag", "Enable Fake Lag", false),
            limit = SLIDERINT("[C] Fake Lag", "Limit", 14, 0, 14),
            random = SLIDERINT("[C] Fake Lag", "Randomization", 0, 0, 14),

        },
    },

    slow_walk = {
        aa = {
            enable = SWITCH("[SW] Main", "Enable Anti Aim", false),
            pitch = COMBO("[SW] Main", "Pitch", {"Disabled", "Down", "Fake Down", "Fake Up"}, 0),
            yaw_base = COMBO("[SW] Main", "Yaw Base", {"Foward", "Backward", "Right", "Left", "At Target", "Freestanding"}, 0),
            yaw_add = SLIDERINT("[SW] Main", "Yaw Add", 0, -180, 180),
            yaw_mod = COMBO("[SW] Main", "Yaw Modifier", {"Disabled", "Center", "Offset", "Random", "Spin"}, 0),
            modifier_deg = SLIDERINT("[SW] Main", "Modifier Degree", 0, -180, 180),
        },

        fake = {
            enable = SWITCH("[SW] Fake Angle", "Enable Fake Angle", false),
            invert = SWITCH("[SW] Fake Angle", "Inverter", false, "Inverts fake angle."),
            l_limit = SLIDERINT("[SW] Fake Angle", "Left Limit", 60, 0, 60),
            r_limit = SLIDERINT("[SW] Fake Angle", "Right Limit", 60, 0, 60),
            fake_opt = MCOMBO("[SW] Fake Angle", "Fake Options", {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}, 0),
            lby_mode = COMBO("[SW] Fake Angle", "LBY Mode", {"Disabled", "Opposite", "Sway"}, 0),
            freestand = COMBO("[SW] Fake Angle", "Freestanding Desync", {"Off", "Peek Fake", "Peek Real"}, 0),
            desync_os = COMBO("[SW] Fake Angle", "Desync On Shot", {"Disabled", "Opposite", "Freestanding", "Switch"}, 0),
        },

        fakelag = {
            enable = SWITCH("[SW] Fake Lag", "Enable Fake Lag", false),
            limit = SLIDERINT("[SW] Fake Lag", "Limit", 14, 0, 14),
            random = SLIDERINT("[SW] Fake Lag", "Randomization", 0, 0, 14),

        },
    },

    dormant = {
        aa = {
            enable = SWITCH("[D] Main", "Enable Anti Aim", false),
            pitch = COMBO("[D] Main", "Pitch", {"Disabled", "Down", "Fake Down", "Fake Up"}, 0),
            yaw_base = COMBO("[D] Main", "Yaw Base", {"Foward", "Backward", "Right", "Left", "At Target", "Freestanding"}, 0),
            yaw_add = SLIDERINT("[D] Main", "Yaw Add", 0, -180, 180),
            yaw_mod = COMBO("[D] Main", "Yaw Modifier", {"Disabled", "Center", "Offset", "Random", "Spin"}, 0),
            modifier_deg = SLIDERINT("[D] Main", "Modifier Degree", 0, -180, 180),
        },

        fake = {
            enable = SWITCH("[D] Fake Angle", "Enable Fake Angle", false),
            invert = SWITCH("[D] Fake Angle", "Inverter", false, "Inverts fake angle."),
            l_limit = SLIDERINT("[D] Fake Angle", "Left Limit", 60, 0, 60),
            r_limit = SLIDERINT("[D] Fake Angle", "Right Limit", 60, 0, 60),
            fake_opt = MCOMBO("[D] Fake Angle", "Fake Options", {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}, 0),
            lby_mode = COMBO("[D] Fake Angle", "LBY Mode", {"Disabled", "Opposite", "Sway"}, 0),
            freestand = COMBO("[D] Fake Angle", "Freestanding Desync", {"Off", "Peek Fake", "Peek Real"}, 0),
            desync_os = COMBO("[D] Fake Angle", "Desync On Shot", {"Disabled", "Opposite", "Freestanding", "Switch"}, 0),
        },

        fakelag = {
            enable = SWITCH("[D] Fake Lag", "Enable Fake Lag", false),
            limit = SLIDERINT("[D] Fake Lag", "Limit", 14, 0, 14),
            random = SLIDERINT("[D] Fake Lag", "Randomization", 0, 0, 14),

        },
    },
    
    menu = {
        aa = {
            enable = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Enable Anti Aim"),
            pitch = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Pitch"),
            yaw_base = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Yaw Base"),
            yaw_add = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Yaw Add"),
            yaw_mod = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Yaw Modifier"),
            modifier_deg = Menu.FindVar("Aimbot", "Anti Aim", "Main", "Modifier Degree"),
        },
        
        fake = {
            enable = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "Enable Fake Angle"),
            invert = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "Inverter"),
            l_limit = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "Left Limit"),
            r_limit = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "Right Limit"),
            fake_opt = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "Fake Options"),
            lby_mode = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "LBY Mode"),
            freestand = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "Freestanding Desync"),
            desync_os = Menu.FindVar("Aimbot", "Anti Aim", "Fake Angle", "Desync On Shot"),
        },
    
        fakelag = {
            enable = Menu.FindVar("Aimbot", "Anti Aim", "Fake Lag", "Enable Fake Lag"),
            limit = Menu.FindVar("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
            random = Menu.FindVar("Aimbot", "Anti Aim", "Fake Lag", "Randomization"),
        },
    
        misc = {
            slow_walk = Menu.FindVar("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
            legmovement = Menu.FindVar("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
            fake_duck = Menu.FindVar("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    
        },
    },
}

local sel_s = SWITCH("LUA", "Enable", false)
local warn = TEXT("LUA", "Warning: \nPressing this will override your anti-aim settings \nYou will need to remake it if you disable this.")
local sel = COMBO("LUA", "Conditions", {"None", "Standing", "Moving", "In air", "Crouching", "Slow-walk", "Dormant"}, 0)
local condit_ind = SWITCH("LUA", "Indicators", false)

local function menu_mgr()
    --standing refs
    ref.standing.aa.enable:SetVisible(false)
    ref.standing.aa.pitch:SetVisible(false)
    ref.standing.aa.yaw_base:SetVisible(false)
    ref.standing.aa.yaw_add:SetVisible(false)
    ref.standing.aa.yaw_mod:SetVisible(false)
    ref.standing.aa.modifier_deg:SetVisible(false)

    ref.standing.fake.enable:SetVisible(false)
    ref.standing.fake.invert:SetVisible(false)
    ref.standing.fake.l_limit:SetVisible(false)
    ref.standing.fake.r_limit:SetVisible(false)
    ref.standing.fake.fake_opt:SetVisible(false)
    ref.standing.fake.lby_mode:SetVisible(false)
    ref.standing.fake.freestand:SetVisible(false)
    ref.standing.fake.desync_os:SetVisible(false)

    ref.standing.fakelag.enable:SetVisible(false)
    ref.standing.fakelag.limit:SetVisible(false)
    ref.standing.fakelag.random:SetVisible(false)
    --moving refs
    ref.moving.aa.enable:SetVisible(false)
    ref.moving.aa.pitch:SetVisible(false)
    ref.moving.aa.yaw_base:SetVisible(false)
    ref.moving.aa.yaw_add:SetVisible(false)
    ref.moving.aa.yaw_mod:SetVisible(false)
    ref.moving.aa.modifier_deg:SetVisible(false)

    ref.moving.fake.enable:SetVisible(false)
    ref.moving.fake.invert:SetVisible(false)
    ref.moving.fake.l_limit:SetVisible(false)
    ref.moving.fake.r_limit:SetVisible(false)
    ref.moving.fake.fake_opt:SetVisible(false)
    ref.moving.fake.lby_mode:SetVisible(false)
    ref.moving.fake.freestand:SetVisible(false)
    ref.moving.fake.desync_os:SetVisible(false)

    ref.moving.fakelag.enable:SetVisible(false)
    ref.moving.fakelag.limit:SetVisible(false)
    ref.moving.fakelag.random:SetVisible(false)
    --inair refs
    ref.inair.aa.enable:SetVisible(false)
    ref.inair.aa.pitch:SetVisible(false)
    ref.inair.aa.yaw_base:SetVisible(false)
    ref.inair.aa.yaw_add:SetVisible(false)
    ref.inair.aa.yaw_mod:SetVisible(false)
    ref.inair.aa.modifier_deg:SetVisible(false)

    ref.inair.fake.enable:SetVisible(false)
    ref.inair.fake.invert:SetVisible(false)
    ref.inair.fake.l_limit:SetVisible(false)
    ref.inair.fake.r_limit:SetVisible(false)
    ref.inair.fake.fake_opt:SetVisible(false)
    ref.inair.fake.lby_mode:SetVisible(false)
    ref.inair.fake.freestand:SetVisible(false)
    ref.inair.fake.desync_os:SetVisible(false)

    ref.inair.fakelag.enable:SetVisible(false)
    ref.inair.fakelag.limit:SetVisible(false)
    ref.inair.fakelag.random:SetVisible(false)
    --crouching refs
    ref.crouching.aa.enable:SetVisible(false)
    ref.crouching.aa.pitch:SetVisible(false)
    ref.crouching.aa.yaw_base:SetVisible(false)
    ref.crouching.aa.yaw_add:SetVisible(false)
    ref.crouching.aa.yaw_mod:SetVisible(false)
    ref.crouching.aa.modifier_deg:SetVisible(false)

    ref.crouching.fake.enable:SetVisible(false)
    ref.crouching.fake.invert:SetVisible(false)
    ref.crouching.fake.l_limit:SetVisible(false)
    ref.crouching.fake.r_limit:SetVisible(false)
    ref.crouching.fake.fake_opt:SetVisible(false)
    ref.crouching.fake.lby_mode:SetVisible(false)
    ref.crouching.fake.freestand:SetVisible(false)
    ref.crouching.fake.desync_os:SetVisible(false)

    ref.crouching.fakelag.enable:SetVisible(false)
    ref.crouching.fakelag.limit:SetVisible(false)
    ref.crouching.fakelag.random:SetVisible(false)
    --slow-walk refs
    ref.slow_walk.aa.enable:SetVisible(false)
    ref.slow_walk.aa.pitch:SetVisible(false)
    ref.slow_walk.aa.yaw_base:SetVisible(false)
    ref.slow_walk.aa.yaw_add:SetVisible(false)
    ref.slow_walk.aa.yaw_mod:SetVisible(false)
    ref.slow_walk.aa.modifier_deg:SetVisible(false)

    ref.slow_walk.fake.enable:SetVisible(false)
    ref.slow_walk.fake.invert:SetVisible(false)
    ref.slow_walk.fake.l_limit:SetVisible(false)
    ref.slow_walk.fake.r_limit:SetVisible(false)
    ref.slow_walk.fake.fake_opt:SetVisible(false)
    ref.slow_walk.fake.lby_mode:SetVisible(false)
    ref.slow_walk.fake.freestand:SetVisible(false)
    ref.slow_walk.fake.desync_os:SetVisible(false)

    ref.slow_walk.fakelag.enable:SetVisible(false)
    ref.slow_walk.fakelag.limit:SetVisible(false)
    ref.slow_walk.fakelag.random:SetVisible(false)
    --dormant refs
    ref.dormant.aa.enable:SetVisible(false)
    ref.dormant.aa.pitch:SetVisible(false)
    ref.dormant.aa.yaw_base:SetVisible(false)
    ref.dormant.aa.yaw_add:SetVisible(false)
    ref.dormant.aa.yaw_mod:SetVisible(false)
    ref.dormant.aa.modifier_deg:SetVisible(false)

    ref.dormant.fake.enable:SetVisible(false)
    ref.dormant.fake.invert:SetVisible(false)
    ref.dormant.fake.l_limit:SetVisible(false)
    ref.dormant.fake.r_limit:SetVisible(false)
    ref.dormant.fake.fake_opt:SetVisible(false)
    ref.dormant.fake.lby_mode:SetVisible(false)
    ref.dormant.fake.freestand:SetVisible(false)
    ref.dormant.fake.desync_os:SetVisible(false)

    ref.dormant.fakelag.enable:SetVisible(false)
    ref.dormant.fakelag.limit:SetVisible(false)
    ref.dormant.fakelag.random:SetVisible(false)

    sel:SetVisible(false)
    condit_ind:SetVisible(false)

    if not sel_s:Get() then
        return
    end

    sel:SetVisible(true)
    condit_ind:SetVisible(true)

    if sel:Get() == 0 then
        return
    end
    if sel:Get() == 1 then
        --standing
        ref.standing.aa.enable:SetVisible(true)
        ref.standing.aa.pitch:SetVisible(true)
        ref.standing.aa.yaw_base:SetVisible(true)
        ref.standing.aa.yaw_add:SetVisible(true)
        ref.standing.aa.yaw_mod:SetVisible(true)
        ref.standing.aa.modifier_deg:SetVisible(false)
        if ref.standing.aa.yaw_mod:Get() ~= 0 then
            ref.standing.aa.modifier_deg:SetVisible(true)
        end
    
        ref.standing.fake.enable:SetVisible(true)
        ref.standing.fake.invert:SetVisible(true)
        ref.standing.fake.l_limit:SetVisible(true)
        ref.standing.fake.r_limit:SetVisible(true)
        ref.standing.fake.fake_opt:SetVisible(true)
        ref.standing.fake.lby_mode:SetVisible(true)
        ref.standing.fake.freestand:SetVisible(true)
        ref.standing.fake.desync_os:SetVisible(true)
    
        ref.standing.fakelag.enable:SetVisible(true)
        ref.standing.fakelag.limit:SetVisible(true)
        ref.standing.fakelag.random:SetVisible(true)
    elseif sel:Get() == 2 then
        --moving
        ref.moving.aa.enable:SetVisible(true)
        ref.moving.aa.pitch:SetVisible(true)
        ref.moving.aa.yaw_base:SetVisible(true)
        ref.moving.aa.yaw_add:SetVisible(true)
        ref.moving.aa.yaw_mod:SetVisible(true)
        ref.moving.aa.modifier_deg:SetVisible(false)
        if ref.moving.aa.yaw_mod:Get() ~= 0 then
            ref.moving.aa.modifier_deg:SetVisible(true)
        end
    
        ref.moving.fake.enable:SetVisible(true)
        ref.moving.fake.invert:SetVisible(true)
        ref.moving.fake.l_limit:SetVisible(true)
        ref.moving.fake.r_limit:SetVisible(true)
        ref.moving.fake.fake_opt:SetVisible(true)
        ref.moving.fake.lby_mode:SetVisible(true)
        ref.moving.fake.freestand:SetVisible(true)
        ref.moving.fake.desync_os:SetVisible(true)
    
        ref.moving.fakelag.enable:SetVisible(true)
        ref.moving.fakelag.limit:SetVisible(true)
        ref.moving.fakelag.random:SetVisible(true)
    elseif sel:Get() == 3 then
        --inair
        ref.inair.aa.enable:SetVisible(true)
        ref.inair.aa.pitch:SetVisible(true)
        ref.inair.aa.yaw_base:SetVisible(true)
        ref.inair.aa.yaw_add:SetVisible(true)
        ref.inair.aa.yaw_mod:SetVisible(true)
        ref.inair.aa.modifier_deg:SetVisible(false)
        if ref.inair.aa.yaw_mod:Get() ~= 0 then
            ref.inair.aa.modifier_deg:SetVisible(true)
        end
    
        ref.inair.fake.enable:SetVisible(true)
        ref.inair.fake.invert:SetVisible(true)
        ref.inair.fake.l_limit:SetVisible(true)
        ref.inair.fake.r_limit:SetVisible(true)
        ref.inair.fake.fake_opt:SetVisible(true)
        ref.inair.fake.lby_mode:SetVisible(true)
        ref.inair.fake.freestand:SetVisible(true)
        ref.inair.fake.desync_os:SetVisible(true)
    
        ref.inair.fakelag.enable:SetVisible(true)
        ref.inair.fakelag.limit:SetVisible(true)
        ref.inair.fakelag.random:SetVisible(true)
    elseif sel:Get() == 4 then
        --crouching
        ref.crouching.aa.enable:SetVisible(true)
        ref.crouching.aa.pitch:SetVisible(true)
        ref.crouching.aa.yaw_base:SetVisible(true)
        ref.crouching.aa.yaw_add:SetVisible(true)
        ref.crouching.aa.yaw_mod:SetVisible(true)
        ref.crouching.aa.modifier_deg:SetVisible(false)
        if ref.crouching.aa.yaw_mod:Get() ~= 0 then
            ref.crouching.aa.modifier_deg:SetVisible(true)
        end
    
        ref.crouching.fake.enable:SetVisible(true)
        ref.crouching.fake.invert:SetVisible(true)
        ref.crouching.fake.l_limit:SetVisible(true)
        ref.crouching.fake.r_limit:SetVisible(true)
        ref.crouching.fake.fake_opt:SetVisible(true)
        ref.crouching.fake.lby_mode:SetVisible(true)
        ref.crouching.fake.freestand:SetVisible(true)
        ref.crouching.fake.desync_os:SetVisible(true)
    
        ref.crouching.fakelag.enable:SetVisible(true)
        ref.crouching.fakelag.limit:SetVisible(true)
        ref.crouching.fakelag.random:SetVisible(true)
    elseif sel:Get() == 5 then
        --slow-walk
        ref.slow_walk.aa.enable:SetVisible(true)
        ref.slow_walk.aa.pitch:SetVisible(true)
        ref.slow_walk.aa.yaw_base:SetVisible(true)
        ref.slow_walk.aa.yaw_add:SetVisible(true)
        ref.slow_walk.aa.yaw_mod:SetVisible(true)
        ref.slow_walk.aa.modifier_deg:SetVisible(false)
        if ref.slow_walk.aa.yaw_mod:Get() ~= 0 then
            ref.slow_walk.aa.modifier_deg:SetVisible(true)
        end
    
        ref.slow_walk.fake.enable:SetVisible(true)
        ref.slow_walk.fake.invert:SetVisible(true)
        ref.slow_walk.fake.l_limit:SetVisible(true)
        ref.slow_walk.fake.r_limit:SetVisible(true)
        ref.slow_walk.fake.fake_opt:SetVisible(true)
        ref.slow_walk.fake.lby_mode:SetVisible(true)
        ref.slow_walk.fake.freestand:SetVisible(true)
        ref.slow_walk.fake.desync_os:SetVisible(true)
    
        ref.slow_walk.fakelag.enable:SetVisible(true)
        ref.slow_walk.fakelag.limit:SetVisible(true)
        ref.slow_walk.fakelag.random:SetVisible(true)
    elseif sel:Get() == 6 then
        --dormant
        ref.dormant.aa.enable:SetVisible(true)
        ref.dormant.aa.pitch:SetVisible(true)
        ref.dormant.aa.yaw_base:SetVisible(true)
        ref.dormant.aa.yaw_add:SetVisible(true)
        ref.dormant.aa.yaw_mod:SetVisible(true)
        ref.dormant.aa.modifier_deg:SetVisible(false)
        if ref.dormant.aa.yaw_mod:Get() ~= 0 then
            ref.dormant.aa.modifier_deg:SetVisible(true)
        end
    
        ref.dormant.fake.enable:SetVisible(true)
        ref.dormant.fake.invert:SetVisible(true)
        ref.dormant.fake.l_limit:SetVisible(true)
        ref.dormant.fake.r_limit:SetVisible(true)
        ref.dormant.fake.fake_opt:SetVisible(true)
        ref.dormant.fake.lby_mode:SetVisible(true)
        ref.dormant.fake.freestand:SetVisible(true)
        ref.dormant.fake.desync_os:SetVisible(true)
    
        ref.dormant.fakelag.enable:SetVisible(true)
        ref.dormant.fakelag.limit:SetVisible(true)
        ref.dormant.fakelag.random:SetVisible(true)
    end
end

local isdormant = false

Cheat.RegisterCallback("createmove", function()

    local plr = EntityList.GetPlayers()

    for _, v in pairs(plr) do
        if v == EntityList.GetLocalPlayer() then 
            goto skip 
        end

        local ns = v:GetNetworkState()

		if ns ~= -1 and ns ~= 4 then
            isdormant = false
        else
            isdormant = true
        end
        ::skip::
    end
end)

local condition = ""
local function aa()

    if not sel_s:Get() then
        return
    end

    local lp = EntityList.GetClientEntity(EngineClient.GetLocalPlayer())
    
    if isdormant then
        --dormant
        condition = "dormant" 

        ref.menu.aa.enable:Set(ref.dormant.aa.enable:Get())
        ref.menu.aa.pitch:Set(ref.dormant.aa.pitch:Get())
        ref.menu.aa.yaw_base:Set(ref.dormant.aa.yaw_base:Get())
        ref.menu.aa.yaw_add:Set(ref.dormant.aa.yaw_add:Get())
        ref.menu.aa.yaw_mod:Set(ref.dormant.aa.yaw_mod:Get())
        ref.menu.aa.modifier_deg:Set(ref.dormant.aa.modifier_deg:Get())
    
        ref.menu.fake.enable:Set(ref.dormant.fake.enable:Get())
        ref.menu.fake.invert:Set(ref.dormant.fake.invert:Get())
        ref.menu.fake.l_limit:Set(ref.dormant.fake.l_limit:Get())
        ref.menu.fake.r_limit:Set(ref.dormant.fake.r_limit:Get())
        ref.menu.fake.fake_opt:Set(ref.dormant.fake.fake_opt:Get())
        ref.menu.fake.lby_mode:Set(ref.dormant.fake.lby_mode:Get())
        ref.menu.fake.freestand:Set(ref.dormant.fake.freestand:Get())
        ref.menu.fake.desync_os:Set(ref.dormant.fake.desync_os:Get())
    
        ref.menu.fakelag.enable:Set(ref.dormant.fakelag.enable:Get())
        ref.menu.fakelag.limit:Set(ref.dormant.fakelag.limit:Get())
        ref.menu.fakelag.random:Set(ref.dormant.fakelag.random:Get())
    elseif ref.menu.misc.slow_walk:Get() then
        --slowwalk
        condition = "slow-walk"

        ref.menu.aa.enable:Set(ref.slow_walk.aa.enable:Get())
        ref.menu.aa.pitch:Set(ref.slow_walk.aa.pitch:Get())
        ref.menu.aa.yaw_base:Set(ref.slow_walk.aa.yaw_base:Get())
        ref.menu.aa.yaw_add:Set(ref.slow_walk.aa.yaw_add:Get())
        ref.menu.aa.yaw_mod:Set(ref.slow_walk.aa.yaw_mod:Get())
        ref.menu.aa.modifier_deg:Set(ref.slow_walk.aa.modifier_deg:Get())
    
        ref.menu.fake.enable:Set(ref.slow_walk.fake.enable:Get())
        ref.menu.fake.invert:Set(ref.slow_walk.fake.invert:Get())
        ref.menu.fake.l_limit:Set(ref.slow_walk.fake.l_limit:Get())
        ref.menu.fake.r_limit:Set(ref.slow_walk.fake.r_limit:Get())
        ref.menu.fake.fake_opt:Set(ref.slow_walk.fake.fake_opt:Get())
        ref.menu.fake.lby_mode:Set(ref.slow_walk.fake.lby_mode:Get())
        ref.menu.fake.freestand:Set(ref.slow_walk.fake.freestand:Get())
        ref.menu.fake.desync_os:Set(ref.slow_walk.fake.desync_os:Get())
    
        ref.menu.fakelag.enable:Set(ref.slow_walk.fakelag.enable:Get())
        ref.menu.fakelag.limit:Set(ref.slow_walk.fakelag.limit:Get())
        ref.menu.fakelag.random:Set(ref.slow_walk.fakelag.random:Get())
    elseif 2 > getvel(lp) and onground(lp) and not induck(lp) then
        --standing
        condition = "standing"

        ref.menu.aa.enable:Set(ref.standing.aa.enable:Get())
        ref.menu.aa.pitch:Set(ref.standing.aa.pitch:Get())
        ref.menu.aa.yaw_base:Set(ref.standing.aa.yaw_base:Get())
        ref.menu.aa.yaw_add:Set(ref.standing.aa.yaw_add:Get())
        ref.menu.aa.yaw_mod:Set(ref.standing.aa.yaw_mod:Get())
        ref.menu.aa.modifier_deg:Set(ref.standing.aa.modifier_deg:Get())
    
        ref.menu.fake.enable:Set(ref.standing.fake.enable:Get())
        ref.menu.fake.invert:Set(ref.standing.fake.invert:Get())
        ref.menu.fake.l_limit:Set(ref.standing.fake.l_limit:Get())
        ref.menu.fake.r_limit:Set(ref.standing.fake.r_limit:Get())
        ref.menu.fake.fake_opt:Set(ref.standing.fake.fake_opt:Get())
        ref.menu.fake.lby_mode:Set(ref.standing.fake.lby_mode:Get())
        ref.menu.fake.freestand:Set(ref.standing.fake.freestand:Get())
        ref.menu.fake.desync_os:Set(ref.standing.fake.desync_os:Get())
    
        ref.menu.fakelag.enable:Set(ref.standing.fakelag.enable:Get())
        ref.menu.fakelag.limit:Set(ref.standing.fakelag.limit:Get())
        ref.menu.fakelag.random:Set(ref.standing.fakelag.random:Get())
    elseif onground(lp) and not induck(lp) and getvel(lp) > 2 then
        --moving
        condition = "moving"

        ref.menu.aa.enable:Set(ref.moving.aa.enable:Get())
        ref.menu.aa.pitch:Set(ref.moving.aa.pitch:Get())
        ref.menu.aa.yaw_base:Set(ref.moving.aa.yaw_base:Get())
        ref.menu.aa.yaw_add:Set(ref.moving.aa.yaw_add:Get())
        ref.menu.aa.yaw_mod:Set(ref.moving.aa.yaw_mod:Get())
        ref.menu.aa.modifier_deg:Set(ref.moving.aa.modifier_deg:Get())
    
        ref.menu.fake.enable:Set(ref.moving.fake.enable:Get())
        ref.menu.fake.invert:Set(ref.moving.fake.invert:Get())
        ref.menu.fake.l_limit:Set(ref.moving.fake.l_limit:Get())
        ref.menu.fake.r_limit:Set(ref.moving.fake.r_limit:Get())
        ref.menu.fake.fake_opt:Set(ref.moving.fake.fake_opt:Get())
        ref.menu.fake.lby_mode:Set(ref.moving.fake.lby_mode:Get())
        ref.menu.fake.freestand:Set(ref.moving.fake.freestand:Get())
        ref.menu.fake.desync_os:Set(ref.moving.fake.desync_os:Get())
    
        ref.menu.fakelag.enable:Set(ref.moving.fakelag.enable:Get())
        ref.menu.fakelag.limit:Set(ref.moving.fakelag.limit:Get())
        ref.menu.fakelag.random:Set(ref.moving.fakelag.random:Get())
    elseif not onground(lp) then
        --inair
        condition = "in-air"

        ref.menu.aa.enable:Set(ref.inair.aa.enable:Get())
        ref.menu.aa.pitch:Set(ref.inair.aa.pitch:Get())
        ref.menu.aa.yaw_base:Set(ref.inair.aa.yaw_base:Get())
        ref.menu.aa.yaw_add:Set(ref.inair.aa.yaw_add:Get())
        ref.menu.aa.yaw_mod:Set(ref.inair.aa.yaw_mod:Get())
        ref.menu.aa.modifier_deg:Set(ref.inair.aa.modifier_deg:Get())
    
        ref.menu.fake.enable:Set(ref.inair.fake.enable:Get())
        ref.menu.fake.invert:Set(ref.inair.fake.invert:Get())
        ref.menu.fake.l_limit:Set(ref.inair.fake.l_limit:Get())
        ref.menu.fake.r_limit:Set(ref.inair.fake.r_limit:Get())
        ref.menu.fake.fake_opt:Set(ref.inair.fake.fake_opt:Get())
        ref.menu.fake.lby_mode:Set(ref.inair.fake.lby_mode:Get())
        ref.menu.fake.freestand:Set(ref.inair.fake.freestand:Get())
        ref.menu.fake.desync_os:Set(ref.inair.fake.desync_os:Get())
    
        ref.menu.fakelag.enable:Set(ref.inair.fakelag.enable:Get())
        ref.menu.fakelag.limit:Set(ref.inair.fakelag.limit:Get())
        ref.menu.fakelag.random:Set(ref.inair.fakelag.random:Get())
    elseif onground(lp) and induck(lp) then
        --crouching
        condition = "crouching"

        ref.menu.aa.enable:Set(ref.crouching.aa.enable:Get())
        ref.menu.aa.pitch:Set(ref.crouching.aa.pitch:Get())
        ref.menu.aa.yaw_base:Set(ref.crouching.aa.yaw_base:Get())
        ref.menu.aa.yaw_add:Set(ref.crouching.aa.yaw_add:Get())
        ref.menu.aa.yaw_mod:Set(ref.crouching.aa.yaw_mod:Get())
        ref.menu.aa.modifier_deg:Set(ref.crouching.aa.modifier_deg:Get())
    
        ref.menu.fake.enable:Set(ref.crouching.fake.enable:Get())
        ref.menu.fake.invert:Set(ref.crouching.fake.invert:Get())
        ref.menu.fake.l_limit:Set(ref.crouching.fake.l_limit:Get())
        ref.menu.fake.r_limit:Set(ref.crouching.fake.r_limit:Get())
        ref.menu.fake.fake_opt:Set(ref.crouching.fake.fake_opt:Get())
        ref.menu.fake.lby_mode:Set(ref.crouching.fake.lby_mode:Get())
        ref.menu.fake.freestand:Set(ref.crouching.fake.freestand:Get())
        ref.menu.fake.desync_os:Set(ref.crouching.fake.desync_os:Get())
    
        ref.menu.fakelag.enable:Set(ref.crouching.fakelag.enable:Get())
        ref.menu.fakelag.limit:Set(ref.crouching.fakelag.limit:Get())
        ref.menu.fakelag.random:Set(ref.crouching.fakelag.random:Get())
    end
end

local SX, SY = EngineClient.GetScreenSize().x, EngineClient.GetScreenSize().y

local function paint()

    if not sel_s:Get() then
        return
    end

    if not condit_ind:Get() then
        return
    end
    local lp = EntityList.GetClientEntity(EngineClient.GetLocalPlayer())

    if lp:GetProp("m_iHealth") == 0 then
        return
    end

    alpha = 255
    
    if condition == "in-air" then
        alpha = math.min(math.floor(math.sin((GlobalVars.realtime % 3) * 4) * 175 + 50), 255)
    elseif condition == "dormant" then
        alpha = 180
    end
    
    Render.Text(condition, Vector2.new(SX / 2 + 1, SY / 1.9 + 1), Color.RGBA(0, 0, 0, alpha), 12, FONT_TAHOMA, false, true)
    Render.Text(condition, Vector2.new(SX / 2, SY / 1.9), Color.RGBA(255, 255, 255, alpha), 12, FONT_TAHOMA, false, true)
end

local function draw()
    menu_mgr()
    if not EngineClient.IsConnected() then
        return
    end
    aa()
    paint()
end
Cheat.RegisterCallback('draw', draw)
