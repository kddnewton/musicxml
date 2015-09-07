MusicXML.engrave = function(elemId, config) {
	var element = document.getElementById(elemId);
	var renderer = new Vex.Flow.Renderer(element, Vex.Flow.Renderer.Backends.CANVAS);
	var ctx = renderer.getContext();

	var stave = new Vex.Flow.Stave(10, 0, 500);
	stave.setContext(ctx).draw();

	new MusicXML.Score(ctx, config);
};
