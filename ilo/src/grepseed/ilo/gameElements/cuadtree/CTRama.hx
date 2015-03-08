package grepseed.ilo.gameElements.cuadtree;

import flash.display.DisplayObjectContainer;
import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.gameElements.cuadtree.finder.FinderFx;
import grepseed.ilo.gameElements.cuadtree.generador.GeneradorDeCuadTree;
import grepseed.ilo.gameElements.cuadtree.generador.GeneradorDeHoja;
import grepseed.ilo.gameElements.cuadtree.generador.GeneradorDeRama;
import grepseed.ilo.gameElements.cuadtree.nodo.Nodo;
import grepseed.ilo.gameElements.cuadtree.nodo.NodoCuadTree;
import grepseed.ilo.gameElements.cuadtree.nodo.NodoExtra;
import grepseed.ilo.gameElements.GameElement;
import grepseed.ilo.ManagerDeClicks;
import grepseed.ilo.ManagerDeNodos;
import grepseed.ilo.memento.ManagerDeMementos;

class CTRama extends CuadTree {

	private var _hijos: Array<CuadTree>;

	public function new(primerId: Int, finder: Finder, cantHojas: Int, posicion: Point, fuente: FuenteCT) {
		super(posicion, finder);
		_hijos = new Array<CuadTree>();
		crearHijos(primerId, Math.round(cantHojas / 4), fuente);
	}

	private function crearHijos(primerId: Int, cantHojas: Int, fuente: FuenteCT) {
		var generador: GeneradorDeCuadTree;
		if (cantHojas == 1)
			generador = new GeneradorDeHoja();
		else
			generador = new GeneradorDeRama();
		for (id in 0 ... 4) {
			var aux: CuadTree = generador.generar(
				id * cantHojas + primerId,
				cantHojas,
				new Point(
					id % 2 * fuente.getAncho() * Math.sqrt(cantHojas),
					Math.floor(id / 2) * fuente.getAlto() * Math.sqrt(cantHojas)),
				new FinderFx(getFinder(), id),
				fuente
				);
			_hijos.push(aux);
			addChild(aux);
		}
	}

	override public function setHijo(id: Int, nuevo: CuadTree) {
		_hijos[id] = nuevo;
	}

	override public function getHijo(id: Int):CuadTree {
		return _hijos[id];
	}

	override public function getId(): Int {
		return getHijo(0).getId();
	}

	override public function isHoja(): Bool {
		var dif: Int = getHijo(1).getId() - getHijo(0).getId();
		return
			getHijo(0).isHoja() &&
			getHijo(1).isHoja() &&
			getHijo(2).isHoja() &&
			getHijo(3).isHoja() &&
			(getHijo(0).getId()/dif) % 4 == 0 &&
			getHijo(2).getId() - getHijo(1).getId() == dif &&
			getHijo(3).getId() - getHijo(2).getId() == dif;
	}

	override public function crearNodos(raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {
		var finders: Array<Finder> = new Array<Finder>();
		for (id in 0 ... 4)
			finders.push(getHijo(id).getFinder());
		var nodo: Nodo = new NodoCuadTree(finders, managerDeNodos, managerDeMementos);
		managerDeNodos.agregar(nodo);
		raiz.addChild(nodo);
		for (id in 0 ... 4)
			_hijos[id].crearNodos(raiz, managerDeNodos, managerDeMementos);
		_hijos[0].crearNodoHorizontal(_hijos[1], raiz, managerDeNodos, managerDeMementos);
		_hijos[2].crearNodoHorizontal(_hijos[3], raiz, managerDeNodos, managerDeMementos);
		_hijos[0].crearNodoVertical(_hijos[2], raiz, managerDeNodos, managerDeMementos);
		_hijos[1].crearNodoVertical(_hijos[3], raiz, managerDeNodos, managerDeMementos);
	}

	override public function crearNodoHorizontal(vecino: CuadTree, raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {
		var finders: Array<Finder> = new Array<Finder>();
		finders.push(getHijo(1).getFinder());
		finders.push(vecino.getHijo(0).getFinder());
		finders.push(getHijo(3).getFinder());
		finders.push(vecino.getHijo(2).getFinder());
		var nodo: Nodo = new NodoExtra(finders, managerDeNodos, managerDeMementos);
		managerDeNodos.agregar(nodo);
		raiz.addChild(nodo);
		_hijos[1].crearNodoHorizontal(vecino.getHijo(0), raiz, managerDeNodos, managerDeMementos);
		_hijos[3].crearNodoHorizontal(vecino.getHijo(2), raiz, managerDeNodos, managerDeMementos);
	}

	override public function crearNodoVertical(vecino: CuadTree, raiz: DisplayObjectContainer, managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {
		var finders: Array<Finder> = new Array<Finder>();
		finders.push(getHijo(2).getFinder());
		finders.push(getHijo(3).getFinder());
		finders.push(vecino.getHijo(0).getFinder());
		finders.push(vecino.getHijo(1).getFinder());
		var nodo: Nodo = new NodoExtra(finders, managerDeNodos, managerDeMementos);
		managerDeNodos.agregar(nodo);
		raiz.addChild(nodo);
		_hijos[2].crearNodoVertical(vecino.getHijo(0), raiz, managerDeNodos, managerDeMementos);
		_hijos[3].crearNodoVertical(vecino.getHijo(1), raiz, managerDeNodos, managerDeMementos);
	}

	override public function intercambiar(idOrigen: Int, destino: CuadTree, idDestino: Int) {
		super.intercambiar(idOrigen, destino, idDestino);

		var h = getHijo(idOrigen);
		setHijo(idOrigen, destino.getHijo(idDestino));
		destino.setHijo(idDestino, h);
	}

}