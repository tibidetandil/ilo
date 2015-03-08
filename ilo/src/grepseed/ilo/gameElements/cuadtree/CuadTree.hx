package grepseed.ilo.gameElements.cuadtree;

import flash.display.DisplayObjectContainer;
import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.gameElements.cuadtree.finder.FinderRaiz;
import grepseed.ilo.gameElements.GameElement;
import grepseed.ilo.memento.ManagerDeMementos;

class CuadTree extends GameElement {

	private var _finder: Finder;

	public function new(posicion: Point, finder: Finder) {
		super();
		if (finder == null)
			finder = new FinderRaiz(this);
		_finder = finder;
		x = posicion.x;
		y = posicion.y;
	}

	private function swapPosiciones(vecino: CuadTree) {
		var pos: Point = new Point(x, y);
		x = vecino.x;
		y = vecino.y;
		vecino.x = pos.x;
		vecino.y = pos.y;
	}

	private function swapHijos(vecino: CuadTree, hijoPropio: CuadTree, hijoAjeno: CuadTree) {
		removeChild(hijoPropio);
		vecino.removeChild(hijoAjeno);
		addChild(hijoAjeno);
		vecino.addChild(hijoPropio);
	}

	private function swapFinders(vecino: CuadTree) {
		var f: Finder = _finder;
		_finder = vecino._finder;
		vecino._finder = f;
		if (getHijo(0) != null)
			for (id in 0 ... 4)
				getHijo(id).swapFinders(vecino.getHijo(id));
	}

	//abstract
	public function setHijo(id: Int, nuevo: CuadTree) {}

	//abstract
	public function getHijo(id: Int): CuadTree {
		return null;
	}

	//abstract
	public function getId(): Int {
		return -1;
	}

	//abstract
	public function isHoja(): Bool {
		return true;
	}

	//abstract
	public function crearNodos(raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {}

	//abstract
	public function crearNodoHorizontal(vecino: CuadTree, raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {}

	//abstract
	public function crearNodoVertical(vecino: CuadTree, raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {}

	public function getFinder(): Finder {
		return _finder;
	}

	public function getNivelDeUnion(id: Int): Int {
		if (isHoja())
			return 0;
		return getHijo(id).getNivelDeUnion(id) + 1;
	}

	public function getPadrePorNivel(id: Int, nivel: Int): CuadTree {
		if (nivel == 1)
			return this;
		return getHijo(id).getPadrePorNivel(id, nivel-1);
	}

	public function intercambiar(idOrigen: Int, destino: CuadTree, idDestino: Int) {
		var p0: CuadTree = this;
		var p1: CuadTree = destino;
		var h0: CuadTree = p0.getHijo(idOrigen);
		var h1: CuadTree = p1.getHijo(idDestino);

		h0.swapPosiciones(h1);
		p0.swapHijos(p1, h0, h1);
		h0.swapFinders(h1);
	}

}