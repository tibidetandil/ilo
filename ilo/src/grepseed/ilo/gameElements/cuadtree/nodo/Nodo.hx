package grepseed.ilo.gameElements.cuadtree.nodo;

import flash.geom.Point;
import grepseed.ilo.gameElements.boton.AccionAgregarMemento;
import grepseed.ilo.gameElements.boton.AccionAnd;
import grepseed.ilo.gameElements.Boton;
import grepseed.ilo.gameElements.boton.AccionNodo;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.gameElements.GameElement;
import grepseed.ilo.ManagerDeNodos;
import grepseed.ilo.memento.ManagerDeMementos;
import motion.Actuate;
import motion.easing.Elastic;

class Nodo extends Boton {

	private var _finders: Array<Finder>;

	public function new(finders: Array<Finder>, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {
		super("images/nodoCuadTree.png", new AccionAnd([new AccionNodo(finders, managerDeNodos), new AccionAgregarMemento(this, managerDeMementos)]));
		_finders = finders;
		var pos: Point = finders[3].getPosicionAbsoluta();
		x = pos.x - getWidth()/2;
		y = pos.y - getHeight()/2;
	}

	//abstract
	private function isDisponible(): Bool {
		return false;
	}

	public function controlarDisponibilidad(tiempoDeAnimacion: Float) {
		var aux: Bool = visible;
		visible = isDisponible();
		if (visible && !aux) {
			var posVieja = _finders[3].getPosicionAbsoluta();
			x = posVieja.x;
			y = posVieja.y;
			posVieja.x -= getWidth() / 2;
			posVieja.y -= getHeight() / 2;
			scaleX = 0;
			scaleY = 0;
			Actuate.tween(this, tiempoDeAnimacion, { scaleX: 1, scaleY: 1, x: posVieja.x, y: posVieja.y}, false).ease(Elastic.easeIn);
		}
	}

}