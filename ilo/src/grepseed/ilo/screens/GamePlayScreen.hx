package grepseed.ilo.screens;

import flash.display.Sprite;
import flash.geom.Point;
import grepseed.ilo.gameElements.boton.AccionDeshacer;
import grepseed.ilo.gameElements.boton.AccionNula;
import grepseed.ilo.gameElements.Boton;
import grepseed.ilo.gameElements.scroll.ScrollBotonera;
import grepseed.ilo.gameElements.boton.AccionCambiarAccionNodo;
import grepseed.ilo.gameElements.cuadtree.CTRama;
import grepseed.ilo.gameElements.cuadtree.finder.FinderRaiz;
import grepseed.ilo.gameElements.cuadtree.FuenteCT;
import grepseed.ilo.gameElements.GameElement;
import grepseed.ilo.gameElements.Image;
import grepseed.ilo.ManagerDeClicks;
import grepseed.ilo.ManagerDeNodos;
import grepseed.ilo.memento.ManagerDeMementos;
import grepseed.ilo.memento.Memento;
import grepseed.ilo.posiciones.Posiciones1920x1080;

class GamePlayScreen extends Screen {

	private static var _NIVELES: Int = 3;
	private static var _MEZCLAS: Int = 8;

	private var _fondo: GameElement;
	private var _tablero: GameElement;
	private var _scroll: ScrollBotonera;
	private var _botonDeshacer: Boton;
	private var _botonImagenes: Boton;
	private var _accionActual: Image;
	private var _puzzle: CTRama;
	private var _nodos: Sprite;

	public function new(screenManager: ScreenManager, managerDeClicks: ManagerDeClicks) {
		super(screenManager);

		_fondo = new Image("images/fondo.jpg");
		_accionActual = new Image("images/accion0.png");
		Posiciones1920x1080.getInstancia().posicionar("gp_accionSeleccionada", _accionActual);

		var managerDeNodos: ManagerDeNodos = new ManagerDeNodos(managerDeClicks, _accionActual);
		var managerDeMementos: ManagerDeMementos = new ManagerDeMementos(managerDeNodos);

		crearBotonera(managerDeNodos, managerDeClicks, managerDeMementos);
		crearTablero(managerDeNodos, managerDeMementos);
	}

	private function crearBotonera(managerDeNodos: ManagerDeNodos, managerDeClicks: ManagerDeClicks, managerDeMementos: ManagerDeMementos) {
		_botonDeshacer = new Boton("images/botonDeshacer.png", new AccionDeshacer(managerDeMementos));
		Posiciones1920x1080.getInstancia().posicionar("gp_boton_deshacer", _botonDeshacer);
		managerDeClicks.agregar(_botonDeshacer);
		_botonImagenes = new Boton("images/botonImagenes.png", new AccionNula());
		Posiciones1920x1080.getInstancia().posicionar("gp_boton_imagenes", _botonImagenes);
		managerDeClicks.agregar(_botonImagenes);

		_scroll = new ScrollBotonera(managerDeNodos, managerDeClicks, managerDeMementos);
		managerDeClicks.setScroll(_scroll);
		Posiciones1920x1080.getInstancia().posicionar("gp_botonera", _scroll);
		_scroll.setPosicionInicial();
	}

	private function crearTablero(managerDeNodos: ManagerDeNodos, managerDeMementos: ManagerDeMementos) {
		_tablero = new Image("images/tablero.jpg");
		_tablero.x = _tablero.y = (_fondo.getHeight() - _tablero.getHeight()) / 2;
		_nodos = new Sprite();
		var filas: Int = Math.floor(Math.pow(2, _NIVELES));
		var fuente: FuenteCT = new FuenteCT("images/ejemplo.jpg", filas, filas);
		var margen: Float = (_tablero.getHeight() - fuente.getAlto() * filas) / 2 + _tablero.y;

		_puzzle = new CTRama(0, null, Math.floor(Math.pow(filas, 2)), new Point(margen, margen), fuente);
		_puzzle.crearNodos(_nodos, managerDeNodos, managerDeMementos);
		managerDeNodos.mezclar(_MEZCLAS, _scroll);
	}

	override public function init(time: Float) {
		super.init(time);
		addChild(_fondo);
		addChild(_tablero);
		agregarHijoCompleto(_scroll);
		addChild(_botonDeshacer);
		addChild(_botonImagenes);
		addChild(_accionActual);
		addChild(_puzzle);
		addChild(_nodos);
	}

	override public function end(onComplete:Dynamic) {
		removeChild(_fondo);
		removeChild(_tablero);
		borrarHijoCompleto(_scroll);
		removeChild(_botonDeshacer);
		removeChild(_botonImagenes);
		removeChild(_accionActual);
		removeChild(_puzzle);
		removeChild(_nodos);
		super.end(onComplete);
	}

}