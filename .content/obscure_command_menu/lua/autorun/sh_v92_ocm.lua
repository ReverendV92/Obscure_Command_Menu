
AddCSLuaFile( )

if not CLIENT then return false end

-------------------------
-------------------------
-- Options Panels
-------------------------
-------------------------

hook.Add( "PopulateToolMenu", "vntObscureCommandMenu", function()

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Readme" , " INFO" , "" , "" , function( Panel )

		Panel:Help( "OBSCURE COMMAND MENU (OCM)" )
		Panel:ControlHelp( "Workshop:\nhttps://steamcommunity.com/sharedfiles/filedetails/?id=793509786\n \nAuthor: V92\nhttps://steamcommunity.com/profiles/76561197998218505\n\nI Welcome Feedback Here:\nhttps://steamcommunity.com/workshop/filedetails/discussion/793509786/3379411186022615265/" )

		Panel:Help( "QUESTIONS AND ANSWERS" )

		Panel:Help( "Q: What is OCM?" )
		Panel:ControlHelp( "A: OCM is a collection of menus to help users learn about and manipulate vanilla console commands found in the Source Engine/GMod." )

		Panel:Help( "Q: Who is OCM for?" )
		Panel:ControlHelp( "A: OCM is for people who don't know about certain niche features of Source, or can't be bothered to remember all of them.\n\nIf nothing else, it's a visual aid for the novice who doesn't know, and the master who doesn't remember." )

		Panel:Help( "Q: How do I suggest changes?" )
		Panel:ControlHelp( "A: Ideally use the feedback thread I linked at the top.\n\nIt filters out feedback from the junk comments, and also helps me remember." )

		Panel:Help( "Q: What is a \"console command\", and how do they work?" )
		Panel:ControlHelp( "A: Console commands (AKA console variables, or CVars) are those strings of text that you put into the in-game console to change everything from graphics settings to volume.\n\nEverything in the options menu is tied to a console command." )

		Panel:Help( "Q: Why do they reset each time I launch the game?" )
		Panel:ControlHelp( "As these are vanilla console commands, many of them will lack the archive flag, and will not be saved on use.\n\nAs they are added via compiled C++, I cannot fix this. Sorry." )

		Panel:Help( "Q: What is an \"archive flag\"?" )
		Panel:ControlHelp( "Console commands in Source can be given flags to define how they behave.\n\nThe archive flag tells the engine to write the change to the user's client.vdf database." )

		Panel:Help( "Q: What is a \"vanilla console command\", and how does it differ from a Lua-created console command?" )
		Panel:ControlHelp( "A: Vanilla console commands are created via compiled C++, and cannot be changed by the end user.\n\nLua console commands are - as the name implies - created via Lua." )

		Panel:Help( "Q: Why not just use Lua to make an indentically named command replacement?" )
		Panel:ControlHelp( "A: Lua console commands are blacklisted from replacing existing commands in order to prevent explots and abuse." )

		Panel:Help( "Q: Why do some commands not have an adjustment and/or say they're blocked in Lua?" )
		Panel:ControlHelp( "A: Lua has a list of console commands that are blacklisted to prevent malicious use.\nIt has the unfortunate side-effect that honest use like this is also blocked.\n\nIf you see a line saying that the command is blocked in Lua, run it manually via the console." )

		Panel:Help( "Q: How can I make the commands presist through launches?" )
		Panel:ControlHelp( "A: The simplest answer is you'll need to add them to your own personal autoexec.cfg file.\n\nIt can be found in:\nsteamapps/common/garrysmod/garrysmod/cfg/autorun.cfg" )

		Panel:Help( "Q: What's an autoexe.cfg file?" )
		Panel:ControlHelp( "A: autoexec.cfg means \"automatically executed\", and CFG is a \"config\" file type.\n\nIt's a list of commands that run on each and every game launch, effectively allowing automated configuration for a tech savvy user." )

		Panel:Help( "Q: What's the best way I can improve performance in GMod for my toaster?" )
		Panel:ControlHelp( "A: To start with, enable multi-core and run on the x86-64 branch.\nIt makes a day & night-level difference and you'll thank me later.\n\nAfter that, use the potato presets I made for that exact scenario.\n\nCopy their settings over to your autoexec.cfg file, and tweak to personal preference." )

		Panel:Help( "Q: I enabled multi-core via the options panel and it didn't make a difference. Why?" )
		Panel:ControlHelp( "Garry disabled multi-core during the GMod 13 beta in 2011 and the options menu function was never fixed - it doesn't actually do anything.\n\nTo enable multi-core in GMod, you need to add these three commands to your autoexec.cfg file:\ngmod_mcore_test 1\nmat_queue_mode -1\ncl_threaded_bone_setup 1" )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Debug" , "Debug" , "" , "" , function( Panel )

		Panel:Help( "Options for debug settings." )

		Panel:Button( "Show Performance UI" , "perfui" , { } )
		Panel:ControlHelp( "perfui\nFlags: cheat\nShow/hide the level performance tools UI." )

		Panel:Button( "Show Color Correction UI" , "colorcorrectionui" , { } )
		Panel:ControlHelp( "colorcorrectionui\nFlags: cheat\nShow the color correction UI menu." )

		Panel:AddControl( "Slider", {
			["label"] = "Show FPS",
			["Command"] = "cl_showfps",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2"
		}	)
		Panel:ControlHelp( "cl_showfps\nFlags: client\n0=Off\n1=Show FPS\n2=Show FPS with lowest/highest" )

		Panel:AddControl( "Slider", {
			["label"] = "Console Notify time",
			["Command"] = "con_notifytime",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "10"
		}	)
		Panel:ControlHelp( "con_notifytime\nHow many seconds to show the console feed on-screen. Set to 0 to disable the screen popups." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Debug_Map" , "Debug: Map" , "" , "" , function( Panel )

		Panel:CheckBox( "Node Graph Rebuilding" , "ai_norebuildgraph" , { } )
		Panel:ControlHelp( "ai_norebuildgraph\nFlags: game\nDisables the NODEGRAPH OUT OF DATE, REBUILDING function. HDtF wishes they knew about this one." )

		Panel:CheckBox( "Show Ladder Debug" , "sv_showladders" , { } )
		Panel:ControlHelp( "sv_showladders\nFlags: game\nShow bbox and dismount points for all ladders (must be set before level load.)" )

		Panel:CheckBox( "Draw World" , "r_drawworld" , { } )
		Panel:ControlHelp( "r_drawworld\nFlags: cheat\nToggle rendering of the entire world." )

		Panel:CheckBox( "Draw Opaque World Textures" , "r_drawopaqueworld" , { } )
		Panel:ControlHelp( "r_drawopaqueworld\nFlags: client, cheat\nToggle rendering of only opaque world textures." )

		Panel:AddControl( "Slider", {
			["label"] = "Physics Penetration Error Time",
			["Command"] = "phys_penetration_error_time",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "10"
		}	)
		Panel:ControlHelp( "phys_penetration_error_time\nFlags: game\nHow long to show the VPHYSICS PENETRATION ERROR text on objects that are stuck in the world." )

		Panel:AddControl( "Slider", {
			["label"] = "Clip Brush Render Mode",
			["Command"] = "r_drawclipbrushes",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2"
		}	)
		Panel:ControlHelp( "r_drawclipbrushes\nFlags: cheat\nChange how clip brushes are rendered. 0=Not rendered. 1=Normal. 2=Wireframe mode." )

		Panel:AddControl( "Slider", {
			["label"] = "Brush Model Render Mode",
			["Command"] = "r_drawbrushmodels",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2"
		}	)
		Panel:ControlHelp( "r_drawbrushmodels\nFlags: cheat\nChange how brush models (entity-tied brushes) are rendered. 0=Not rendered. 1=Normal. 2=Wireframe mode." )

		Panel:AddControl( "Slider", {
			["label"] = "Draw Visleaf Grids",
			["Command"] = "mat_leafvis",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2"
		}	)
		Panel:ControlHelp( "mat_leafvis\nFlags: cheat\nDraw the visleaf areas in the current map." )

		Panel:AddControl( "Slider", {
			["label"] = "Model Render Mode",
			["Command"] = "r_drawothermodels",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2"
		}	)
		Panel:ControlHelp( "r_drawothermodels\nFlags: client, cheat\nChange how models are rendered. 0=Not rendered. 1=Normal. 2=Wireframe mode." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Debug_Model" , "Debug: Model" , "" , "" , function( Panel )

		Panel:Button( "Flush Model Cache" , "r_flushlod" , { } )
		Panel:ControlHelp( "r_flushlod\nFlush the model cache and rebuild it. WARNING: MAY CAUSE CRASH. SAVE BEFORE USING." )

		Panel:CheckBox( "Jiggle Bone Sanity" , "cl_jiggle_bone_sanity" , { } )
		Panel:ControlHelp( "cl_jiggle_bone_sanity\nFlags: client\nPrevent jiggle bones from pointing directly away from their target in case of numerical instability." )

		Panel:CheckBox( "Show Collision Models" , "vcollide_wireframe" , { } )
		Panel:ControlHelp( "vcollide_wireframe\nFlags: client, cheat\nToggle visibility of model collision meshes." )

		Panel:CheckBox( "Flex Smoothing" , "flex_smooth" , { } )
		Panel:ControlHelp( "flex_smooth\nFlags: client\nApplies smoothing/decay curve to flex animation controller changes." )

		Panel:CheckBox( "Show Activity" , "anim_showmainactivity" , { } )
		Panel:ControlHelp( "anim_showmainactivity\nFlags: client, cheat\nShow the idle, walk, run, and/or sprint activities.\nUnknown effects." )

		Panel:CheckBox( "Use 3-Way Blend" , "anim_3wayblend" , { } )
		Panel:ControlHelp( "anim_3wayblend\nFlags: game, replicated\nToggle the 3-way animation blending code." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Debug_AI" , "Debug: AI" , "" , "" , function( Panel )

		Panel:CheckBox( "Disable AI" , "ai_disabled" , { } )
		Panel:ControlHelp( "ai_disabled\nFlags: game, cheat\nDisable all AI functions. Warning: may cause map jank if triggers rely on it. Use admin cleanup to fix if it occurs." )

		Panel:Button( "Ignore Player" , "notarget" , { } )
		Panel:ControlHelp( "notarget\nFlags: game, cheat\nNPCs will perform normally but can't see the player." )

		Panel:Button( "Show Nodes" , "ai_nodes" , { } )
		Panel:ControlHelp( "ai_nodes\nFlags: game, cheat\nToggles node display. First call displays the nodes for the given network as green objects. Second call displays the nodes and their IDs." )

		Panel:CheckBox( "Show Citizen Enemy" , "g_ai_citizen_show_enemy" , { } )
		Panel:ControlHelp( "g_ai_citizen_show_enemy\nFlags: game\nDraw a red line from npc_citizen to their target." )

		Panel:Button( "Draw Movement Hulls" , "ai_show_hull" , { } )
		Panel:ControlHelp( "ai_show_hull\nFlags: game, cheat\nDisplays the allowed hulls between each node for the currently selected hull type. Hulls are color code as follows:\nGreen: ground movement\nBlue: jumping movement\nCyan: flying movement\nMagenta: climbing movement" )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_HL2_NPC" , "NPC" , "" , "" , function( Panel )

		Panel:Help( "Options for some of the more niche HL2 NPC settings." )

		Panel:Button( "Heal NPC" , "npc_heal" , { } )
		Panel:ControlHelp( "npc_heal\nHeals the target back to full health." )

		Panel:CheckBox( "Citizens Resist Explosions" , "npc_citizen_explosive_resist" )
		Panel:ControlHelp( "npc_citizen_explosive_resist\nToggle citizen instant death to explosions." )

		Panel:AddControl( "Slider", {
			["label"] = "Grigori Headshots",
			["Command"] = "monk_headshot_freq",	
			["Type"] = "int",
			["min"] = "0",
			["max"] = "25"
		}	)
		Panel:ControlHelp( "monk_headshot_freq\nHow many shots Father Grigori should take before it guarantees a headshot (0=All shots will be headshots)." )

		Panel:AddControl( "Slider", {
			["label"] = "Essential Ally Health Regen Time",
			["Command"] = "sk_ally_regen_time",	
			["Type"] = "float",
			["min"] = "0.2",
			["max"] = "1"
		}	)
		Panel:ControlHelp( "sk_ally_regen_time\nHow quickly essential allies regen health (Barney, Alyx, etc.)." )

		Panel:AddControl( "Slider", {
			["label"] = "Ammo Give Delay",
			["Command"] = "sk_citizen_giveammo_player_delay",	
			["Type"] = "int",
			["min"] = "1",
			["max"] = "120"
		}	)
		Panel:ControlHelp( "sk_citizen_giveammo_player_delay\nHow long in seconds the NPCs must wait before they give you more ammo." )

		Panel:AddControl( "Slider", {
			["label"] = "Medic Heal Delay",
			["Command"] = "sk_citizen_heal_ally_delay",	
			["Type"] = "int",
			["min"] = "1",
			["max"] = "120"
		}	)
		Panel:ControlHelp( "sk_citizen_heal_ally_delay\nHow long in seconds the NPC Medics must wait before they heal you." )

		Panel:AddControl( "Slider", {
			["label"] = "Medic Heal Amount",
			["Command"] = "sk_citizen_heal_ally",	
			["Type"] = "int",
			["min"] = "1",
			["max"] = "100"
		}	)
		Panel:ControlHelp( "sk_citizen_heal_ally\nHow much medics will heal you, per medshot." )

		Panel:AddControl( "Slider", {
			["label"] = "Minimum Heal Percent",
			["Command"] = "sk_citizen_heal_ally_min_pct",	
			["Type"] = "float",
			["min"] = "0.1",
			["max"] = "1"
		}	)
		Panel:ControlHelp( "sk_citizen_heal_ally_min_pct\nHow low your health must be before they will heal you in a decimal. i.e. 0.9 would be 90/100 health." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_HL2_NPC_Hunter" , "NPC: Hunter" , "" , "" , function( Panel )

		Panel:Help( "Episode 2 Hunter Settings" )

		Panel:CheckBox( "Charge Test" , "hunter_charge_test" )
		Panel:ControlHelp( "hunter_charge_test\nToggle charge test mode. Hunter will continuously charge attack." )

		Panel:CheckBox( "Flechette Test" , "hunter_flechette_test" )
		Panel:ControlHelp( "hunter_flechette_test\nToggle flechette test mode. Hunter will become stationary and will only shoot flechettes." )

		Panel:CheckBox( "Disable Patrol" , "hunter_disable_patrol" )
		Panel:ControlHelp( "hunter_disable_patrol\nToggle Hunter patrol behavior\nIt's that random walking around they do when you spawn them." )

		Panel:CheckBox( "Stand Still" , "hunter_stand_still" )
		Panel:ControlHelp( "hunter_stand_still\nForce Hunters to not walk." )

		Panel:CheckBox( "Dodge Debug" , "hunter_dodge_debug" )
		Panel:ControlHelp( "hunter_dodge_debug\nToggle vehicle/Hunter dodge debug mode. A grey arrow shows direction of dodge check, red arrow means Hunter is trying to dodge." )

		Panel:AddControl( "Slider", {
			["label"] = "Dodge Warning Time",
			["Command"] = "hunter_dodge_warning",	
			["Type"] = "float",
			["min"] = "0",
			["max"] = "5"
		}	)
		Panel:ControlHelp( "hunter_dodge_warning\nGrace period time Hunters will have to avoid dodging when they detect it." )

		Panel:CheckBox( "Striderbuster Flee" , "hunter_retreat_striderbusters" )
		Panel:ControlHelp( "hunter_retreat_striderbusters\nIf true, the hunter will retreat when a buster is glued to him." )

		Panel:AddControl( "Slider", {
			["label"] = "Flechette Fire Delay",
			["Command"] = "hunter_flechette_delay",	
			["Type"] = "float",
			["min"] = "0",
			["max"] = "2"
		}	)
		Panel:ControlHelp( "hunter_flechette_delay\nTime between flechette shots." )

		Panel:AddControl( "Slider", {
			["label"] = "Flechette Speed",
			["Command"] = "hunter_flechette_speed",	
			["Type"] = "int",
			["min"] = "20",
			["max"] = "5000"
		}	)
		Panel:ControlHelp( "hunter_flechette_speed\nSpeed flechettes travel. Too low and they just fall to the ground." )

		Panel:AddControl( "Slider", {
			["label"] = "Max Global Volley",
			["Command"] = "hunter_flechette_max_concurrent_volleys",	
			["Type"] = "int",
			["min"] = "0",
			["max"] = "32"
		}	)
		Panel:ControlHelp( "hunter_flechette_max_concurrent_volleys\nMaximum global amount of Hunters that can be firing a flechette volley at any given time." )

		Panel:AddControl( "Slider", {
			["label"] = "Volley Size",
			["Command"] = "hunter_flechette_volley_size",	
			["Type"] = "int",
			["min"] = "0",
			["max"] = "64"
		}	)
		Panel:ControlHelp( "hunter_flechette_volley_size\nMax volley size of flechettes to fire." )

		-- Not functional? Needs testing.
		-- Panel:AddControl( "Slider", {
			-- ["label"] = "Flechette Explode Delay",
			-- ["Command"] = "hunter_flechette_explode_delay",	
			-- ["Type"] = "int",
			-- ["min"] = "0",
			-- ["max"] = "16"
		-- }	)
		-- Panel:ControlHelp( "hunter_flechette_explode_delay\nTime before flechette explosion." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_HL2_NPC_Squad" , "NPC: Squad" , "" , "" , function( Panel )

		Panel:Help( "Options for HL2 NPC squad settings." )

		Panel:Button( "Squad Command" , "impulse" , "50" )
		Panel:ControlHelp( "impulse 50\nRun the squad command hotkey. Press to send a squad to crosshair. Press again to recall." )

		Panel:CheckBox( "NPCs Automatically Join Squad" , "npc_citizen_auto_player_squad" )
		Panel:ControlHelp( "npc_citizen_auto_player_squad\nCitizens will immediately join the player's squad, and can't be removed until they die." )

		Panel:CheckBox( "Manual NPC Squad Picking" , "npc_citizen_auto_player_squad_allow_use" )
		Panel:ControlHelp( "npc_citizen_auto_player_squad_allow_use\nAllows the player to manually add/remove Citizens from their squad by pressing +use on them." )
		
		Panel:CheckBox( "Show Squad Insignia" , "npc_citizen_insignia" )
		Panel:ControlHelp( "npc_citizen_insignia\nPlaces a visible model on the Citizens in your squad. Default is a chef hat." )

		Panel:CheckBox( "Squad Autosummon" , "player_squad_transient_commands" )
		Panel:ControlHelp( "player_squad_transient_commands\nToggle between distance autosummon and stand your ground mode.\nThe squad command panel will also show SQUAD STATIONED instead." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_VGUI" , "VGUI" , "" , "" , function( Panel )
	
		Panel:Help( "Options for VGUI settings." )
	
		Panel:CheckBox( "Draw VGUI" , "r_drawvgui" , { } )
		Panel:ControlHelp( "r_drawvgui\nToggle rendering of VGUI elements.\nNOTE: THIS WILL HIDE THE SPAWN MENU. MEMORIZE THIS COMMAND BEFORE USING." )

		Panel:CheckBox( "Toggle Overview Mode" , "cl_leveloverview" , { } )
		Panel:ControlHelp( "cl_leveloverview\nToggle overhead camera mode." )

		Panel:CheckBox( "Toggle Overview Marker" , "cl_leveloverviewmarker" , { } )
		Panel:ControlHelp( "cl_leveloverviewmarker\nToggle overhead camera marker. Unsure of function." )

		Panel:CheckBox( "Toggle YUV Mode" , "mat_yuv" , { } )
		Panel:ControlHelp( "mat_yuv\nToggle YUV color mode." )

		Panel:CheckBox( "Toggle Color Correction" , "mat_colorcorrection" , { } )
		Panel:ControlHelp( "mat_colorcorrection\nToggle color correction." )

		Panel:CheckBox( "World Tool Tips" , "cl_drawworldtooltips" , { } )
		Panel:ControlHelp( "cl_drawworldtooltips\nToggle world tool tips." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_VGUI_HUD" , "VGUI: HUD" , "" , "" , function( Panel )

		-- Blacklisted in Lua.
		-- Panel:CheckBox( "Show Crosshair" , "crosshair" )
		-- Panel:ControlHelp( "crosshair\nToggle default crosshair." )
		Panel:Help( "crosshair" )
		Panel:ControlHelp( "crosshair\nToggle default crosshair.\nBlocked in Lua, run manually." )

		Panel:CheckBox( "Draw Vanilla HUD" , "cl_drawhud" )
		Panel:ControlHelp( "cl_drawhud\nToggle the vanilla HUD." )

		Panel:CheckBox( "Show Quick Info" , "hud_quickinfo" )
		Panel:ControlHelp( "hud_quickinfo\nToggle Xbox-style health/magazine bars around the crosshair." )

		Panel:CheckBox( "Draw Fixed Reticle" , "hud_draw_fixed_reticle" )
		Panel:ControlHelp( "hud_draw_fixed_reticle\nToggle Xbox-style crosshair." )

		Panel:CheckBox( "Draw Active Reticle" , "hud_draw_active_reticle" )
		Panel:ControlHelp( "hud_draw_active_reticle\nToggle Xbox-style crosshair changing color over enemies." )

		-- Doesn't exist in GMod.
		-- Panel:CheckBox( "Draw Empty Weapon Slots" , "hud_showemptyweaponslots" , { } )
		-- Panel:ControlHelp( "hud_showemptyweaponslots\nToggle empty weapons slots being shown on HUD." )

		-- Blacklisted in Lua.
		-- Panel:AddControl( "Slider", {
			-- ["label"] = "Fast Switch",
			-- ["Command"] = "hud_fastswitch",	
			-- ["Type"] = "int",
			-- ["min"] = "0", 	
			-- ["max"] = "2"
		-- }	)
		Panel:Help( "hud_fastswitch" )
		Panel:ControlHelp( "hud_fastswitch\nSet the fast switch setting. 0 = disabled, 1 = PC fast switch, 2 = console-style selection.\nBlocked in Lua, run manually." )

		Panel:CheckBox( "Show Device Battery" , "cl_showbattery" , { } )
		Panel:ControlHelp( "cl_showbattery\nDraw current battery level at top of screen when on battery power." )

		Panel:CheckBox( "Draw Hints" , "cl_showhelp" , { } )
		Panel:ControlHelp( "cl_showhelp\nToggle HUD hints." )

		Panel:AddControl( "Slider", {
			["label"] = "Chat Message Time",
			["Command"] = "hud_saytext_time",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "30"
		}	)
		Panel:ControlHelp( "hud_saytext_time\nHow long to show chat messages before they fade." )

		Panel:AddControl( "Slider", {
			["label"] = "Death Notice Time",
			["Command"] = "hud_deathnotice_time",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "16"
		}	)
		Panel:ControlHelp( "hud_deathnotice_time\nHow long to render death notices." )

		-- Doesn't exist in GMod.
		-- Panel:AddControl( "Slider", {
			-- ["label"] = "Death Notice Limit",
			-- ["Command"] = "hud_deathnotice_limit",	
			-- ["Type"] = "int",
			-- ["min"] = "0", 	
			-- ["max"] = "16"
		-- }	)
		-- Panel:ControlHelp( "hud_deathnotice_limit\nHow many death notices to render before they're replaced." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Server" , "Server" , "" , "" , function( Panel )

		Panel:AddControl( "Slider", {
			["label"] = "Purity Setting",
			["Command"] = "sv_pure",	
			["Type"] = "int",
			["min"] = "-1",
			["max"] = "2"
		}	)
		Panel:ControlHelp( "sv_pure\nOnly allow client to use certain files. I recommend -1.\n\n-1 - Do not apply any rules or restrict which files the client may load.\n0 - Apply rules in cfg/pure_server_minimal.txt only.\n1 - Apply rules in cfg/pure_server_full.txt and then cfg/pure_server_whitelist.txt.\n2 - Apply rules in cfg/pure_server_full.txt." )

		Panel:AddControl( "Slider", {
			["label"] = "Purity Consensus",
			["Command"] = "sv_pure_consensus",	
			["Type"] = "int",
			["min"] = "0",
			["max"] = "16"
		}	)
		Panel:ControlHelp( "sv_pure_consensus\nMinimum number of file hashes to agree to form a consensus." )

		Panel:AddControl( "Slider", {
			["label"] = "Retire Time",
			["Command"] = "sv_pure_retiretime",	
			["Type"] = "int",
			["min"] = "0",
			["max"] = "2000"
		}	)
		Panel:ControlHelp( "sv_pure_retiretime\nSeconds of server idle time to flush the sv_pure file hash cache." )

		Panel:CheckBox( "Kick Modified Clients" , "sv_pure_kick_clients" )
		Panel:ControlHelp( "sv_pure_kick_clients\nIf set to 1, the server will kick clients with mismatching files. Otherwise, it will issue a warning to the client." )

		Panel:CheckBox( "Print Verifications" , "sv_pure_trace" )
		Panel:ControlHelp( "sv_pure_trace\nIf set to 1, the server will print a message whenever a client is verifying a CRC for a file." )

		Panel:CheckBox( "Allow Client-side Lua" , "sv_allowcslua" )
		Panel:ControlHelp( "sv_allowcslua\nAllow clients to run clientside addons. This will override any gamemode setting!" )

		Panel:AddControl( "Slider", {
			["label"] = "Lua Error Tolerance",
			["Command"] = "sv_kickerrornum",	
			["Type"] = "int",
			["min"] = "0",
			["max"] = "2000"
		}	)
		Panel:ControlHelp( "sv_kickerrornum\nKick clients if they have this many Lua errors. Set to 0 to never kick." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Ladder" , "Ladders" , "" , "" , function( Panel )

		Panel:Help( "Options that affect Ladders." )

		Panel:CheckBox( "Ladders Require Interaction" , "sv_ladder_useonly" )
		Panel:ControlHelp( "sv_ladder_useonly\nIf set, ladders can only be mounted by pressing +USE" )

		Panel:AddControl( "Slider", {
			["label"] = "r_flashlightladderdist",
			["Command"] = "r_flashlightladderdist",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "r_flashlightladderdist\nUnknown effects." )

		Panel:CheckBox( "Show Ladder Debug" , "sv_showladders" , { } )
		Panel:ControlHelp( "sv_showladders\nShow bbox and dismount points for all ladders (must be set before level load.)" )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_GMod" , "GMod" , "" , "" , function( Panel )

		Panel:CheckBox( "Draw GMod Hints" , "cl_showhints" , { } )
		Panel:ControlHelp( "cl_showhints\nToggle those annoying hints GMod has." )

		Panel:CheckBox( "Hide Incompatible Versions" , "sb_filter_incompatible_versions" )
		Panel:ControlHelp( "sb_filter_incompatible_versions\nHides servers running incompatible versions from the server browser. (Internet tab only.)" )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_GMod_SpawnMenu" , "GMod: Spawn Menu" , "" , "" , function( Panel )

		Panel:Help( "Options that affect the GMod Menus." )

		Panel:Button( "Reload Spawnmenu" , "spawnmenu_reload" , { } )
		Panel:ControlHelp( "spawnmenu_reload\nReload the spawnmenu (will close this menu)." )

		Panel:CheckBox( "Experimental Spawn Icons" , "spawnicon_queue" , { } )
		Panel:ControlHelp( "spawnicon_queue\nEnables experimental spawnicon loading queue, which prevents the game from freezing when opening large spawnlists." )

		Panel:AddControl( "Slider", {
			["label"] = "Spawn Menu Border",
			["Command"] = "spawnmenu_border",	
			["Type"] = "float",
			["min"] = "0", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "spawnmenu_border\nHow much buffer between the spawn menu and the screen edges to have." )

		Panel:AddControl( "Slider", {
			["label"] = "Spawn Icon Sharpness",
			["Command"] = "spawnicon_sharpen",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "16"
		}	)
		Panel:ControlHelp( "spawnicon_sharpen\nSharpness of spawn icons." )

		Panel:AddControl( "Slider", {
			["label"] = "Max Search Results",
			["Command"] = "sbox_search_maxresults",	
			["Type"] = "int",
			["min"] = "32", 	
			["max"] = "2048"
		}	)
		Panel:ControlHelp( "sbox_search_maxresults\nMax amount of results for sandbox searches." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_GMod_PhysGun" , "GMod: Physics Gun" , "" , "" , function( Panel )

		Panel:CheckBox( "Show Effects Halo" , "physgun_halo" , { } )
		Panel:ControlHelp( "physgun_halo\nToggle Physics Gun halo on effects." )

		Panel:CheckBox( "Freeze Effects" , "effects_freeze" , { } )
		Panel:ControlHelp( "effects_freeze\nToggle Physics Gun freeze effect." )

		Panel:CheckBox( "Unfreeze Effects" , "effects_unfreeze" , { } )
		Panel:ControlHelp( "effects_unfreeze\nToggle Physics Gun unfreeze effect." )

		Panel:CheckBox( "Draw Beams" , "physgun_drawbeams" , { } )
		Panel:ControlHelp( "physgun_drawbeams\nToggle Physics Gun beam effects." )

		Panel:CheckBox( "Limit Physgun" , "physgun_limited" , { } )
		Panel:ControlHelp( "physgun_limited\nIf enabled, the Physics Gun will not be able to pick up certain map entities." )

		Panel:AddControl( "Slider", {
			["label"] = "Scroll Sensitivity",
			["Command"] = "physgun_wheelspeed",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "physgun_wheelspeed\nThe sensitivity of wheel scrolling. Default 10" )

		Panel:AddControl( "Slider", {
			["label"] = "Rotate Sensitivity",
			["Command"] = "physgun_rotation_sensitivity",	
			["Type"] = "float",
			["min"] = "0", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "physgun_rotation_sensitivity\nThe sensitivity of rotation. Default 0.05" )

		Panel:AddControl( "Slider", {
			["label"] = "Range Limit",
			["Command"] = "physgun_maxrange",	
			["Type"] = "int",
			["min"] = "128", 	
			["max"] = "8192"
		}	)
		Panel:ControlHelp( "physgun_maxrange\nThe maximum range of the physgun. Default 4096." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_GMod_ToolGun" , "GMod: Tool Gun" , "" , "" , function( Panel )

		Panel:CheckBox( "Show Tool Help" , "gmod_drawhelp" )
		Panel:ControlHelp( "gmod_drawhelp\nShould the tool HUD be displayed when the tool gun is active?" )

		Panel:CheckBox( "Draw Tool Effects" , "gmod_drawtooleffects" , { } )
		Panel:ControlHelp( "gmod_drawtooleffects\nShould tools draw certain UI elements or effects? (Will not work for all tools)" )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Items" , "Items" , "" , "" , function( Panel )

		Panel:Help( "Options that affect weapons or items." )

		Panel:AddControl( "Slider", {
			["label"] = "Shotgun Pellet Amount",
			["Command"] = "sk_plr_num_shotgun_pellets",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "sk_plr_num_shotgun_pellets\nHow many pellets the player's shotgun blasts will fire. Default of 7." )

		Panel:AddControl( "Slider", {
			["label"] = "Combine Ball Duration",
			["Command"] = "sk_weapon_ar2_alt_fire_duration",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "120"
		}	)
		Panel:ControlHelp( "sk_weapon_ar2_alt_fire_duration\nHow long an AR2 alt-fire will last until it self-destructs, in seconds. Default of 2." )

		Panel:AddControl( "Slider", {
			["label"] = "Combine Ball Mass",
			["Command"] = "sk_weapon_ar2_alt_fire_mass",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "500"
		}	)
		Panel:ControlHelp( "sk_weapon_ar2_alt_fire_mass\nThe physical mass of the AR2 alt-fire when it hits a surface. Higher mass values will cause more screen shaking. Default of 150." )

		Panel:AddControl( "Slider", {
			["label"] = "Dynamic Resupply Debug",
			["Command"] = "g_debug_dynamicresupplies",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2"
		}	)
		Panel:ControlHelp( "g_debug_dynamicresupplies\nDebug item_dynamic_resupply spawning.\nSet to 1 to see text printouts of the spawning.\nSet to 2 to see lines drawn to other items factored into the spawning." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Items_HEV" , "Items: HEV" , "" , "" , function( Panel )

		Panel:CheckBox( "Toggle HEV Suit" , "gmod_suit" , { } )
		Panel:ControlHelp( "gmod_suit\nSet to enable Half-Life 2 aux suit power stuff." )

		Panel:AddControl( "Slider", {
			["label"] = "Battery Amount",
			["Command"] = "sk_battery",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "sk_battery\nHow much item_suit power battery pickups will provide. Default of 15." )

		Panel:AddControl( "Slider", {
			["label"] = "Suit Charger Capacity",
			["Command"] = "sk_suitcharger",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2000"
		}	)
		Panel:ControlHelp( "sk_suitcharger\nThe amount of charge suit chargers have. Default of 75." )

		Panel:AddControl( "Slider", {
			["label"] = "Citadel Suit Charger Capacity",
			["Command"] = "sk_suitcharger_citadel",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2000"
		}	)
		Panel:ControlHelp( "sk_suitcharger_citadel\nThe amount of charge Citadel suit chargers have. Default of 500." )

		Panel:AddControl( "Slider", {
			["label"] = "Citadel Suit Charger Limit",
			["Command"] = "sk_suitcharger_citadel_maxarmor",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "500"
		}	)
		Panel:ControlHelp( "sk_suitcharger_citadel_maxarmor\nThe amount of charge Citadel suit chargers will give before they deny. Default of 200." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Vehicles" , "Vehicles" , "" , "" , function( Panel )

		Panel:Help( "------\nAIRBOAT\n------" )

		Panel:CheckBox( "Draw Airboat Wake" , "cl_draw_airboat_wake" , { } )
		Panel:ControlHelp( "cl_draw_airboat_wake\nToggle airboat water wake effects." )

		Panel:AddControl( "Slider", {
			["label"] = "Airboat Fatal Stress",
			["Command"] = "airboat_fatal_stress",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "50000"
		}	)
		Panel:ControlHelp( "airboat_fatal_stress\nAmount of stress in KG that would kill the airboat driver." )

		Panel:AddControl( "Slider", {
			["label"] = "Airboat Gun Drain Rate",
			["Command"] = "sk_airboat_drain_rate",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "sk_airboat_drain_rate\nDrain rate per-shot of the Airboat Gun." )

		Panel:AddControl( "Slider", {
			["label"] = "Airboat Gun Max Ammo",
			["Command"] = "sk_airboat_max_ammo",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "1000"
		}	)
		Panel:ControlHelp( "sk_airboat_max_ammo\nHow much charge the Airboat Gun has." )

		Panel:AddControl( "Slider", {
			["label"] = "Airboat Gun NPC Damage",
			["Command"] = "sk_npc_dmg_airboat",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "1000"
		}	)
		Panel:ControlHelp( "sk_npc_dmg_airboat\nHow much damage the Airboat Gun does to NPCs." )

		Panel:AddControl( "Slider", {
			["label"] = "Airboat Gun Player Damage",
			["Command"] = "sk_plr_dmg_airboat",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "1000"
		}	)
		Panel:ControlHelp( "sk_plr_dmg_airboat\nHow much damage the Airboat Gun does to players." )

		Panel:Help( "------\nSCOUT CAR\n------" )

		Panel:AddControl( "Slider", {
			["label"] = "Jeep FOV",
			["Command"] = "r_jeepfov",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "60"
		}	)
		Panel:ControlHelp( "r_jeepfov\nFOV when driving the Buggy. Not sure if functional in GMod." )

		Panel:AddControl( "Slider", {
			["label"] = "Buggy Gauss Damage",
			["Command"] = "sk_jeep_gauss_damage",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "60"
		}	)
		Panel:ControlHelp( "sk_jeep_gauss_damage\nAmount Buggy gauss damage from basic shot." )

		Panel:Help( "------\nMUSCLE CAR\n------" )

		Panel:AddControl( "Slider", {
			["label"] = "Radar Range",
			["Command"] = "radar_range",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "5000"
		}	)
		Panel:ControlHelp( "radar_range\nDistance the EP2 Muscle Car radar will scan for beacons. Default of 3000." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Flashlight" , "Flashlight" , "" , "" , function( Panel )

		Panel:AddControl("ComboBox", {
			["MenuButton"] = 1 ,
			["Folder"] = "ocm_flashlight" ,
			["Options"] = {
				["default"] = {
					["hl2_darkness_flashlight_factor"] = "1",
					["mat_exposure_center_region_x_flashlight"] = "0.9",
					["mat_exposure_center_region_y_flashlight"] = "0.85",
					["mat_supportflashlight"] = "-1",
					-- ["mp_flashlight"] = "0",
					["r_flashlightambient"] = "0",
					["r_flashlightclip"] = "0",
					["r_flashlightconstant"] = "0",
					["r_flashlightculldepth"] = "1",
					["r_flashlightdepthres"] = "1024",
					["r_flashlightdepthtexture"] = "1",
					["r_flashlightdrawclip"] = "0",
					["r_flashlightdrawdepth"] = "0",
					["r_flashlightdrawfrustum"] = "0",
					["r_flashlightdrawfrustumbbox"] = "0",
					["r_flashlightdrawsweptbbox"] = "0",
					["r_flashlightfar"] = "750",
					["r_flashlightfov"] = "60",
					["r_flashlightladderdist"] = "40",
					["r_flashlightlinear"] = "100",
					["r_flashlightlockposition"] = "0",
					["r_flashlightmodels"] = "1",
					["r_flashlightnear"] = "4",
					["r_flashlightnodraw"] = "0",
					["r_flashlightoffsetx"] = "10",
					["r_flashlightoffsety"] = "-20",
					["r_flashlightoffsetz"] = "24",
					["r_flashlightquadratic"] = "0",
					["r_flashlightrender"] = "1",
					["r_flashlightrendermodels"] = "1",
					["r_flashlightrenderworld"] = "1",
					["r_flashlightscissor"] = "1",
					["r_flashlightshadowatten"] = "0.35",
					["r_flashlightupdatedepth"] = "1",
					["r_flashlightvisualizetrace"] = "0",
					["r_newflashlight"] = "1",
					["r_swingflashlight"] = "1",
				},
				["potato"] = {
					["mat_supportflashlight"] = "0",
					["r_flashlightdepthres"] = "16",
					["r_flashlightdepthtexture"] = "0",
					["r_flashlightmodels"] = "0",
					["r_flashlightnodraw"] = "0",
					["r_flashlightrender"] = "0",
					["r_flashlightrendermodels"] = "0",
					["r_flashlightrenderworld"] = "0",
					["r_flashlightupdatedepth"] = "0",
				},
				["floodlight"] = {
					["r_flashlightdepthres"] = "1024",
					["r_flashlightfar"] = "1250",
					["r_flashlightfov"] = "90",
					["r_flashlightnear"] = "4",
					["r_flashlightshadowatten"] = "0.35",
				}
			},
			["CVars"] = {
				"hl2_darkness_flashlight_factor",
				"mat_exposure_center_region_x_flashlight",
				"mat_exposure_center_region_y_flashlight",
				"mat_supportflashlight",
				-- "mp_flashlight",
				"r_flashlightambient",
				"r_flashlightclip",
				"r_flashlightconstant",
				"r_flashlightculldepth",
				"r_flashlightdepthres",
				"r_flashlightdepthtexture",
				"r_flashlightdrawclip",
				"r_flashlightdrawdepth",
				"r_flashlightdrawfrustum",
				"r_flashlightdrawfrustumbbox",
				"r_flashlightdrawsweptbbox",
				"r_flashlightfar",
				"r_flashlightfov",
				"r_flashlightladderdist",
				"r_flashlightlinear",
				"r_flashlightlockposition",
				"r_flashlightmodels",
				"r_flashlightnear",
				"r_flashlightnodraw",
				"r_flashlightoffsetx",
				"r_flashlightoffsety",
				"r_flashlightoffsetz",
				"r_flashlightquadratic",
				"r_flashlightrender",
				"r_flashlightrendermodels",
				"r_flashlightrenderworld",
				"r_flashlightscissor",
				"r_flashlightshadowatten",
				"r_flashlightupdatedepth",
				"r_flashlightvisualizetrace",
				"r_newflashlight",
				"r_swingflashlight"
			}
		} )

		Panel:CheckBox( "Draw Flashlight" , "r_flashlightrender" )
		Panel:ControlHelp( "r_flashlightrender\nToggle flashlight rendering." )

		-- Blocked via Lua.
		-- Panel:CheckBox( "Allow Flashlight" , "mp_flashlight" )
		Panel:ControlHelp( "mp_flashlight\nToggle the ability to use the flashlight.\nBlocked in Lua, run manually." )

		Panel:CheckBox( "Flashlight Mode" , "r_newflashlight" )
		Panel:ControlHelp( "r_newflashlight\nToggle between the HL2 (from player) or HL1-style (from crosshair) flashlight." )

		Panel:CheckBox( "r_swingflashlight" , "r_swingflashlight" )
		Panel:ControlHelp( "r_swingflashlight\nUnknown effects." )

		Panel:CheckBox( "r_flashlightrendermodels" , "r_flashlightrendermodels" )
		Panel:ControlHelp( "r_flashlightrendermodels\nUnknown effects." )

		Panel:CheckBox( "r_flashlightrenderworld" , "r_flashlightrenderworld" )
		Panel:ControlHelp( "r_flashlightrenderworld\nUnknown effects." )

		Panel:CheckBox( "Illuminate Models" , "r_flashlightmodels" )
		Panel:ControlHelp( "r_flashlightmodels\nShould flashlight illuminate models?" )

		Panel:CheckBox( "r_flashlightscissor" , "r_flashlightscissor" )
		Panel:ControlHelp( "r_flashlightscissor\nUnknown effects." )

		Panel:CheckBox( "Draw Flashlight Trace" , "r_flashlightvisualizetrace" )
		Panel:ControlHelp( "r_flashlightvisualizetrace\nDraw flashlight target with a blue cube and red trace line." )

		Panel:CheckBox( "Draw Flashlight Frustum" , "r_flashlightdrawfrustumbbox" )
		Panel:ControlHelp( "r_flashlightdrawfrustumbbox\nDraw flashlight frustum bounding box." )

		Panel:CheckBox( "r_flashlightdrawsweptbbox" , "r_flashlightdrawsweptbbox" )
		Panel:ControlHelp( "r_flashlightdrawsweptbbox\nUnknown effects." )

		Panel:CheckBox( "Lock Position" , "r_flashlightlockposition" )
		Panel:ControlHelp( "r_flashlightlockposition\nLock the flashlight in the position it was turned on. Sort of like a budget lamp." )

		Panel:CheckBox( "r_flashlightnodraw" , "r_flashlightnodraw" )
		Panel:ControlHelp( "r_flashlightnodraw\nUnknown effects." )

		Panel:AddControl( "Slider", {
			["label"] = "Materials Support Flashlight",
			["Command"] = "mat_supportflashlight",	
			["Type"] = "int",
			["min"] = "-1", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "mat_supportflashlight\n0 - do not support flashlight (don't load flashlight shader combos).\n1 - flashlight is supported." )

		Panel:AddControl( "Slider", {
			["label"] = "Flashlight FOV",
			["Command"] = "r_flashlightfov",	
			["Type"] = "int",
			["min"] = "20", 	
			["max"] = "150"
		}	)
		Panel:ControlHelp( "r_flashlightfov\nFlashlight FOV spread." )

		Panel:CheckBox( "Darkness Factor" , "hl2_darkness_flashlight_factor" )
		Panel:ControlHelp( "hl2_darkness_flashlight_factor\nUnknown effects." )

		Panel:AddControl( "Slider", {
			["label"] = "Near Limit",
			["Command"] = "r_flashlightnear",	
			["Type"] = "int",
			["min"] = "1", 	
			["max"] = "5000"
		}	)
		Panel:ControlHelp( "r_flashlightnear\nMinimum distance before flashlight projects." )

		Panel:AddControl( "Slider", {
			["label"] = "Far Limit",
			["Command"] = "r_flashlightfar",	
			["Type"] = "int",
			["min"] = "1", 	
			["max"] = "5000"
		}	)
		Panel:ControlHelp( "r_flashlightfar\nMaximum distance flashlight projects." )

		Panel:CheckBox( "Draw Depth Texture" , "r_flashlightdepthtexture" )
		Panel:ControlHelp( "r_flashlightdepthtexture\nDraw the offset cast shadows from the flashlight.\nNote: This might hang  or potentially crash your game due to reloading the lighting system. Use carefully." )

		Panel:CheckBox( "r_flashlightupdatedepth" , "r_flashlightupdatedepth" )
		Panel:ControlHelp( "r_flashlightupdatedepth\nUnknown effects." )

		Panel:AddControl( "Slider", {
			["label"] = "Shadow Resolution",
			["Command"] = "r_flashlightdepthres",	
			["Type"] = "int",
			["min"] = "64", 	
			["max"] = "2048"
		}	)
		Panel:ControlHelp( "r_flashlightdepthres\nFlashlight shadow resolution." )

		Panel:AddControl( "Slider", {
			["label"] = "r_flashlightambient",
			["Command"] = "r_flashlightambient",	
			["Type"] = "float",
			["min"] = "0", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "r_flashlightambient\nUnknown effects." )

		Panel:CheckBox( "r_flashlightdrawclip" , "r_flashlightdrawclip" )
		Panel:ControlHelp( "r_flashlightdrawclip\nUnknown effects." )

		Panel:AddControl( "Slider", {
			["label"] = "r_flashlightclip",
			["Command"] = "r_flashlightclip",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "10"
		}	)
		Panel:ControlHelp( "r_flashlightclip\nUnknown effects." )

		Panel:AddControl( "Slider", {
			["label"] = "Shadow Attenunation",
			["Command"] = "r_flashlightshadowatten",	
			["Type"] = "float",
			["min"] = "0", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "r_flashlightshadowatten\nScale of cast shadow attenunation." )

		Panel:Help( "Lighting Origin Offsets" )

		Panel:AddControl( "Slider", {
			["label"] = "X-Offset",
			["Command"] = "r_flashlightoffsetx",	
			["Type"] = "int",
			["min"] = "-100", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "r_flashlightoffsetx\nFlashlight origina X-offset" )

		Panel:AddControl( "Slider", {
			["label"] = "Y-Offset",
			["Command"] = "r_flashlightoffsety",	
			["Type"] = "int",
			["min"] = "-60", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "r_flashlightoffsety\nFlashlight origina Y-offset" )

		Panel:AddControl( "Slider", {
			["label"] = "Z-Offset",
			["Command"] = "r_flashlightoffsetz",	
			["Type"] = "int",
			["min"] = "-100", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "r_flashlightoffsetz\nFlashlight origina Z-offset" )

		Panel:Help( "The following three commands use the Constant-Linear-Quadratic Falloff method of lighting. If you're not familiar with this from using Hammer, check the Valve Developer Community article for a more detailed explanation:\nhttps://developer.valvesoftware.com/wiki/Constant-Linear-Quadratic_Falloff" )

		Panel:AddControl( "Slider", {
			["label"] = "Constant",
			["Command"] = "r_flashlightconstant",	
			["Type"] = "float",
			["min"] = "0", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "r_flashlightconstant\nConstant level for the flashlight" )

		Panel:AddControl( "Slider", {
			["label"] = "Linear",
			["Command"] = "r_flashlightlinear",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "100"
		}	)
		Panel:ControlHelp( "r_flashlightlinear\nLinear level for the flashlight" )

		Panel:AddControl( "Slider", {
			["label"] = "Quadratic",
			["Command"] = "r_flashlightquadratic",	
			["Type"] = "float",
			["min"] = "0", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "r_flashlightquadratic\nQuadratic level for the flashlight" )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Player" , "Player" , "" , "" , function( Panel )

		Panel:Help( "Options that affect the player or inputs." )

		Panel:CheckBox( "Fall Damage" , "mp_falldamage" )
		Panel:ControlHelp( "mp_falldamage\nIf set, fall damage will be based on velocity instead of a flat 10." )

		Panel:CheckBox( "Toggle Sprint" , "sv_stickysprint" )
		Panel:ControlHelp( "sv_stickysprint\nIf set, sprint will be a toggle." )

		Panel:CheckBox( "Player Flexes" , "cl_playerflexes" )
		Panel:ControlHelp( "cl_playerflexes\nIf player model has facial flexes, use them when talking." )

		Panel:AddControl( "Slider", {
			["label"] = "Player Skin",
			["Command"] = "cl_playerskin",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "30"
		}	)
		Panel:ControlHelp( "cl_playerskin\nSet the player model's skin. Functionally the same as the player menu." )

		Panel:Button( "Hurt Me" , "hurtme" , 25 )
		Panel:ControlHelp( "hurtme\nHurts the player. (I have tied this button to 25)\nArguments: <health to lose>" )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Player_Viewmodel" , "Player: View Model" , "" , "" , function( Panel )

		Panel:Help( "Options that affect the player first-person view." )

		Panel:CheckBox( "Draw View Model" , "r_drawviewmodel" , { } )
		Panel:ControlHelp( "r_drawviewmodel\nToggle rendering of view models." )

		Panel:Help( "I haven't found a way to make it work with a button yet, but using the following will toggle the weapon's lowered state:" )
		Panel:ControlHelp( "global_set friendly_encounter 1\n\nglobal_set friendly_encounter 0" )

		Panel:Button( "Holster Weapon" , "impulse" , "200" )
		Panel:ControlHelp( "impulse 200\nToggle the view model\'s ACT_VM_HOLSTER or ACT_VM_DRAW sequence." )

		Panel:AddControl( "Slider", {
			["label"] = "View Model FOV",
			["Command"] = "viewmodel_fov",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "175"
		}	)
		Panel:ControlHelp( "viewmodel_fov\nSet the view model's FOV." )

		Panel:AddControl( "Slider", {
			["label"] = "Player FOV",
			["Command"] = "fov_desired",	
			["Type"] = "int",
			["min"] = "72",
			["max"] = "100"
		}	)
		Panel:ControlHelp( "fov_desired\nSet the player's FOV." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Source_Perf" , "Performance" , "" , "" , function( Panel )

		Panel:Help( "Options for some of the more niche Source Performance settings. Note: many require cheats to be enabled." )

		Panel:AddControl("ComboBox", {
			["MenuButton"] = 1 ,
			["Folder"] = "ocm_performance" ,
			["Options"] = {
				["default"] = {
					["r_decals"] = "2048",
					["cl_ejectbrass"] = "1",
					["r_drawflecks"] = "1",
					["r_drawparticles"] = "1",
					["g_ragdoll_maxcount"] = "32",
					["mat_aaquality"] = "1",
					["mat_antialias"] = "0",
					["gmod_physiterations"] = "4",
				},
				["high"] = {
					["r_decals"] = "2048",
					["cl_ejectbrass"] = "1",
					["r_drawflecks"] = "1",
					["r_drawparticles"] = "1",
					["g_ragdoll_maxcount"] = "32",
					["mat_aaquality"] = "1",
					["mat_antialias"] = "8",
					["gmod_physiterations"] = "4",
				},
				["potato"] = {
					["r_decals"] = "2048",
					["cl_ejectbrass"] = "0",
					["r_drawflecks"] = "0",
					["r_drawparticles"] = "0",
					["g_ragdoll_maxcount"] = "0",
					["mat_aaquality"] = "0",
					["mat_antialias"] = "0",
					["gmod_physiterations"] = "1",
				}
			},
			["CVars"] = {
				"r_decals",
				"cl_ejectbrass",
				"r_drawflecks",
				"r_drawparticles",
				"g_ragdoll_maxcount",
				"mat_aaquality",
				"mat_antialias",
				"gmod_physiterations",
			}
		} )

		Panel:Button( "Clear Decals" , "r_cleardecals" , { } )
		Panel:ControlHelp( "r_cleardecals\nClear all decals from map (blood, bullet impacts, etc.)" )

		Panel:AddControl( "Slider", {
			["label"] = "Decal Limit",
			["Command"] = "r_decals",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2048"
		}	)
		Panel:ControlHelp( "r_decals\nDecal limits before they start disappearing." )

		Panel:CheckBox( "Draw Shell Ejections" , "cl_ejectbrass" , { } )
		Panel:ControlHelp( "cl_ejectbrass\nToggle shell ejections from weapons." )

		Panel:CheckBox( "Draw Flecks" , "r_drawflecks" , { } )
		Panel:ControlHelp( "r_drawflecks\nToggle \"flecks\" (effects put out by bullet impacts)." )

		Panel:CheckBox( "Draw Particles" , "r_drawparticles" , { } )
		Panel:ControlHelp( "r_drawparticles\nToggle particle effects." )

		Panel:AddControl( "Slider", {
			["label"] = "Beams Render Mode",
			["Command"] = "r_drawbeams",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2"
		}	)
		Panel:ControlHelp( "r_drawbeams\nChange how beams are rendered. 0=Not rendered. 1=Normal. 2=Wireframe mode." )

		Panel:AddControl( "Slider", {
			["label"] = "Death Ragdoll Limit",
			["Command"] = "g_ragdoll_maxcount",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "64"
		}	)
		Panel:ControlHelp( "g_ragdoll_maxcount\nHow many corpses can be rendered at once. 0 will make them disappear immediately, while 100 would let 100 different corpses appear at once." )

		Panel:CheckBox( "Use Quality AA" , "mat_aaquality" , { } )
		Panel:ControlHelp( "mat_aaquality\nToggle \"expensive\" anti-aliasing." )

		Panel:AddControl( "Slider", {
			["label"] = "Anti-Aliasing Quality",
			["Command"] = "mat_antialias",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "8"
		}	)
		Panel:ControlHelp( "mat_antialias\nAnti-Aliasing quality level." )

		Panel:AddControl( "Slider", {
			["label"] = "Physics Iterations",
			["Command"] = "gmod_physiterations",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "8"
		}	)
		Panel:ControlHelp( "gmod_physiterations\nHow many physics iterations to use. More=more intensive." )

		Panel:AddControl( "Slider", {
			["label"] = "Sleep Timer",
			["Command"] = "vphys_sleep_timeout",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "60"
		}	)
		Panel:ControlHelp( "vphys_sleep_timeout\nHow many seconds before physics objects go to sleep mode to save resources." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Source_Perf_Water" , "Performance: Water" , "" , "" , function( Panel )

		Panel:AddControl("ComboBox", {
			["MenuButton"] = 1 ,
			["Folder"] = "ocm_performance" ,
			["Options"] = {
				["default"] = {
					["mat_drawwater"] = "1",
					["r_debugcheapwater"] = "0",
					["r_waterforceexpensive"] = "0",
					["r_waterforcereflectentities"] = "0",
					["r_waterdrawreflection"] = "1",
					["r_waterdrawrefraction"] = "1",
					["fog_enable_water_fog"] = "1",
					["r_forcewaterleaf"] = "1",
				},
				["high"] = {
					["mat_drawwater"] = "1",
					["r_debugcheapwater"] = "0",
					["r_waterforceexpensive"] = "1",
					["r_waterforcereflectentities"] = "1",
					["r_waterdrawreflection"] = "1",
					["r_waterdrawrefraction"] = "1",
					["fog_enable_water_fog"] = "1",
					["r_forcewaterleaf"] = "1",
				},
				["potato"] = {
					["mat_drawwater"] = "1",
					["r_debugcheapwater"] = "1",
					["r_waterforceexpensive"] = "0",
					["r_waterforcereflectentities"] = "0",
					["r_waterdrawreflection"] = "0",
					["r_waterdrawrefraction"] = "0",
					["fog_enable_water_fog"] = "0",
					["r_forcewaterleaf"] = "1",
				}
			},
			["CVars"] = {
				"mat_drawwater",
				"r_debugcheapwater",
				"r_waterforceexpensive",
				"r_waterforcereflectentities",
				"r_waterdrawreflection",
				"r_waterdrawrefraction",
				"fog_enable_water_fog",
				"r_forcewaterleaf",
			}
		} )

		Panel:CheckBox( "Draw Water" , "mat_drawwater" , { } )
		Panel:ControlHelp( "mat_drawwater\nToggle rendering of water." )

		Panel:CheckBox( "Disable Expensive Water" , "r_debugcheapwater" , { } )
		Panel:ControlHelp( "r_debugcheapwater\nForce all water to be \"cheap\" water." )

		Panel:CheckBox( "Force Expensive Water" , "r_waterforceexpensive" , { } )
		Panel:ControlHelp( "r_waterforceexpensive\nForce all water to be \"expensive\" (performance intensive)." )

		Panel:CheckBox( "Force Reflect Entities" , "r_waterforcereflectentities" , { } )
		Panel:ControlHelp( "r_waterforcereflectentities\nToggle forced rendering of entity water reflections." )

		Panel:CheckBox( "Draw Reflection" , "r_waterdrawreflection" , { } )
		Panel:ControlHelp( "r_waterdrawreflection\nToggle rendering of water reflections." )

		Panel:CheckBox( "Draw Refraction" , "r_waterdrawrefraction" , { } )
		Panel:ControlHelp( "r_waterdrawrefraction\nToggle rendering of water refractions." )

		Panel:CheckBox( "Draw Water Fog" , "fog_enable_water_fog" , { } )
		Panel:ControlHelp( "fog_enable_water_fog\nToggle rendering of water fog." )

		Panel:CheckBox( "Force Water Leaf" , "r_forcewaterleaf" , { } )
		Panel:ControlHelp( "r_forcewaterleaf\nEnable for optimization to water - considers view in leaf under water for purposes of culling." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Source_Perf_Map" , "Performance: Map" , "" , "" , function( Panel )

		Panel:AddControl("ComboBox", {
			["MenuButton"] = 1 ,
			["Folder"] = "ocm_performance" ,
			["Options"] = {
				["default"] = {
					["r_3dsky"] = "1",
					["r_drawskybox"] = "1",
					["r_drawrain"] = "1",
					["r_drawropes"] = "1",
					["r_drawsprites"] = "1",
					["r_drawstaticprops"] = "1",
					["r_drawdisp"] = "1",
					["r_farz"] = "-1",
					["cl_detaildist"] = "1200",
					["cl_detailfade"] = "400",
				},
				["high"] = {
					["r_3dsky"] = "1",
					["r_drawskybox"] = "1",
					["r_drawrain"] = "1",
					["r_drawropes"] = "1",
					["r_drawsprites"] = "1",
					["r_drawstaticprops"] = "1",
					["r_drawdisp"] = "1",
					["r_farz"] = "-1",
					["cl_detaildist"] = "2400",
					["cl_detailfade"] = "400",
				},
				["potato"] = {
					["r_3dsky"] = "0",
					["r_drawskybox"] = "1",
					["r_drawrain"] = "0",
					["r_drawropes"] = "0",
					["r_drawsprites"] = "0",
					["r_drawstaticprops"] = "0",
					["r_drawdisp"] = "1",
					["r_farz"] = "2400",
					["cl_detaildist"] = "0",
					["cl_detailfade"] = "0",
				}
			},
			["CVars"] = {
				"r_3dsky",
				"r_drawskybox",
				"r_drawrain",
				"r_drawropes",
				"r_drawsprites",
				"r_drawstaticprops",
				"r_drawdisp",
				"r_farz",
				"cl_detaildist",
				"cl_detailfade",
			}
		} )

		Panel:CheckBox( "Draw 3D Skybox" , "r_3dsky" , { } )
		Panel:ControlHelp( "r_3dsky\nToggle rendering of 3D skybox." )

		Panel:CheckBox( "Draw Skybox" , "r_drawskybox" , { } )
		Panel:ControlHelp( "r_drawskybox\nToggle rendering of skybox." )

		Panel:CheckBox( "Draw Rain" , "r_drawrain" , { } )
		Panel:ControlHelp( "r_drawrain\nToggle rendering of func_precipitation effects." )

		Panel:CheckBox( "Draw Ropes" , "r_drawropes" , { } )
		Panel:ControlHelp( "r_drawropes\nToggle ropes." )

		Panel:CheckBox( "Draw Sprites" , "r_drawsprites" , { } )
		Panel:ControlHelp( "r_drawsprites\nToggle sprites." )

		Panel:CheckBox( "Draw Static Props" , "r_drawstaticprops" , { } )
		Panel:ControlHelp( "r_drawstaticprops\nToggle static props." )

		Panel:CheckBox( "Draw Displacements" , "r_drawdisp" , { } )
		Panel:ControlHelp( "r_drawdisp\nToggle rendering of displacements." )

		Panel:AddControl( "Slider", {
			["label"] = "Clipping Plane Distance",
			["Command"] = "r_farz",	
			["Type"] = "int",
			["min"] = "-1", 	
			["max"] = "32768"
		}	)
		Panel:ControlHelp( "r_farz\nOverride the far clipping plane. -1 means to use the value in env_fog_controller." )

		Panel:AddControl( "Slider", {
			["label"] = "Detail Prop Distance",
			["Command"] = "cl_detaildist",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "2048"
		}	)
		Panel:ControlHelp( "cl_detaildist\nDistance to render detail props on displacements. 0=disabled. Higher is more intensive. I recommend 1200." )

		Panel:AddControl( "Slider", {
			["label"] = "Detail Prop Fade Distance",
			["Command"] = "cl_detailfade",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "1024"
		}	)
		Panel:ControlHelp( "cl_detailfade\nDistance in Hammer Units at which detail props begin to fade. Default of 400 is fine for average usage." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Source_Perf_Model" , "Performance: Model" , "" , "" , function( Panel )

		Panel:CheckBox( "Draw Spawn Effect" , "cl_drawspawneffect" , { } )
		Panel:ControlHelp( "cl_drawspawneffect\nUse the GMod spawn effect." )

		Panel:CheckBox( "Draw Model Decals" , "r_drawmodeldecals" , { } )
		Panel:ControlHelp( "r_drawmodeldecals\nDraw decals on models (i.e. bullet holes, blood, etc.)." )

		Panel:AddControl( "Slider", {
			["label"] = "LOD Override",
			["Command"] = "r_lod",	
			["Type"] = "int",
			["min"] = "-1", 	
			["max"] = "6"
		}	)
		Panel:ControlHelp( "r_lod\nOverrides LOD on all models, regardless of model/Hammer settings. 0=All props are locked to their root LOD, 1=LOD level 1, etc. -1 to disable." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Sound" , "Sound" , "" , "" , function( Panel )

		Panel:Help( "Options for sound system settings." )

		Panel:Button( "Restart Sounds" , "snd_restart" , { } )
		Panel:ControlHelp( "snd_restart\nRestart the sound system. Fixes broken loops and doesn't typically break soundscapes." )

		Panel:Button( "Stop Sounds" , "stopsound" , { } )
		Panel:ControlHelp( "stopsound\nStops all sounds. Will likely break scripts or other sounds." )

		Panel:Button( "Flush Soundscapes" , "soundscape_flush" , { } )
		Panel:ControlHelp( "soundscape_flush\nFlushes the server & client side soundscapes." )

		Panel:Button( "Stop Soundscapes" , "stopsoundscape" , { } )
		Panel:ControlHelp( "stopsoundscape\nStops all soundscapes." )

		Panel:CheckBox( "Toggle Commentary" , "commentary" , { } )
		Panel:ControlHelp( "commentary\nToggle developer commentary nodes." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Sound_VOIP" , "Sound: VOIP" , "" , "" , function( Panel )

		Panel:CheckBox( "Enable VOIP (SV)" , "sv_voiceenable" , { } )
		Panel:ControlHelp( "sv_voiceenable\nToggle server-side VOIP functionality." )

		-- Blocked via Lua.
		-- Panel:CheckBox( "Enable VOIP (CL)" , "voice_enable" , { } )
		Panel:Help( "voice_enable" )
		Panel:ControlHelp( "voice_enable\nToggle client-side VOIP functionality.\nBlocked in Lua, run manually." )

		Panel:CheckBox( "Use Steam Voice Codec" , "sv_use_steam_voice" , { } )
		Panel:ControlHelp( "sv_use_steam_voice\nEnable/disable using Steam Voice instead of the old voice codec (if enabled, voice_inputfromfile will no longer function)." )

		Panel:CheckBox( "File Input (SV)" , "sv_allow_voice_from_file" , { } )
		Panel:ControlHelp( "sv_allow_voice_from_file\nAllow or disallow clients from using voice_inputfromfile on this server." )

		-- Blocked via Lua.
		-- Panel:CheckBox( "File Input (CL)" , "voice_inputfromfile" , { } )
		Panel:Help( "voice_inputfromfile" )
		Panel:ControlHelp( "voice_inputfromfile\nAllow or disallow clients from using voice_inputfromfile on the client.\nBlocked in Lua, run manually." )

		-- Blocked via Lua.
		-- Panel:CheckBox( "Can Hear Self" , "voice_loopback" , { } )
		Panel:Help( "voice_loopback" )
		Panel:ControlHelp( "voice_loopback\nToggle if you can hear yourself on microphone.\nBlocked in Lua, run manually." )

		Panel:CheckBox( "Show Voice Icons" , "mp_show_voice_icons" , { } )
		Panel:ControlHelp( "mp_show_voice_icons\nToggle speech bubbles over player heads." )

		-- Blocked via Lua.
		-- Panel:AddControl( "Slider", {
			-- ["label"] = "Fade Out Time",
			-- ["Command"] = "voice_fadeouttime",	
			-- ["Type"] = "float",
			-- ["min"] = "0", 	
			-- ["max"] = "1"
		-- }	)
		Panel:Help( "voice_fadeouttime" )
		Panel:ControlHelp( "voice_fadeouttime\nTime to fade out after releasing the voice key.\nBlocked in Lua, run manually." )

	end )

	spawnmenu.AddToolMenuOption( "Options" , "OCM" , "vntOCM_Sound_DSP" , "Sound: DSP" , "" , "" , function( Panel )

		Panel:Help( "Digital Signal Processing settings.\nConsult list for more info: https://developer.valvesoftware.com/wiki/DSP" )

		Panel:Button( "Reload DSP" , "dsp_reload" , { } )
		Panel:ControlHelp( "dsp_reload\nReloads the current DSP settings." )

		Panel:CheckBox( "Disable DSP" , "dsp_off" , { } )
		Panel:ControlHelp( "dsp_off\nToggle Digital Signal Processing." )

		Panel:CheckBox( "Slow CPU Mode" , "dsp_slow_cpu" , { } )
		Panel:ControlHelp( "dsp_slow_cpu\nDisables more processor-intensive DSP effects, such as room, spatial, etc." )

		Panel:CheckBox( "Enhance Stereo" , "dsp_enhance_stereo" , { } )
		Panel:ControlHelp( "dsp_enhance_stereo\nEnables application of spatial delays to room effects." )

		Panel:AddControl( "Slider", {
			["label"] = "DSP Volume",
			["Command"] = "dsp_volume",	
			["Type"] = "float",
			["min"] = "0", 	
			["max"] = "1"
		}	)
		Panel:ControlHelp( "dsp_volume\nSet the volume of DSP effects." )

		Panel:AddControl( "Slider", {
			["label"] = "Player DSP Override",
			["Command"] = "dsp_player",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "29"
		}	)
		Panel:ControlHelp( "dsp_player\nUsed to override the DSP effect on the player. Default of 0." )

		Panel:AddControl( "Slider", {
			["label"] = "Water DSP Override",
			["Command"] = "dsp_water",	
			["Type"] = "int",
			["min"] = "0", 	
			["max"] = "29"
		}	)
		Panel:ControlHelp( "dsp_water\nUsed to override the underwater DSP effects. Default of 14." )

	end )

end )
