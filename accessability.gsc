verificationToNum(status)
{
    if (status == "Host")
            return 5;
    if (status == "Co-Host")
            return 4;
    if (status == "Admin")
            return 3;
    if (status == "VIP")
            return 2;
    if (status == "Verified")
            return 1;
    else
            return 0;
}
 
verificationToColor(status)
{
    if (status == "Host")
            return "^2Host";
    if (status == "Co-Host")
            return "^5Co-Host";
    if (status == "Admin")
            return "^1Admin";
    if (status == "VIP")
            return "^4VIP";
    if (status == "Verified")
            return "^3Verified";
    if (status == "Unverified")
            return "None";
    else
            return "^1Unknown";
}
 
changeVerificationMenu(player, verlevel)
{
    if (player.status != verlevel && !player isHost())
    {      
        player closeMenuOnVerChange(player);
        player notify("statusChanged");
        player.status = verlevel;
        wait 0.05;
        player giveMenu();

        if(player.status == "Unverified")
		{
	        player thread destroyMenu(player);
			player iPrintln("Your Access Level Has Been Set To None");
		}
       
		if(player isVerified())
		{
	        self iPrintln("Set Access Level For " + getPlayerName(player) + " To " + verificationToColor(verlevel));
	        player iPrintln("Your Access Level Has Been Set To " + verificationToColor(verlevel));
	        player iprintln("Welcome to ^1Source Engine ^7Hosted By ^5"+level.hostname);
			player iprintln("Press [{+actionslot 1}] To Open The Menu!");
		}
    }
    else
    {
        if (player isHost())
                self iPrintln("You Cannot Change The Access Level of The " + verificationToColor(player.status));
        else
                self iPrintln("Access Level For " + getPlayerName(player) + " Is Already Set To " + verificationToColor(verlevel));
	}
}
 
changeVerification(player, verlevel)
{      
        player closeMenuOnVerChange(player);
        player notify("statusChanged");
        player.status = verlevel;
        wait 0.05;
        player giveMenu();
 
        if(player.status == "Unverified")
		{
         	player thread destroyMenu(player);
			player iPrintln("Your Access Level Has Been Set To None");
		}
                
		if(player isVerified())
		{
			player iPrintln("Your Access Level Has Been Set To " + verificationToColor(verlevel));
			player iprintln("Welcome to ^1Source Engine  ^7Hosted By ^5"+level.hostname);
			player iprintln("Press [{+actionslot 1}] To Open The Menu!");
		}
}
 
changeVerificationAllPlayers(verlevel)
{
        self iPrintln("Access Level For All Players Has Been Set To " + verificationToColor(verlevel));
        foreach(player in level.players)
        {
               	if (player isHost() || player.status == "VIP" || player.status == "Admin" || player.status == "Co-Host")
                {
                }
                else
                	changeVerification(player, verlevel);
        }
}
 
getPlayerName(player)
{
        playerName = getSubStr(player.name, 0, player.name.size);
        for(i=0; i < playerName.size; i++)
        {
                if(playerName[i] == "]")
                        break;
        }
        if(playerName.size != i)
                playerName = getSubStr(playerName, i + 1, playerName.size);
        return playerName;
}

unverifyReset()
{
        self.health = 1;
        self.maxhealth = 100;
}

isVerified()
{
	if (self.status == "Host" || self.status == "Verified" || self.status == "VIP" || self.status == "Admin" || self.status == "Co-Host")
	{
		return true;
	}
	else
	{
		return false;
	}
}
