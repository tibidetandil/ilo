package grepseed.ilo.gameElements ;

import grepseed.ilo.gameElements.boton.AccionDeBoton;

class Boton extends Image {

	private var _accion: AccionDeBoton;

	public function new(path: String, accion: AccionDeBoton) {
		super(path);
		_accion = accion;
	}

	public function checkClick(): Bool {
		if (visible && isTouched()) {
			return true;
		}
		return false;
	}

	public function apretar() {
		alpha = 0.5;
	}

	public function soltar() {
		alpha = 1;
	}

	public function click() {
		_accion.hacer();
		soltar();
	}

}