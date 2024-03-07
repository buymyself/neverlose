--[[
  github: mcdonaldsfan

  local variabled commonly used functions.
]]

--entity
local entity_get_local_player, entity_get_client_ent, entity_get_players, entity_get_player_for_user_id, entity_get_client_ent_from_handle, entity_get_player_resource, entity_get_ent_by_class_id, entity_get_ent_by_name, entity_get_player_from_handle, entity_get_weapon_from_handle  = EntityList.GetLocalPlayer, EntityList.GetClientEntity, EntityList.GetPlayers, EntityList.GetPlayerForUserID, EntityList.GetClientEntityFromHandle, EntityList.GetPlayerResource, EntityList.GetEntitiesByClassID, EntityList.GetEntitiesByName, EntityList.GetPlayerFromHandle, EntityList.GetWeaponFromHandle
--engineclient
local client_execute_cmd, client_get_local_player, client_get_screen_size, client_isconnected, client_isingame = EngineClient.ExecuteClientCmd, EngineClient.GetLocalPlayer, EngineClient.GetScreenSize, EngineClient.IsConnected, EngineClient.IsInGame
--globalvars
local globals_realtime, globals_framecount, globals_absoluteframetime, globals_curtime, globals_framtime, globals_maxclients, globals_tickcount, globals_interval_per_tick, globals_interpolation_amount, globals_simtickthisframe, globals_network_protocol, globals_savedata, globals_bclient, globals_bremoteclient, globals_lastoutgoingcommand, globals_chokedcommands, globals_lastcommandack, globals_commandack = GlobalVars.realtime, GlobalVars.framecount, GlobalVars.absoluteframetime, GlobalVars.curtime, GlobalVars.frametime, GlobalVars.maxClients, GlobalVars.tickcount, GlobalVars.interval_per_tick, GlobalVars.interpolation_amount, GlobalVars.simTickThisFrame, GlobalVars.network_protocol, GlobalVars.pSaveData, GlobalVars.m_bCilent, GlobalVars.m_bRemoteClient, ClientState.m_last_outgoing_command, ClientState.m_choked_commands, ClientState.m_last_command_ack, ClientState.m_command_ack
--render
local render_line, render_polyline, render_polyfilled, render_box, render_boxfilled, render_gradient, render_circle, render_circlefilled, render_circle3d, render_circle3dfilled, render_text, render_weaponicon, render_calctextsize, render_calcweaponiconsize, render_initfont, render_worldtoscreen, render_loadimage, render_loadimagefromfile, render_image, render_blur, render_getmenupos, render_getmenusize = Render.Line, Render.Polyline, Render.PolyFilled, Render.Box, Render.BoxFilled, Render.GradientBoxFilled, Render.Circle, Render.CircleFilled, Render.Circle3D, Render.Circle3DFilled, Render.Text, Render.WeaponIcon, Render.CalcTextSize, Render.CalcWeaponIconSize, Render.InitFont, Render.WorldToScreen, Render.LoadImage, Render.LoadImageFromFile, Render.Image, Render.Blur, Render.GetMenuPos, Render.GetMenuSize
--class types
local vector, vector2, length, length2d, dist, dot, cross = Vector.new, Vector2.new, Length, Lenght2D, DistTo, Dot, Cross
--utils
local client_create_interface, client_find_pattern, client_unixtime = Utils.CreateInterface, Utils.ScanPattern, Utils.UnixTime
--cheat
local cheat_registercallback, cheat_firebullet, cheat_angletoforward, cheat_vectortoangle, cheat_ismenuvisible, cheat_getmousepos, cheat_iskeydown, cheat_getcheatusername, cheat_getbinds, cheat_addevent, cheat_addnotify = Cheat.RegisterCallback, Cheat.FireBullet, Cheat.AngleToForward, Cheat.VectorToAngle, Cheat.IsMenuVisible, Cheat.GetMousePos, Cheat.IsKeyDown, Cheat.GetCheatUserName, Cheat.GetBinds, Cheat.AddEvent, Cheat.AddNotify
--menu
local ui_findvar, ui_switch, ui_switchcolor, ui_sliderint, ui_sliderintcolor, ui_sliderfloat, ui_sliderfloatcolor, ui_combo, ui_combocolor, ui_multicombo, ui_textbox, ui_text, ui_button, ui_coloredit, ui_hotkey, ui_destroy = Menu.FindVar, Menu.Switch, Menu.SwitchColor, Menu.SliderInt, Menu.SliderIntColor, Menu.SliderFloat, Menu.SliderFloatColor, Menu.Combo, Menu.ComboColor, Menu.MultiCombo, Menu.TextBox, Menu.Text, Menu.Button, Menu.ColorEdit, Menu.HotKey, Menu.DestroyItem
--functions
local get, set, getint, getstring, getfloat, getcolor, setint, setstring, setfloat, setcolor, getprop, setprop = Get, Set, GetInt, GetString, GetFloat, GetColor, SetInt, SetString, SetFloat, SetColor, GetProp, SetProp
