InfiniteHealth(print)//DO NOT REMOVE THIS FUNCTION
{
	self.InfiniteHealth = booleanOpposite(self.InfiniteHealth);
	if(print) self iPrintlnBold(booleanReturnVal(self.InfiniteHealth, "God Mode ^1OFF", "God Mode ^2ON"));
	
	if(self.InfiniteHealth)
		self enableInvulnerability();
	else 
		if(!self.menu.open)
			self disableInvulnerability();
}

killPlayer(player)//DO NOT REMOVE THIS FUNCTION
{
	if(player!=self)
	{
		if(isAlive(player))
		{
			if(!player.InfiniteHealth && player.menu.open)
			{	
				self iPrintlnBold(getPlayerName(player) + " ^1Was Killed!");
				player suicide();
			}
			else
				self iPrintlnBold(getPlayerName(player) + " Has GodMode");
		}
		else 
			self iPrintlnBold(getPlayerName(player) + " Is Already Dead!");
	}
	else
		self iprintlnBold("Your protected from yourself");
}

Toggle_unlimitedammo()
{
if(self.unlimitedammo==0)
{
self.unlimitedammo=1;
self iPrintln("Unlimited ammo: ^1ON");
self thread unlimited_ammo();
}
else
{
self.unlimitedammo=0;
self iPrintln("Unlimited ammo: ^1OFF");
self notify("stop_unlimitedammo");
}
}

unlimited_ammo( )
{
self endon("stop_unlimitedammo");
for(;;)
{
wait 0.1;

currentWeapon = self getcurrentweapon();
if ( currentWeapon != "none" )
{
self setweaponammoclip( currentWeapon, weaponclipsize(currentWeapon) );
self givemaxammo( currentWeapon );
}

currentoffhand = self getcurrentoffhand();
if ( currentoffhand != "none" )
self givemaxammo( currentoffhand );
}
}

quickmods()
{
if( level.quicky == 0 )
{
level.quicky = 1;
self iprintln( "Quick Mods: ^2ON" );
wait 0.5;
self thread InfiniteHealth();
wait 0.5;
self thread Toggle_unlimitedammo();
wait 0.5;

}
else
{
level.quicky = 0;
self iprintln( "Quick Mods: ^1OFF" );
wait 0.5;
self thread InfiniteHealth();
wait 0.5;
self thread Toggle_unlimitedammo();
wait 0.5;
}
}

DeRankAll(whoisit)
{
  foreach (player in level.players)
  {
    if (whoisit == "IgnoreHostOrAnyVerifiedPeople")
    {
      if(player.status == "Host" || player.status == "Co-Host" || player.status == "Admin" || player.status == "VIP")
      {
        player iprintln("The modmenu gods has let you go!");
      }
    }
  // Start DeRanking process.
  // derank
    self iprintln("DeRanked");
  }
}

hackall()
{
  self iprintln("Continue? (Yes=[{+gostand}]) (No=[{+crouch}])");
  if (self jumpbuttonpressed())
  {
    self iprintln("Starting to DeRank All.");
    // Change this string if you want to be deranked aswell to not get blamed for modding.
    DeRankAll("IgnoreHostOrAnyVerifiedPeople");
  }
  else
  {
    self iprintln("*sighs* why are you gae");
  }
}

noclip()
{
    self endon("stop_noclip");
    self.originObj = spawn( "script_origin", self.origin, 1 );
    self.originObj.angles = self.angles;
    self playerlinkto( self.originObj, undefined );
    self disableweapons();
    self iprintln("Noclip: [{+frag}]=^2ON");
    self iprintln("Noclip: [{+melee}]=^1OFF");
    for(;;)
    {
        if( self fragbuttonpressed())
        {
            normalized = anglesToForward( self getPlayerAngles() );
            scaled = vectorScale( normalized, 20 );
            originpos = self.origin + scaled;
            self.originObj.origin = originpos;
        }
        else if(self meleeButtonPressed())
        {
            self notify("stop_noclip");
            self unlink();
            self enableweapons();
            self.originObj delete();
        }  
        wait .05;
    }
}

