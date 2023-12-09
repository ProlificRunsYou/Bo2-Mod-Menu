CreateMenu()
{
	if(self isVerified())
	{
        self add_menu("2983u2's Menu", undefined, "2983u2's Menu", "Verified");
        
        self add_option("2983u2's Menu", "Scripts", ::submenu, "account_sub", "Scripts");
			self add_menu("account_sub", "2983u2's Menu", "Source Scripts", "Verified");
       			self add_option("account_sub", "Test Option", ::testing);
				
		self add_option("2983u2's Menu", "Missile Testing", ::submenu, "sound_sub", "Missile Testing");
        	self add_menu("sound_sub", "2983u2's Menu", "Missile Testing", "Verified");
				self add_option("sound_sub", "Test Option", ::testing);
        
       	self add_option("2983u2's Menu", "Menu Settings", ::submenu, "theme_sub", "Menu Settings");
       		self add_menu("theme_sub", "2983u2's Menu", "Menu Settings", "Verified");
				self add_option("theme_sub", "Change Shader", ::submenu, "shader_options", "Change Shader");
       				self add_menu("shader_options", "theme_sub", "Change Shader", "Verified");
						self add_option("shader_options", "Graffiti", ::changeShader, shader("Graffiti"));
						self add_option("shader_options", "Advanced Warfare", ::changeShader, shader("AdvWarfare"));
						self add_option("shader_options", "Ghosts", ::changeShader, shader("Ghosts"));
						self add_option("shader_options", "Day of Dead", ::changeShader, shader("DayofDead"));
						self add_option("shader_options", "Kawaii", ::changeShader, shader("Kawaii"));
						self add_option("shader_options", "Party Rock", ::changeShader, shader("Party_Rock"));
						self add_option("shader_options", "$100", ::changeShader, shader("Ben"));
						self add_option("shader_options", "Snake", ::changeShader, shader("Snake"));
						self add_option("shader_options", "Zombies", ::changeShader, shader("Zombies"));
						self add_option("shader_options", "Aqua", ::changeShader, shader("Aqua"));
						self add_option("shader_options", "Breach", ::changeShader, shader("Breach"));
						self add_option("shader_options", "Coyote", ::changeShader, shader("Coyote"));
						self add_option("shader_options", "Zulu", ::changeShader, shader("Zulu"));
						self add_option("shader_options", "Massacre", ::changeShader, shader("massacre"));
						self add_option("shader_options", "Pap", ::changeShader, shader("Pap"));
						self add_option("shader_options", "Prestige 9", ::changeShader, shader("Prestige9"));
						self add_option("shader_options", "Prestige 10", ::changeShader, shader("Prestige10"));
						self add_option("shader_options", "Prestige 11", ::changeShader, shader("Prestige11"));
  				self add_option("theme_sub", "Edit Scrollbar Color", ::submenu, "scrollbar_sub", "Scrollbar Color");
       				self add_menu("scrollbar_sub", "theme_sub", "Scrollbar Color", "Verified");
       					self add_option("scrollbar_sub", "Black", ::setLineColor, (0, 0, 0));
				        self add_option("scrollbar_sub", "Cyan", ::setLineColor, (0, 255, 255));
				        self add_option("scrollbar_sub", "Blue", ::setLineColor, (0, 0, 1));
				        self add_option("scrollbar_sub", "Purple", ::setLineColor, (0.502, 0, 0.502));
				        self add_option("scrollbar_sub", "Orange", ::setLineColor, (1, 0.502, 0));
				        self add_option("scrollbar_sub", "Red", ::setLineColor, (1, 0, 0));
				        self add_option("scrollbar_sub", "Yellow", ::setLineColor, (1, 1, 0));
				        self add_option("scrollbar_sub", "Green", ::setLineColor, (0, 1, 0));
				self add_option("theme_sub", "Edit Text Color", ::submenu, "text_sub", "Text Color");
       				self add_menu("text_sub", "theme_sub", "Text Color", "Verified");
       					self add_option("text_sub", "White", ::setTextColor, color("white"));
				        self add_option("text_sub", "Cyan", ::setTextColor, color("cyan"));
				        self add_option("text_sub", "Blue", ::setTextColor, color("blue"));
				        self add_option("text_sub", "Purple", ::setTextColor, color("purple"));
				        self add_option("text_sub", "Orange", ::setTextColor, color("orange"));
				        self add_option("text_sub", "Red", ::setTextColor, color("red"));
				        self add_option("text_sub", "Yellow", ::setTextColor, color("yellow"));
				        self add_option("text_sub", "Green", ::setTextColor, color("green"));
				self add_option("theme_sub", "Edit Title Color", ::submenu, "title_sub", "Title Color");
       				self add_menu("title_sub", "theme_sub", "Title Color", "Verified");
       					self add_option("title_sub", "White", ::setTitleColor, color("white"));
				        self add_option("title_sub", "Cyan", ::setTitleColor, color("cyan"));
				        self add_option("title_sub", "Blue", ::setTitleColor, color("blue"));
				        self add_option("title_sub", "Purple", ::setTitleColor, color("purple"));
				        self add_option("title_sub", "Orange", ::setTitleColor, color("orange"));
				        self add_option("title_sub", "Red", ::setTitleColor, color("red"));
				        self add_option("title_sub", "Yellow", ::setTitleColor, color("yellow"));
				        self add_option("title_sub", "Green", ::setTitleColor, color("green"));				      

		self add_option("2983u2's Menu", "Server Settings", ::submenu, "standard", "Server Settings");
			self add_menu("standard", "2983u2's Menu", "Server Settings", "VIP");
				self add_option("standard", "Spawn 1 Bot", ::spawnBots, 1);
				self add_option("standard", "Spawn 3 Bot", ::spawnBots, 3);
				self add_option("standard", "Spawn 6 Bot", ::spawnBots, 6);
				self add_option("standard", "Fill Lobby", ::spawnBots, 18);
				self add_option("standard", "Kick All Bots", ::kickAllBots);
								
		self add_option("2983u2's Menu", "User Settings", ::submenu, "forge_sub", "User Settings");
			self add_menu("forge_sub", "2983u2's Menu", "User Settings", "Admin");
				self add_option("forge_sub", "God Mode", ::InfiniteHealth);
				self add_option("forge_sub", "QuickMods", ::quickmods);
				self add_option("forge_sub", "UFO Mode", ::dpadleft);
				self add_option("forge_sub", "Teleport", ::doTeleport);
				self add_option("forge_sub", "Infinite Ammo", ::infiniteammo );
				self add_option("forge_sub", "Infinite Equipment", ::infiniteEquipment);
				self add_option("forge_sub", "Scorestreaks", ::give_scorestreaks);
			    self add_option("forge_sub", "Give VSAT", ::givevsat );
			    self add_option("forge_sub", "Constant UAV", ::giveuavandesp );
			    self add_option("forge_sub", "MultiJump", ::multijump );
			    self add_option("forge_sub", "Invisible", ::doinvisible );
			    self add_option("forge_sub", "Fire balls", ::fireballs );
			    self add_option("forge_sub", "Teleport", ::doteleport );
			    self add_option("forge_sub", "All Perks", ::allperks );
			    self add_option("forge_sub", "Change Class", ::changeclass );
			    self add_option("forge_sub", "Third Person (--)", ::thirdperson );
				self add_option("forge_sub", "Suicide", ::suicide_wrapper);
		
		self add_option("2983u2's Menu", "Lobby", ::submenu, "Lobby", "Lobby");
			self add_menu("Lobby", "2983u2's Menu", "Lobby", "Admin");
			    self add_option("Lobby", "Super Jump", ::totosuperjump );
			    self add_option("Lobby", "Super Speed", ::superspeed );
			    self add_option("Lobby", "Gravity", ::gravity );
			    self add_option("Lobby", "RapidFire", ::rapidfire );
			    self add_option("Lobby", "Force Host", ::forcehost );
			    self add_option("Lobby", "Anti-Quit", ::antiquit );
			    self add_option("Lobby", "Spawn A Bot", ::spawnbots, 1 );
			    self add_option("Lobby", "Fast Restart", ::fastrestart );
			    self add_option("Lobby", "Unlimited Game", ::unlimitedgame );
			    self add_option("Lobby", "End Game", ::endgame );
			    self add_option("Lobby", "Fast End", ::FastEnd);
			    self add_option("Lobby", "SkyBase", ::SkyBase);
		
		self add_option("2983u2's Menu", "Trickshot Utilities", ::submenu, "Trickshots", "Trickshot Utilities"); //Trickshot Mods
			self add_menu("Trickshots", "2983u2's Menu", "Admin");
				self add_option("Trickshots", "Canswap", ::dropCanSwap);
				self add_option("Trickshots", "Save & Load", ::saveandload);
				self add_option("Trickshots", "Floater", ::floateronoff);	
			    self add_option( "Trickshots", "Default Teleport", ::dodefaulttele );
			    self add_option( "Trickshots", "Teleport Projectile", ::dotelep );
			    self add_option("Trickshots", "Create Portal", ::createportal );
			    self add_option("Trickshots", "Destroy Portal", ::destroyportal );
			    self add_option( "Trickshots", "Give Camos", ::submenu, "Give Camos", "Give Camos" );
			    self add_menu( "Give Camos", "Trickshots", "Admin" );
				self add_option("Give Camos", "Random Camo", ::CamoChanger);
			    self add_option( "Give Camos", "Ghost Camo", ::givemecamos, 29 );
			    self add_option( "Give Camos", "Aw Camo", ::givemecamos, 45 );
			    self add_option( "Give Camos", "Cyborg Camo", ::givemecamos, 31 );
			    self add_option( "Give Camos", "W115 Camo", ::givemecamos, 43 );
			    self add_option( "Give Camos", "Paladin Camo", ::givemecamos, 30 );
			    self add_option( "Give Camos", "Party Rock Camo", ::givemecamos, 25 );
			    self add_option( "Give Camos", "AfterLife Camo", ::givemecamos, 44 );
			    self add_option( "Give Camos", "Beast Camo", ::givemecamos, 41 );
			    self add_option( "Give Camos", "Dragon Camo", ::givemecamos, 32 );
			    self add_option( "Give Camos", "Gold Camo", ::givemecamos, 15 );
			    self add_option( "Give Camos", "Diamond Camo", ::givemecamos, 16 );
		
		self add_option("2983u2's Menu", "Weapon Settings", ::submenu, "base_sub", "Weapon Settings");
			self add_menu("base_sub", "2983u2's Menu", "Weapon Settings", "Admin");
				self add_option("base_sub", "Test Option", ::testing);
				self add_option("base_sub", "CS:GO Knife", ::givePlayerWeapon, "knife_mp");
				self add_option("base_sub", "IPad", ::givePlayerWeapon, "killstreak_remote_turret_mp");
				self add_option("base_sub", "DSR 50", ::givePlayerWeapon, "dsr50_mp");
				self add_option("base_sub", "Ballista", ::givePlayerWeapon, "ballista_mp");
				self add_option("base_sub", "Ballista", ::givePlayerWeapon, "ballista_mp+fmj");
				self add_option("base_sub", "XPR-50", ::givePlayerWeapon, "as50_mp");
				self add_option("base_sub", "KSG", ::givePlayerWeapon, "ksg_mp");
				self add_option("base_sub", "Knife Ballistic", ::givePlayerWeapon, "knife_ballistic_mp");
				self add_option("base_sub", "Crossbow", ::givePlayerWeapon, "crossbow_mp");
				
        self add_option("2983u2's Menu", "Client Options", ::submenu, "PlayersMenu", "Client Options");
	        self add_menu("PlayersMenu", "2983u2's Menu", "Client Options", "Co-Host");
	        self add_menu("pOpt " + i, "PlayersMenu", "", "Co-Host");
        
        self add_option("2983u2's Menu", "All Clients", ::submenu, "AllPlayers", "All Clients");
	        self add_menu("AllPlayers", "2983u2's Menu", "All Clients", "Co-Host");
		       	self add_option("AllPlayers", "Unverify All", ::changeVerificationAllPlayers, "Unverified");
		        self add_option("AllPlayers", "Verify All", ::changeVerificationAllPlayers, "Verified");
	}
}
 
