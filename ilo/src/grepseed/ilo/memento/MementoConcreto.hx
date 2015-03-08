package grepseed.ilo.memento;

import grepseed.ilo.gameElements.boton.AccionCambiarAccionNodo;
import grepseed.ilo.gameElements.Boton;

class MementoConcreto implements Memento {

	private var _anterior: Memento;
	private var _accion: AccionCambiarAccionNodo;
	private var _boton: Boton;

	public function new(anterior: Memento, accion: AccionCambiarAccionNodo, boton: Boton) {
		_anterior = anterior;
		_accion = accion;
		_boton = boton;
	}

	public function deshacer() {
		_accion.deshacer();
		_boton.click();
	}

	public function getAnterior(): Memento {
		return _anterior;
	}

}