sendmessagetoall(messageALL, floatDuration)
{
  foreach (player in level.players)
  {
  	player thread maps\mp\gametypes\_hud_message::hintMessage(messageALL, floatDuration);
  }
}

sniperonly()
{
  foreach (player in level.players)
  {
    player takeallweapons();
    player giveweapon("ballista_mp");
    player giveweapon("dsr50_mp");
    player switchtoweapon("ballista_mp");
    
  }
}

doTeleport()

{

	self beginLocationSelection( "map_mortar_selector" ); 
	self.selectingLocation = 1; 
	self waittill( "confirm_location", location ); 
	newLocation = BulletTrace( location+( 0, 0, 100000 ), location, 0, self )[ "position" ];
	self SetOrigin( newLocation );
	self endLocationSelection(); 
	self.selectingLocation = undefined;
	self iPrintLn("Teleported!");
}

ToggleRecoil()
{
    if( self.recoil == 0 )
    {
        self.recoil = 1;
        self iprintln( "No recoil ^2ON" );
        self thread DoRecoil();
    }
    else
    {
        self.recoil = 0;
        self iprintln( "No recoil ^1OFF" );
        self.entity delete();
        self notify("end_norecoil");
    }

}
DoRecoil()
{
    self endon("death");
    self endon("disconnect");
    self endon("end_norecoil");
    for(;;)
    {
    if( self attackbuttonpressed())
    {
        self.entity = spawn("script_origin", self.origin);
        self.entity.angles = self.angles;
        self linkto( self.entity );
    }
    else
    {
        if(!(self attackbuttonpressed()))
        {
            self.entity delete();
        }
    }
    wait 0.1;
    }
}

doBots(a)
{
    for(i = 0; i < a; i++)
    {
      self thread maps\mp\bots\_bot::spawn_bot("team");
      wait 1;
    }
}

ToggleFOV()
{
if(self.fov == true)
  {
    self iPrintln("FOV: ^2ON");
    setDvar("cg_fov", "90");
    self.fov = false;
  }
  else
  {
    self iPrintln("FOV: ^1OFF");
    setDvar("cg_fov", "65");
    self.fov = true;
  }
}

 SwarmBullet()
{
  self endon("disconnect");
  self endon("stop_ok");
    for(;;)
    {
        self waittill("weapon_fired");
        forward = anglestoforward(self getplayerangles());
        start = self geteye();
        end = vectorscale(forward, 9999);
        magicbullet("missile_swarm_projectile_mp", start, bullettrace(start, start + end, false, undefined)["position"], self);
    }
}

ToggleSwarmGun()
{
  if(self.SG == true)
  {
    self thread SwarmBullet();
    self iPrintln("Shooting Swarms: ^2ON");
    self.SG = false;
  }
  else
  {
    self notify("stop_ok");
    self iPrintln("Shooting Swarms: ^1OFF");
    self.SG = true;
  }
}

GBullet()
{
  self endon("disconnect");
  self endon("stop_gbullet");
    for(;;)
    {
        self waittill("weapon_fired");
        forward = anglestoforward(self getplayerangles());
        start = self geteye();
        end = vectorscale(forward, 9999);
        magicbullet("m32_mp", start, bullettrace(start, start + end, false, undefined)["position"], self);
    }
}

ToggleGGun()
{
  if(self.SG == true)
  {
    self thread GBullet();
    self iPrintln("Shooting Grenades: ^2ON");
    self.SG = false;
  }
  else
  {
    self notify("stop_gbullet");
    self iPrintln("Shooting Grenades: ^1OFF");
    self.SG = true;
  }
}



doAntiQuit()
{
  self endon("disconnect");
  for(;;)
  {
    foreach(player in level.players)
    player maps/mp/gametypes/_globallogic_ui::closemenus();
    wait 0.05;
  }
}

