MusicXML.Drawer = function() {
	this.x = 10;
	this.y = 0;
}

MusicXML.Drawer.prototype.buildStave = function() {
	return new Vex.Flow.Stave(this.x, this.y, 200);
};

MusicXML.Drawer.prototype.increment = function() {
	this.x += 200;
	if(this.x == 810) {
		this.x = 10;
		this.y += 120;
	}
};

MusicXML.Drawer.prototype.shouldDrawClef = function() {
	return this.x == 10;
};

MusicXML.Drawer.prototype.width = 200;