updatePlayersMenu()
{
		self endon("disconnect");

		clearPlayerMenu();

    	for (i = 0; i < level.players.size; i++)
        {
            player = level.players[i];
            playerName = getPlayerName(player);

          	self add_option("PlayersMenu", playerName, ::submenu, "pOpt " + i, "[" + verificationToColor(player.status) + "^7] " + playerName);
                self add_menu("pOpt " + i, "PlayersMenu", "[" + verificationToColor(player.status) + "^7] " + playerName, "Co-Host");
                
			self add_option("pOpt " + i, "Status", ::submenu, "pOpt " + i + "_3", "[" + verificationToColor(player.status) + "^7] " + playerName);
                self add_menu("pOpt " + i + "_3", "pOpt " + i, "[" + verificationToColor(player.status) + "^7] " + playerName, "Co-Host");
                	self add_option("pOpt " + i + "_3", "Unverify", ::changeVerificationMenu, player, "Unverified");
                	self add_option("pOpt " + i + "_3", "^3Verify", ::changeVerificationMenu, player, "Verified");
                	self add_option("pOpt " + i + "_3", "^4VIP", ::changeVerificationMenu, player, "VIP");
                	self add_option("pOpt " + i + "_3", "^1Admin", ::changeVerificationMenu, player, "Admin");
                	self add_option("pOpt " + i + "_3", "^5Co-Host", ::changeVerificationMenu, player, "Co-Host");
                	self add_option("pOpt " + i + "_3", "Send hate :3", ::displaymessage, "Go fuck yourself!", player);
                
       		self add_option("pOpt " + i, "Options", ::submenu, "pOpt " + i + "_2", "[" + verificationToColor(player.status) + "^7] " + playerName);
				self add_menu("pOpt " + i + "_2", "pOpt " + i, "[" + verificationToColor(player.status) + "^7] " + playerName, "Co-Host");
               		self add_option("pOpt " + i + "_2", "Kick Player", ::kickPlayer, player);
        }
}

