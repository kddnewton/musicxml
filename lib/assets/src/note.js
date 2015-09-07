MusicXML.Note = function(config) {
	this.type = config.type;
	this.pitch = config.pitch;
};

MusicXML.Note.prototype.toStaveNote = function() {
	return new Vex.Flow.StaveNote({ keys: [this.compiledPitch()], duration: this.compiledDuration() });
};

MusicXML.Note.prototype.compiledDuration = function() {
	var compiled;

	switch(this.type) {
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

	return compiled;
};

MusicXML.Note.prototype.compiledPitch = function() {
	return this.pitch.step.toLowerCase() + "/" + this.pitch.octave;
};
