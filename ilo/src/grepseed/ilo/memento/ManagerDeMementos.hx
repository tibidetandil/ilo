package grepseed.ilo.memento;

import grepseed.ilo.gameElements.boton.AccionCambiarAccionNodo;
import grepseed.ilo.gameElements.Boton;
import grepseed.ilo.ManagerDeNodos;

class ManagerDeMementos {

	private var _memento: Memento;
	private var _managerDeNodos: ManagerDeNodos;
	private var _proximaAccion: AccionCambiarAccionNodo;

	public function new(managerDeNodos: ManagerDeNodos) {
		_memento = new MementoNulo();
		_managerDeNodos = managerDeNodos;
	}

	public function setProximaAccion(accion: AccionCambiarAccionNodo) {
		_proximaAccion = accion;
	}

	public function hacer(boton: Boton) {
		_memento = new MementoConcreto(_memento, _proximaAccion, boton);
	}

	public function deshacer() {
		if (!_managerDeNodos.isBloqueado()) {
			_memento.deshacer();
			_memento = _memento.getAnterior().getAnterior();
		}
	}

}