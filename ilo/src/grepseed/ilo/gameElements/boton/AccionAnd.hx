package grepseed.ilo.gameElements.boton;

class AccionAnd implements AccionDeBoton {

	private var _acciones: Array<AccionDeBoton>;

	public function new(acciones: Array<AccionDeBoton>) {
		_acciones = acciones;
	}

	public function hacer() {
		for (a in _acciones)
			a.hacer();
	}

}