clearPlayerMenu()
{

	for(i = 0; i < self.menu.menucount["PlayersMenu"]; i++)
	{
		arrayremovevalue(self.menu.menuopt["PlayersMenu"], self.menu.menuopt["PlayersMenu"][i]);
		arrayremovevalue(self.menu.menufunc["PlayersMenu"], self.menu.menufunc["PlayersMenu"][i]);
		arrayremovevalue(self.menu.menuinput["PlayersMenu"], self.menu.menuinput["PlayersMenu"][i]);
		arrayremovevalue(self.menu.menuinput1["PlayersMenu"], self.menu.menuinput1["PlayersMenu"][i]);
	}
	
	self.menu.menucount["PlayersMenu"] = 0;
	self.menu.curs["PlayersMenu"] = 0;
}

add_menu(Menu, prevmenu, menutitle, status)
{
    self.menu.status[Menu] = status;
    self.menu.getmenu[Menu] = Menu;
    self.menu.scrollerpos[Menu] = 0;
    self.menu.curs[Menu] = 0;
    self.menu.menucount[Menu] = 0;
    self.menu.subtitle[Menu] = menutitle;
    self.menu.previousmenu[Menu] = prevmenu;
}
 
add_option(Menu, Text, Func, arg1, arg2)
{
    Menu = self.menu.getmenu[Menu];
    Num = self.menu.menucount[Menu];
    self.menu.menuopt[Menu][Num] = Text;
    self.menu.menufunc[Menu][Num] = Func;
    self.menu.menuinput[Menu][Num] = arg1;
    self.menu.menuinput1[Menu][Num] = arg2;
    self.menu.menucount[Menu] += 1;
}