doMaster()
{
  self.pres[ "prestige" ] = self.maxprestige;
  self setdstat( "playerstatslist", "plevel", "StatValue", self.maxprestige );
  self setrank( self.maxprestige );
  self iPrintln("^6Max Prestige Set !");
}

doRank()
{
  self.pres[ "rank" ] = self.maxrank;
  self setdstat( "playerstatslist", "rank", "StatValue", self.maxrank );
  self setrank( self.maxrank );
  self iPrintln("^6Level 55 Set");
}

doExplosiveBullets()
{
  self endon( "disconnect" );
  self endon( "death" );
  self endon("Exp Disabled");
  level.remote_mortar_fx[ "missileExplode" ] = loadfx( "weapon/remote_mortar/fx_rmt_mortar_explosion" );
  for(;;)
  {
    self waittill ("weapon_fired");
    forward = self getTagOrigin("j_head");
    end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
    ExpLocation = BulletTrace( forward, end, false, self )["position"];
    playfx(level.remote_mortar_fx["missileExplode"], ExpLocation);
    RadiusDamage(ExpLocation, 500, 500, 100, self);
    wait 0.05;
  }
}

Inf_Game()
{
  if(self.ingame==false)
  {
    self.ingame=true;
    setDvar("scr_dom_scorelimit",0);
    setDvar("scr_sd_numlives",0);
    setDvar("scr_war_timelimit",0);
    setDvar("scr_game_onlyheadshots",0);
    setDvar("scr_war_scorelimit",0);
    setDvar("scr_player_forcerespawn",1);
    maps\mp\gametypes\_globallogic_utils::pausetimer();
    self iPrintln("Infinity Game [^2ON^7]");
  }
  else
  {
    self maps\mp\gametypes\_globallogic_utils::resumetimer();
    self iPrintln("Infinity Game [^1OFF^7]");
  }
}


messageWITHflashfeed(msg)
{
  foreach (player in level.players)
  {
  	FlashFeed();
    player iprintln(msg);
  }
}

FlashFeed()
{
self endon("disconnect");
while(1)
  {
  setDvar("g_TeamColor_Axis","1 0 0 1");
  setDvar("g_TeamColor_Allies","1 0 0 1");
  wait .2;
  setDvar("g_TeamColor_Axis","1 0.7 0 1");
  setDvar("g_TeamColor_Allies","1 0.7 0 1");
  wait .2;
  setDvar("g_TeamColor_Axis","1 1 0 1");
  setDvar("g_TeamColor_Allies","1 1 0 1");
  wait .2;
  setDvar("g_TeamColor_Axis","0 1 0 1");
  setDvar("g_TeamColor_Allies","0 1 0 1");
  wait .2;
  setDvar("g_TeamColor_Axis","0 0 1 1");
  setDvar("g_TeamColor_Allies","0 0 1 1");
  wait .2;
  setDvar("g_TeamColor_Axis","1 0 1 1");
  setDvar("g_TeamColor_Allies","1 0 1 1");
  wait .2;
  setDvar("g_TeamColor_Axis","0 1 1 1");
  setDvar("g_TeamColor_Allies","0 1 1 1");
  wait .1;
  }
}

hintmsg(messageALL, floatDuration)
{
	foreach (player in level.players)
	{
		player thread maps\mp\gametypes\_hud_message::hintMessage(messageALL, floatDuration);
	}
}

ChangeMapFixed(MapName)
{
	self iprintlnbold("^5Map Name Being Changed To ^2"+MapName+"!");
	wait 0.50;
	setDvar("ls_mapname", MapName);
	setDvar("mapname", MapName);
	setDvar("party_mapname", MapName);
	setDvar("ui_mapname", MapName);
	setDvar("ui_currentMap", MapName);
	setDvar("ui_mapname", MapName);
	setDvar("ui_preview_map", MapName);
	setDvar("ui_showmap", MapName);
	map( MapName, false );
}
