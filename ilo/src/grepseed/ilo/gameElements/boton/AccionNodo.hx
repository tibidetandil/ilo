package grepseed.ilo.gameElements.boton;

import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.ManagerDeNodos;

class AccionNodo implements AccionDeBoton {

	private var _finders: Array<Finder>;
	private var _managerDeNodos: ManagerDeNodos;

	public function new(finders: Array<Finder>, managerDeNodos: ManagerDeNodos) {
		_finders = finders;
		_managerDeNodos = managerDeNodos;
	}

	public function hacer() {
		if (!_managerDeNodos.isBloqueado()) {
			var origenes: Array<CuadTree> = new Array<CuadTree>();
			var ids: Array<Int> = new Array<Int>();
			var nivel: Int = 99999;
			for (id in 0 ... 4)
				nivel = Math.floor(Math.min(nivel, _finders[id].getCT().getNivelDeUnion(3 - id)));
			for (id in 0 ... 4) {
				if (nivel == 0) {
					ids.push(_finders[id].getId());
					origenes.push(_finders[id].getCTPadre());
				} else {
					ids.push(3 - id);
					origenes.push(_finders[id].getCT().getPadrePorNivel(3 - id, nivel));
				}
			}
			_managerDeNodos.intercambiarHojas(origenes, ids);
		}
	}

}