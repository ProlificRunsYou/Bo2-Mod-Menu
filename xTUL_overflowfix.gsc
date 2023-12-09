//credits to YouViolateMe
recreateText()
{
	self endon("disconnect");
	self endon("death");

	input = self.CurMenu;
	title = self.CurTitle;
		
	self thread submenu(input, title);
	self thread doSourceHeart();
}

//Credits to dtx12, jwm614, and xTurntUpLobbies
overflowfix()
{  
    level endon("game_ended");
 
    level.test = createServerFontString("default",1.5);
    level.test setText("xTUL"); //dont remove text here                  
    level.test.alpha = 0;
   
    for(;;)
    {      
    	level waittill("textset");//this is needed so for(;;) doesnt keep looping
        if(level.result >= 50)//240 actual strings, do not go higher. (set to 230) or (50 when not using rank.gsc)
        {
        	level.test ClearAllTextAfterHudElem();//prevents overflow
        	level.result = 0;//resets value to 0

			foreach(player in level.players)
        	{
            	if(player.menu.open == true)//while menu is open
            	{
			player notify( "failoverflow" );
            		player recreateText();//recreate the menu text
            	}
            }
        }      
        wait 0.01;    
    }
}
