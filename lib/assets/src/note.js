MusicXML.Note = function(config) {
	this.config = config;
};

MusicXML.Note.prototype.toStaveNote = function() {
	var staveNote = new Vex.Flow.StaveNote({
		keys: [this.compiledPitch()],
		duration: this.compiledDuration()
	});
	if(this.config.dot) {
		staveNote.addDotToAll();
	}
	return staveNote;
};

MusicXML.Note.prototype.compiledDuration = function() {
	var compiled;

	switch(this.config.type) {
	case "whole":
		compiled = "w";
		break;
	case "half":
		compiled = "h";
		break;
	case "quarter":
		compiled = "q";
		break;
	case "eighth":
		compiled = "8";
		break;
	case "16th":
		compiled = "16";
		break;
	}

	if(this.config.dot) {
		compiled += "d";
	}

	return compiled;
};

MusicXML.Note.prototype.compiledPitch = function() {
	return this.config.pitch.step.toLowerCase() + "/" + this.config.pitch.octave;
};
