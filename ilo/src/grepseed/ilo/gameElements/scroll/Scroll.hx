package grepseed.ilo.gameElements.scroll ;

import flash.display.DisplayObject;

class Scroll extends GameElement {

	private static var _MOVIMIENTO_MAX = 90;

	private var _anchoPanel: Float;
	private var _anchoScroll: Float;
	private var _anclas: Array<Float>;
	private var _xInicial: Float;
	private var _xFinal: Float;

	public function new(anchoScroll: Float) {
		super();
		_anchoScroll = anchoScroll;
		_anclas = new Array<Float>();
	}

	private function getAnclaMasCercana(): Float {
		var i: Int = 0;
		var pos: Float = _xInicial - _xFinal;
		while (_anclas[i] < pos && i < _anclas.length-1)
			i++;
		if (i > 0 && _anclas[i] - pos > 0 && _anclas[i] - pos > pos - _anclas[i-1])
			i--;
		return _anclas[i];
	}

	private function aplicarAlpha() {
		var o: DisplayObject;
		for (i in 0 ... numChildren) {
			o = getChildAt(i);
			o.alpha = 1 - Math.min(1, Math.abs((o.width + 2*(x - _xInicial + o.x)) / _anchoScroll - 1));
			o.visible = o.alpha > 0.2;
			if (o.alpha > 0.6)
				o.alpha = 1;
		}
	}

	public function setPosicionInicial() {
		_xInicial = x;
		_xFinal = x;
		_anchoPanel = getWidth();
		moverHastaElAncla();
	}

	public function agregarAncla(ancla: Float) {
		_anclas.push(ancla);
	}

	public function mover(vectorX: Float, vectorY: Float) {
		if (Math.abs(vectorX) < _MOVIMIENTO_MAX)
			_xFinal += vectorX;
	}

	public function moverHastaElAncla() {
		_xFinal = _xInicial - getAnclaMasCercana();
	}

	override public function updateLogic(time: Float) {
		super.updateLogic(time);
//		if (x != _xFinal) {
		aplicarAlpha();
		x = (x + _xFinal) / 2;
//		}
	}

}