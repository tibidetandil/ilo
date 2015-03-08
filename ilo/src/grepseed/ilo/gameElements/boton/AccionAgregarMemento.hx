package grepseed.ilo.gameElements.boton;

import grepseed.ilo.memento.ManagerDeMementos;

class AccionAgregarMemento implements AccionDeBoton {

	private var _boton: Boton;
	private var _managerDeMementos: ManagerDeMementos;

	public function new(boton: Boton, managerDeMementos: ManagerDeMementos) {
		_boton = boton;
		_managerDeMementos = managerDeMementos;
	}

	public function hacer() {
		_managerDeMementos.hacer(_boton);
	}

}