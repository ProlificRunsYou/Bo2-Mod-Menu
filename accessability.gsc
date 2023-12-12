
		player thread destroyMenu();
		wait 0.03;
		player.status = verlevel;
		wait 0.01;
		
		if(player.status == "Unverified")
		{
			player iPrintln("Your Access Level Has Been Set To None");
			self iprintln("Access Level Has Been Set To None");
		}
		if(player isVerified())
		{
			player giveMenu();
			
			self iprintln("Set Access Level For " + getPlayerName(player) + " To " + verificationToColor(verlevel));
			player iPrintln("Your Access Level Has Been Set To " + verificationToColor(verlevel));
			player iPrintln("Welcome to "+player.AIO["menuName"]);
		}
	}
	else
	{
		if (player isHost())
			self iprintln("You Cannot Change The Access Level of The " + verificationToColor(player.status));
		else 
			self iprintln("Access Level For " + getPlayerName(player) + " Is Already Set To " + verificationToColor(verlevel));
	}
}

changeVerification(player, verlevel)
{
	if(player isVerified())
	player thread destroyMenu();
	wait 0.03;
	player.status = verlevel;
	wait 0.01;
	
	if(player.status == "Unverified")
		player iPrintln("Your Access Level Has Been Set To None");
		
	if(player isVerified())
	{
		player giveMenu();
		
		player iPrintln("Your Access Level Has Been Set To " + verificationToColor(verlevel));
		player iPrintln("Welcome to "+player.AIO["menuName"]);
	}
}

changeVerificationAllPlayers(verlevel)
{
	self iprintln("Access Level For Unverified Clients Has Been Set To " + verificationToColor(verlevel));
	
	foreach(player in level.players) 
		if(!(player.status == "Host" || player.status == "Co-Host" || player.status == "Admin" || player.status == "VIP")) 
			changeVerification(player, verlevel);
}

getPlayerName(player)
{
    playerName = getSubStr(player.name, 0, player.name.size);
    for(i = 0; i < playerName.size; i++)
    {
		if(playerName[i] == "]")
			break;
    }
    if(playerName.size != i)
		playerName = getSubStr(playerName, i + 1, playerName.size);
		
    return playerName;
}

isVerified()
{
	if(self.status == "Host" || self.status == "Co-Host" || self.status == "Admin" || self.status == "VIP" || self.status == "Verified")
		return true;
	else 
		return false;
}



