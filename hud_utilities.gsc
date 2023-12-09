drawText(text, font, fontScale, align, relative, x, y, color, alpha, sort)
{
	hud = self createFontString(font, fontScale);
    hud setPoint( align, relative, x, y );
    hud.color = color;
    hud.alpha = alpha;
    hud.hideWhenInMenu = true;
    hud.sort = sort;
    
    level.result += 1;
    hud setText(text);
    level notify("textset");
    
    return hud;
}

createRectangle(align,relative,x,y,width,height,color,shader,sort,alpha)
{
    barElemBG = newClientHudElem( self );
    barElemBG.elemType = "bar";
    barElemBG.width = width;
    barElemBG.height = height;
    barElemBG.align = align;
    barElemBG.relative = relative;
    barElemBG.xOffset = 0;
    barElemBG.yOffset = 0;
    barElemBG.children = [];
    barElemBG.sort = sort;
    barElemBG.color = color;
    barElemBG.alpha = alpha;
    barElemBG setParent( level.uiParent );
    barElemBG setShader( shader, width , height );
    barElemBG.hidden = false;
    barElemBG setPoint(align,relative,x,y);
    return barElemBG;
}

setLineColor(color)
{
    self.menu.scroller FadeOverTime(0.2);
    self.menu.bar FadeOverTime(0.2);
    self.menu.scroller.color = color;
    self.menu.bar.color = color; 
}

setTextColor(color)
{
	setColor("options", color);
	self.Private["options"] FadeOverTime(0.2);
	self.Private["options"].color = color;
}

setTitleColor(color)
{
	setColor("title", color);
	self.Private["title"] FadeOverTime(0.2);
	self.Private["title"].color = color;
	setColor("title2", color);
	self.Private["title2"] FadeOverTime(0.2);
	self.Private["title2"].color = color;
}

addColor(name, rgb)
{
	level.Private["colors"][name] = rgb;
}

color(name)
{
	return level.Private["colors"][name];
}

setColor(elem, color)
{
	self.Private["colors"][elem] = color;
}

//Shaders
addShader(name, shaderName)
{
	level.Private["shaders"][name] = shaderName;
}

shader(name)
{
	return level.Private["shaders"][name];
}

setShader(elem, shader)
{
	self.Private["shaders"][elem] = shader;
}

changeShader(shader)
{
	self.menu.header destroy();
	self.Private["header"] destroy();
	setShader("header", shader);
	self.Private["header"].shader = shader;
	shaders = self.Private["shaders"];
	self.Private["header"] = self createRectangle("RIGHT", "RIGHT", 64, -210, 190, 60, (1,1,1),shaders["header"],3,1);
}
