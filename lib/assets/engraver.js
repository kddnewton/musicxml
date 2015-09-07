window.Engraver = function(elemId, configuration) {
	this.element = document.getElementById(elemId);

	var renderer = new Vex.Flow.Renderer(this.element, Vex.Flow.Renderer.Backends.CANVAS);
	var ctx = renderer.getContext();
	var stave = new Vex.Flow.Stave(10, 0, 500);
	stave.addClef("treble").setContext(ctx).draw();
};
