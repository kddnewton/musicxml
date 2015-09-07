MusicXML.Part = function(ctx, config) {
	this.measures = config.measure.map(function(measureConfig) {
		return new MusicXML.Measure(ctx, measureConfig);
	});
};

MusicXML.Part.prototype.render = function() {
	var drawer = new MusicXML.Drawer();

	this.measures.forEach(function(measure) {
		measure.render(drawer);
		drawer.increment();
	});
};
