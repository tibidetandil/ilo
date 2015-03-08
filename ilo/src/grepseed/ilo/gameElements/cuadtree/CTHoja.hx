package grepseed.ilo.gameElements.cuadtree;

import flash.display.DisplayObjectContainer;
import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.gameElements.GameElement;
import grepseed.ilo.memento.ManagerDeMementos;

class CTHoja extends CuadTree {

	private var _idDibujo: Int;

	public function new(id: Int, finder: Finder, posicion: Point, fuente: FuenteCT) {
		super(posicion, finder);
		fuente.dibujar(graphics, id);
		_idDibujo = id;
	}

	override public function setHijo(id: Int, nuevo: CuadTree) {}

	override public function getHijo(id:Int):CuadTree {
		return null;
	}

	override public function getId(): Int {
		return _idDibujo;
	}

	override public function isHoja(): Bool {
		return true;
	}

	override public function crearNodos(raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {}

	override public function crearNodoHorizontal(vecino: CuadTree, raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {}

	override public function crearNodoVertical(vecino: CuadTree, raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {}

}