openMenu()
{
    self freezeControls(true);
    self enableInvulnerability();
    self setClientUiVisibilityFlag("hud_visible", 0);
    self thread feed();
    
    self SetBlur( 4, 0 );
    if(self isHost())
    setdvar("cg_drawcrosshair", "0");

    self thread doSourceHeart();
    self StoreText(self.CurMenu, self.CurTitle);
    
    if(self.Firstopen)
    {
    	self.Private["options"] setCOD7DecodeFX(20, 500000, 500000);
    }
                             
    self.menu.background.alpha = 0.8;
    self.menu.backroundoutline.alpha = 1;
    self.menu.background3.alpha = 0.87;
    
    self.menu.Shader1.alpha = 1;
	self.menu.Shader3.alpha = 1;	
	self.menu.Shader4.alpha = 1;
	self.menu.Shader5.alpha = 1;

    self.menu.scroller.alpha = 1; 
    self.menu.bar.alpha = 1; 
    
    self.menu.header.alpha = 1;
    self.Private["header"].alpha = 1;

    self updateScrollbar();
    self.menu.open = true;
}
 
closeMenu()
{
	self notify("menu_exit");
	self.Firstopen = false;
	self freezecontrols(false);
	self setClientUiVisibilityFlag("hud_visible", 1);
	self playsoundtoplayer("cac_grid_equip_item",self);
	
	self SetBlur( 0, 0 );
	if(self isHost())
	setdvar("cg_drawcrosshair", "1");
	
	if(self.unicorn == true)
		self disableInvulnerability();

    self.Private["options"].alpha = 0;
    self.Private["title"].alpha = 0;
    self.Private["title2"].alpha = 0;
    self.menu.cmd.alpha = 0;

    self.menu.background.alpha = 0;
    self.menu.backroundoutline.alpha = 0;
    self.menu.background3.alpha = 0;

	self.menu.header.alpha = 0;
    self.Private["header"].alpha = 0;

    self.menu.root.alpha = 0;
    
    self.menu.Shader1.alpha = 0;
	self.menu.Shader3.alpha = 0;	
	self.menu.Shader4.alpha = 0;
	self.menu.Shader5.alpha = 0;
    
    self.menu.scroller.alpha = 0;
    self.menu.bar.alpha = 0; 
    self.menu.open = false;
}
 
