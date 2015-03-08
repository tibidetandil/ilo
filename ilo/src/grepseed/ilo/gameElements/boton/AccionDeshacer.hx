package grepseed.ilo.gameElements.boton;

import grepseed.ilo.memento.ManagerDeMementos;

class AccionDeshacer implements AccionDeBoton {

	private var _managerDeMementos: ManagerDeMementos;

	public function new(managerDeMementos: ManagerDeMementos) {
		_managerDeMementos = managerDeMementos;
	}

	public function hacer() {
		_managerDeMementos.deshacer();
	}

}