package grepseed.ilo;

import flash.geom.Point;
import grepseed.ilo.gameElements.Boton;
import grepseed.ilo.gameElements.scroll.Scroll;

class ManagerDeClicks {

	private var _receptores: Array<Boton>;
	private var _ultimaPosicion: Point;
	private var _botonClickeado: Boton;
	private var _clickeando: Bool;
	private var _scroll: Scroll;

	public function new() {
		_receptores = new Array<Boton>();
		_ultimaPosicion = new Point(0, 0);
	}

	private function setUltimaPosicion(posX: Float, posY: Float) {
		_ultimaPosicion.x = posX;
		_ultimaPosicion.y = posY;
	}

	public function setScroll(scroll: Scroll) {
		_scroll = scroll;
	}

	public function agregar(receptor: Boton) {
		_receptores.push(receptor);
	}

	public function clickAbajo(e) {
		var clicked: Bool = false;
		var i: Int = _receptores.length;
		setUltimaPosicion(e.localX, e.localY);
		_clickeando = true;
		while (i > 0 && !clicked) {
			_botonClickeado = _receptores[i - 1];
			clicked = _botonClickeado.checkClick();
			i--;
		}
		if (clicked)
			_botonClickeado.apretar();
		else
			_botonClickeado = null;
	}

	public function clickArriba(e) {
		if (_botonClickeado != null && _botonClickeado.checkClick())
			_botonClickeado.click();
		_scroll.moverHastaElAncla();
		_botonClickeado = null;
		_clickeando = false;
	}

	public function movida(e) {
		if (_clickeando) {
			_scroll.mover(e.localX - _ultimaPosicion.x, e.localY - _ultimaPosicion.y);
			setUltimaPosicion(e.localX, e.localY);
			if (_botonClickeado != null)
				if (_botonClickeado.checkClick())
					_botonClickeado.apretar();
				else
					_botonClickeado.soltar();
		}
	}

}