MusicXML.MeasurePosition = function() {
	this.x = 10;
	this.y = 0;
}

MusicXML.MeasurePosition.prototype.incr = function() {
	this.x += 200;
	if(this.x == 810) {
		this.x = 10;
		this.y += 120;
	}
};
