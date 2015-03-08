package grepseed.ilo.gameElements.boton;

import grepseed.ilo.ManagerDeNodos;
import grepseed.ilo.memento.ManagerDeMementos;

class AccionCambiarAccionNodo implements AccionDeBoton {

	private static var _ROTACIONES: Array<Array<Int>> = [
		[1],			//00
		[2, 3, 2],		//01
		[2],			//02
		[1, 3, 1],		//03
		[3],			//04
		[1, 2, 1],		//05
		[1, 3, 1, 2],	//06
		[2, 3, 2, 1],	//07
		[1, 2, 1, 3],	//08
		[1, 3, 2, 1],	//09
		[3, 2],			//10
		[1, 2],			//11
		[1, 3],			//12
		[1, 2, 3, 1],	//13
		[2, 3],			//14
		[2, 1],			//15
		[3, 1],			//16
		[1, 3, 2],		//17
		[2, 3, 1],		//18
		[]				//19
	];

	private static var _INVERSAS: Array<Int> = [
		0,				//00
		1,				//01
		2,				//02
		3,				//03
		4,				//04
		5,				//05
		6,				//06
		7,				//07
		8,				//08

		13,				//09
		14,				//10
		15,				//11
		16,				//12
		9,				//13
		10,				//14
		11,				//15
		12,				//16
		18,				//17
		17,				//18
		19				//19
	];

	private var _id: Int;
	private var _managerDeNodos: ManagerDeNodos;
	private var _managerDeMementos: ManagerDeMementos;

	public static function GetCantidadDeRotaciones(): Int {
		return _ROTACIONES.length;
	}

	public function new(id: Int, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {
		_id = id;
		_managerDeNodos = managerDeNodos;
		_managerDeMementos = managerDeMementos;
	}

	public function hacer() {
		_managerDeNodos.setAccion(_id, _ROTACIONES[_id]);
		_managerDeMementos.setProximaAccion(this);
	}

	public function deshacer() {
		var id: Int = _INVERSAS[_id];
		_managerDeNodos.setAccion(id, _ROTACIONES[id]);
	}

}