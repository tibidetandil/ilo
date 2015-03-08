package grepseed.ilo.gameElements.cuadtree.nodo;

import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.memento.ManagerDeMementos;

class NodoCuadTree extends Nodo {

	public function new(finders: Array<Finder>, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {
		super(finders, managerDeNodos, managerDeMementos);
	}

	override private function isDisponible(): Bool {
		return !_finders[0].getCTPadre().isHoja();
	}

}