MusicXML.Measure = function(ctx, config) {
	this.ctx = ctx;
	this.notes = config.note.map(function(noteConfig) {
		return new MusicXML.Note(noteConfig);
	});
};

MusicXML.Measure.prototype.render = function(drawer) {
	var stave = drawer.buildStave();
	if(drawer.shouldDrawClef()) {
		stave.addClef("alto");
	}
	stave.setContext(this.ctx).draw();

	var staveNotes = this.notes.map(function(note) {
		return note.toStaveNote();
	});

	var voice = new Vex.Flow.Voice({
		num_beats: 6,
		beat_value: 8,
		resolution: Vex.Flow.RESOLUTION
	});
	voice.addTickables(staveNotes);

	var formatter = new Vex.Flow.Formatter().joinVoices([voice]).formatToStave([voice], stave);
	voice.draw(this.ctx, stave);
};
