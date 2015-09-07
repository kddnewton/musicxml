MusicXML.Part = function(ctx, config) {
	this.measures = config.measure.map(function(measureConfig) {
		return new MusicXML.Measure(ctx, measureConfig);
	});
};

MusicXML.Part.prototype.render = function() {
	var position = new MusicXML.MeasurePosition();

	this.measures.forEach(function(measure) {
		measure.render(position);
		position.incr();
	});
};
