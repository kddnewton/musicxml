MusicXML.Score = function(ctx, config) {
	this.parts = config.scorePartwise.part.map(function(partConfig) {
		return new MusicXML.Part(ctx, partConfig);
	});
};

MusicXML.Score.prototype.render = function() {
	this.parts.forEach(function(part) {
		part.render();
	});
};
