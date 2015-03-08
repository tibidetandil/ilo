package grepseed.ilo.gameElements.scroll;

import grepseed.ilo.gameElements.Boton;
import grepseed.ilo.gameElements.boton.AccionAnd;
import grepseed.ilo.gameElements.boton.AccionCambiarAccionNodo;
import grepseed.ilo.ManagerDeClicks;
import grepseed.ilo.ManagerDeNodos;
import grepseed.ilo.memento.ManagerDeMementos;

class ScrollBotonera extends Scroll {

	private static var _ANCHO: Float = 600;
	private static var _MARGEN: Float = 1.4;
	private static var _ESCALA: Float = 0.8;

	private var _botones: Array<Boton>;

	public function new(managerDeNodos: ManagerDeNodos, managerDeClicks: ManagerDeClicks, managerDeMementos: ManagerDeMementos) {
		super(_ANCHO);
		crearBotones(managerDeNodos, managerDeClicks, managerDeMementos);
	}

	private function crearBotones(managerDeNodos: ManagerDeNodos, managerDeClicks: ManagerDeClicks, managerDeMementos: ManagerDeMementos) {
		_botones = new Array<Boton>();
		var aux: Boton;
		var cantidad: Int = Math.floor(AccionCambiarAccionNodo.GetCantidadDeRotaciones());
		for (id in 0 ... cantidad) {
			aux = new Boton("images/accion" + id + ".png", new AccionCambiarAccionNodo(id, managerDeNodos, managerDeMementos));
			_botones.push(aux);
			managerDeClicks.agregar(aux);
			addChild(aux);
			aux.scaleX = aux.scaleY = _ESCALA;
			aux.x = Math.floor(id/2) * aux.getWidth() * _MARGEN;
			aux.y = id % 2 * aux.getHeight() * _MARGEN;
			if (id % 2 == 0 && id < cantidad-2)
				agregarAncla(aux.x - aux.getWidth());
		}
	}

	public function clickRandom() {
		_botones[Math.floor(Math.random() * _botones.length)].click();
	}

}