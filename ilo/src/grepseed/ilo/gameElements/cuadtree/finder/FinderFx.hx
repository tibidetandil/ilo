package grepseed.ilo.gameElements.cuadtree.finder;

import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;

class FinderFx implements Finder {

	private var _finderPadre: Finder;
	private var _id: Int;

	public function new(finderPadre: Finder, id: Int) {
		_finderPadre = finderPadre;
		_id = id;
	}

	public function getCT(): CuadTree {
		return getCTPadre().getHijo(_id);
	}

	public function getCTPadre(): CuadTree {
		return _finderPadre.getCT();
	}

	public function getHoja(): CuadTree {
		if (getCTPadre().isHoja())
			return _finderPadre.getHoja();
		return getCT();
	}

	public function getPosicionAbsoluta(): Point {
		var resultado: Point = _finderPadre.getPosicionAbsoluta();
		var ct: CuadTree = getCT();
		resultado.x += ct.x;
		resultado.y += ct.y;
		return resultado;
	}

	public function getId(): Int {
		return _id;
	}

}