MusicXML.Measure = function(ctx, config) {
	this.ctx = ctx;
	this.notes = config.note.map(function(noteConfig) {
		return new MusicXML.Note(noteConfig);
	});
};

MusicXML.Measure.prototype.render = function(position) {
	var stave = new Vex.Flow.Stave(position.x, position.y, 200);
	stave.setContext(this.ctx).draw();

	var staveNotes = this.notes.map(function(note) {
		return note.toStaveNote();
	});

	Vex.Flow.Formatter.FormatAndDraw(this.ctx, stave, staveNotes);
};
