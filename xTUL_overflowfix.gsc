overflowfix()
{
	level endon("game_ended");
	level endon("host_migration_begin");
	
	level.test = createServerFontString("default", 1);
	level.test setText("xTUL");
	level.test.alpha = 0;
	
	if(getDvar("g_gametype") == "sd")//if gametype is search and destroy
		A = 45; //A = 220;
	else 				  // > change if using rank.gsc
		A = 55; //A = 230;

	for(;;)
	{
		level waittill("textset");

		if(level.result >= A)
		{
			level.test ClearAllTextAfterHudElem();
			level.result = 0;

			foreach(player in level.players)
			{
				if(player.menu.open && player isVerified())
				{
					player.isOverflowing = true;
					player submenu(player.CurMenu, player.CurTitle);
					player.AIO["closeText"] setSafeText("Press [{+smoke}]+[{+melee}] to Open Menu");//make sure to change this if changing self.AIO["closeText"] in hud.gsc
					player.AIO["status"] setSafeText("Status: " + player.status);//make sure to change this if changing self.AIO["status"] in hud.gsc
				}	
				if(!player.menu.open && player isVerified())//gets called if the menu is closed
				{
					player.AIO["closeText"] setSafeText("Press [{+smoke}]+[{+melee}] to Open Menu");//make sure to change this if changing self.AIO["closeText"] in hud.gsc
					player.AIO["status"] setSafeText("Status: " + player.status);//make sure to change this if changing self.AIO["status"] in hud.gsc
				}
			}
		}
	}
}