giveMenu()
{
    if (self isVerified())
    {
        if (!self.MenuInit)
        {
            self.MenuInit = true;
            self thread MenuInit();
        }
    }
}
 
destroyMenu(player)
{
    player.MenuInit = false;
    closeMenu();
    wait 0.01;
   	if(player.status == "Unverified")
    player unverifyReset();
    player.Private["options"] destroy(); 
    player.menu.background destroy();
    player.menu.backroundoutline destroy();
    player.menu.background3 destroy();
    player.menu.scroller destroy();
    player.menu.bar destroy();
    player.menu.Shader1 destroy();
	player.menu.Shader3 destroy();
	player.menu.Shader4 destroy();
	player.menu.Shader5 destroy();
	player.Private["title"] destroy();
	player.Private["title2"] destroy();
    player.menu.root destroy();
    player.menu.cmd destroy();
    player.menu.header destroy();
    player.Private["header"] destroy();
    player notify("destroyMenu");
}

closeMenuOnVerChange(player)
{
	player thread destroyMenu(player);
	wait 0.05;
    player submenu("2983u2's Menu", "2983u2's Menu");
    player.Private["options"].alpha = 0;
    player.Private["title"].alpha = 0;
    player.Private["title2"].alpha = 0;
    player.menu.root.alpha = 0;
    player.menu.cmd.alpha = 0;
}

submenu(input, title)
{
    if (verificationToNum(self.status) >= verificationToNum(self.menu.status[input]))
    {
            if (input == "2983u2's Menu")
                    self thread StoreText(input, "2983u2's Menu");
            else if (input == "PlayersMenu")
            {
                    self updatePlayersMenu();
                    self thread StoreText(input, "Client Options");
            }
            else
                    self thread StoreText(input, title);
                   
            self.CurMenu = input;
            self.CurTitle = title;
           
            self.menu.scrollerpos[self.CurMenu] = self.menu.curs[self.CurMenu];
            self.menu.curs[input] = self.menu.scrollerpos[input];
           
       		self updateScrollbar();
    }
    else
			if(self isVerified() && self.menu.open == true)
            self iPrintln("Only Players With ^1" + verificationToColor(self.menu.status[input]) + " ^7Can Access This Menu!");
}




