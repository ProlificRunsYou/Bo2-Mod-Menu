StoreShaders()
{
	self.menu.header = self createRectangle("RIGHT", "RIGHT", 64, -210, 190, 60, (1,1,1),"em_bg_prestige_10",100,0);
	
	self.menu.backroundoutline = self createRectangle("RIGHT","RIGHT",-126,0,2,600,(0, 255, 255),"white",100, 0);
	self.menu.background = self createRectangle("RIGHT","RIGHT",64,0,191,600,(0,0,0),"gradient_center",1, 0);
	self.menu.scroller = self createRectangle("RIGHT","RIGHT",-116,-156,10,10,(0, 255, 255),"ui_scrollbar_arrow_right",150,0);
	self.menu.bar = self createRectangle("RIGHT","RIGHT",63,-156,2,15,(0, 255, 255),"white",20,0);
	
	self.menu.background3 = self createRectangle("RIGHT","RIGHT",-126,0,800,800,(0,0,0),"gradient",100, 0);
	
	self.menu.Shader1 = self createRectangle("RIGHT","RIGHT",64,-168,190,1,(0, 255, 255),"white",100, 0);	
	self.menu.Shader3 = self createRectangle("RIGHT","RIGHT",-115,17,1,371,(0, 255, 255),"scorebar_fadein",100, 0);	
	self.menu.Shader4 = self createRectangle("RIGHT","RIGHT",64,202,190,1,(0, 255, 255),"white",100, 0);
	self.menu.Shader5 = self createRectangle("RIGHT","RIGHT",64,-180,190,1,(0, 255, 255),"white",100, 0);
}

StoreText(menu, title)
{
		colors = self.Private["colors"];
        self.menu.currentmenu = menu;
        string = "";
    self.menu.root destroy();
        self.menu.root = drawText(title, "objective", 1.1, "LEFT", "RIGHT", -74, -174, (1,1,1), 1, 4);
       
    for(i = 0; i < self.menu.menuopt[menu].size; i++)
    { string += self.menu.menuopt[menu][i] + "\n"; }
 
    self.Private["options"] destroy();
        self.Private["options"] = drawText(string, "default", 1.5, "LEFT", "RIGHT", -110, -156, colors["options"], 1, 5);
}

updateScrollbar()
{
    self.menu.scroller MoveOverTime(0.144);
    self.menu.scroller.y = -156 + (self.menu.curs[self.menu.currentmenu] * 18);
    self.menu.bar MoveOverTime(0.144);
    self.menu.bar.y = -156 + (self.menu.curs[self.menu.currentmenu] * 18);
}
 
feed()
{
	self endon("menu_exit");
	self endon( "destroyMenu" );

	while(self.menu.open == false)
	{		
		for(i = 0; i < 4; i++)
		{
			self iPrintln(self.Private["info"][i]);
			wait 5;
		}
	}
}

doSourceHeart()
{

	self endon("menu_exit");
	self endon( "destroyMenu" );
	self endon( "failoverflow" );

	self.Private["title"] destroy();
	self.Private["title2"] destroy();
	self.menu.cmd destroy();
	colors = self.Private["colors"];

    self.menu.cmd = drawText("c:/root/", "objective", 1.2, "LEFT", "RIGHT", -110, -174, (1,1,1), 1, 10);
	self.Private["title"] = drawText("SOURCE","hudbig",3,"LEFT","RIGHT",-102,222,colors["title"],1,100);
	self.Private["title2"] = drawText("ENGINE //","hudbig",1.5,"LEFT","RIGHT",-12,227,colors["title2"],1,100); 

	while(1) {
		self.Private["title"] setCOD7DecodeFX(50, 2000, 1000);
		self.Private["title2"].alpha = 0;
		wait 0.3;
		for(x=0;x<11;x++) {
			scale = 0.1;
			self.Private["title2"].alpha = x * scale;
			wait 0.1;
		}
		wait 0.3;
		for(x=10;x>-1;x--) {
			scale = 0.1;
			self.Private["title2"].alpha = x * scale;
			wait 0.1;
		}
		wait 4.5 - 3.5;
		
		self.Private["title"] setCOD7DecodeFX(50, 2000, 1000);
		
		for(x=0;x<11;x++) {
			scale = 0.1;
			self.Private["title2"].alpha = x * scale;
			wait 0.1;
		}
		wait 0.3;
		for(x=10;x>-1;x--) {
			scale = 0.1;
			self.Private["title2"].alpha = x * scale;
			wait 0.1;
		}
		wait 4.5 - 3.5;
	}
}
