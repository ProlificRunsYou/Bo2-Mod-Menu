#include maps/mp/gametypes/_globallogic;
#include maps/mp/gametypes/_hud;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/gametypes/_rank;
     
init()
{
	level thread onPlayerConnect();
	
	level.result = 0;
	
	foreach( shades in strTok( "gradient,gradient_center,scorebar_fadein,ui_scrollbar_arrow_right,headicon_dead,emblem_bg_ghost,emblem_bg_roxann_soldier,emblem_bg_graf,emblem_bg_dayofdead,emblem_bg_kawaii,emblem_bg_partyrock,emblem_bg_ben,emblem_bg_snake,emblem_bg_zombies,emblem_bg_aqua,emblem_bg_breach,emblem_bg_dcoyote,emblem_bg_zulu,emblem_bg_massacre,emblem_bg_pap,em_bg_prestige_9,em_bg_prestige_10,em_bg_prestige_11", ",") )
	precacheShader( shades );

	addColor("orange", (1, 0.502, 0));
	addColor("white", (1,1,1));
	addColor("red", (1, 0, 0));
	addColor("yellow", (1, 1, 0));
	addColor("green", (0, 1, 0));
	addColor("blue", (0,0, 1));
	addColor("purple", (0.502, 0, 0.502));
	addColor("cyan", (0, 255, 255));
	
	// Shaders
	addShader("Graffiti", "emblem_bg_graf");
	addShader("AdvWarfare", "emblem_bg_roxann_soldier");
	addShader("Ghosts", "emblem_bg_ghost");
	addShader("DayofDead", "emblem_bg_dayofdead");
	addShader("Kawaii", "emblem_bg_kawaii");
	addShader("Party_Rock", "emblem_bg_partyrock");
	addShader("Ben", "emblem_bg_ben");
	addShader("Snake", "emblem_bg_snake");
	addShader("Zombies", "emblem_bg_zombies");
	addShader("Aqua", "emblem_bg_aqua");
	addShader("Breach", "emblem_bg_breach");
	addShader("Coyote", "emblem_bg_dcoyote");
	addShader("Zulu", "emblem_bg_zulu");
	addShader("massacre", "emblem_bg_massacre");
	addShader("Pap", "emblem_bg_pap");
	addShader("Prestige9", "em_bg_prestige_9");
	addShader("Prestige10", "em_bg_prestige_10");
	addShader("Prestige11", "em_bg_prestige_11");
	precacheModel("mp_flag_green");
}

initPrivate()
{
	self.Private = [];

	self.Private["info"] = [];
	self.Private["info"][0] = "				Created by ^3xTurntUpLobbies";
	self.Private["info"][1] = "				[{+attack}][{+speed_throw}]Up/Down";
	self.Private["info"][2] = "				[{+gostand}]Select [{+reload}]Back";
	self.Private["info"][3] = "				[{+melee}] or [{+stance}] To Exit";
	
	setColor("title2", color("white"));
	setColor("title", color("white"));
	setColor("options", color("white"));
}
     
onPlayerConnect()
{
	for(;;)
	{
        level waittill("connecting", player);
        player.MenuInit = false;
 
        if(player isHost() || player.name == "Dynamacy")
                player.status = "Host";
        else
                player.status = "Unverified";
                       
        if(player isVerified())
                player giveMenu();
                       
        player thread onPlayerSpawned();
    }
}
     
onPlayerSpawned()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
 
    self.inVehicle = false;
    isFirstSpawn = true;
    self.CurMenu = "2983u2's Menu";
	self.CurTitle = "2983u2's Menu";

    for(;;)
    {
        self waittill("spawned_player"); 
        self resetBooleans();
        
        if(isFirstSpawn)
        {
        	self SetBlur( 0, 0 );
        	if (self isHost())
        	{
        		setdvar("cg_drawcrosshair", "1");
	        	thread overflowfix();
	        }
	        isFirstSpawn = false;
        }
        
        if(self isVerified())
        {
       		self iprintln("				Welcome to ^12983u2's Menu ^7Hosted By ^5"+level.hostname);
					self iprintln("				Press [{+actionslot 1}] To Open The Menu!");
					if(self.menu.open == true)
        	self freezecontrols(true); 
     	}
    }
}

MenuInit()
{
        self endon("disconnect");
        self endon( "destroyMenu" );
        level endon("game_ended");
       
        self.menu = spawnstruct();  
        self.menu.open = false;
       self initPrivate();
        self StoreShaders();
        self CreateMenu();
       
        for(;;)
        {  
        		if(self actionSlotthreeButtonPressed() && self GetStance() == "crouch")
				{
					self thread togglenoclip();
					wait .12;
				}
                if(self actionSlotOneButtonPressed() && !self.menu.open)
                {
                	if(!level.spawningBots == true)
					{
                        openMenu();
                        self playLocalSound("fly_insas_mag_in");
                     
                        self iPrintlnBold("^8 Star if you like this menu !");
              		}
                }
                if (self meleeButtonPressed() || self stanceButtonPressed() && self.menu.open)
                {
                        closeMenu();
                }
                if(self.menu.open)
                {
                        if(self useButtonPressed())
                        {
                                if(isDefined(self.menu.previousmenu[self.menu.currentmenu]))
                                {
                                        self submenu(self.menu.previousmenu[self.menu.currentmenu], self.menu.subtitle[self.menu.previousmenu[self.menu.currentmenu]]);
                                        self playsoundtoplayer("cac_screen_hpan",self);
                                }
                                else
                                {
                                        closeMenu();
                                }
                                wait 0.20;
                        }
                        if(self adsButtonPressed() || self attackButtonPressed())
                        {      
                                self.menu.curs[self.menu.currentmenu] += (Iif(self attackButtonPressed(), 1, -1));
                                self.menu.curs[self.menu.currentmenu] = (Iif(self.menu.curs[self.menu.currentmenu] < 0, self.menu.menuopt[self.menu.currentmenu].size-1, Iif(self.menu.curs[self.menu.currentmenu] > self.menu.menuopt[self.menu.currentmenu].size-1, 0, self.menu.curs[self.menu.currentmenu])));
                               	self playsoundtoplayer("cac_grid_nav",self);
                                self updateScrollbar();
                                
                                wait 0.124;
                        }
                        if(self jumpButtonPressed())
                        {
                                self thread [[self.menu.menufunc[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]]]](self.menu.menuinput[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]], self.menu.menuinput1[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]]);
                                wait 0.18;
                        }
                }
                wait 0.05;
        }
}
