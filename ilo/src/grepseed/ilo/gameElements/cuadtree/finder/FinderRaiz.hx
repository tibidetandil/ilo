package grepseed.ilo.gameElements.cuadtree.finder;

import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;

class FinderRaiz implements Finder {

	private var _ct: CuadTree;

	public function new(ct: CuadTree) {
		_ct = ct;
	}

	public function getCT():CuadTree {
		return _ct;
	}

	public function getCTPadre():CuadTree {
		return null;
	}

	public function getHoja():CuadTree {
		return getCT();
	}

	public function getPosicionAbsoluta(): Point {
		return new Point(_ct.x, _ct.y);
	}

	public function getId(): Int {
		return -1;
	}

}