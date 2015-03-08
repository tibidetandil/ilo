package grepseed.ilo;

import flash.display.Sprite;
import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;
import grepseed.ilo.gameElements.cuadtree.nodo.Nodo;
import grepseed.ilo.gameElements.Image;
import grepseed.ilo.gameElements.scroll.ScrollBotonera;
import motion.Actuate;
import motion.easing.Elastic;

class ManagerDeNodos {

	private static var _TIEMPO_DE_ANIMACION: Float = 0.9;

	private var _usos: Int;
	private var _nodos: Array<Nodo>;
	private var _imagenPreview: Image;
	private var _destinosDeAccion: Array<Int>;
	private var _clickManager: ManagerDeClicks;

	public function new(clickManager: ManagerDeClicks, imagenPreview: Image) {
		_usos = 0;
		_nodos = new Array<Nodo>();
		_destinosDeAccion = new Array<Int>();
		_clickManager = clickManager;
		_imagenPreview = imagenPreview;
	}

	private function animar(padres: Array<CuadTree>, ids: Array<Int>, posOrigen: Array<Point>, posDestino: Array<Point>) {
		var objetivo: Sprite;
		var posVieja: Point;
		_usos += 4;
		for (id in 0 ... 4) {
			objetivo = padres[id].getHijo(ids[id]);
			posVieja = new Point(objetivo.x, objetivo.y);
			objetivo.x += posDestino[id].x - posOrigen[id].x;
			objetivo.y += posDestino[id].y - posOrigen[id].y;
			Actuate.tween(objetivo, _TIEMPO_DE_ANIMACION, { x: posVieja.x, y: posVieja.y }, false).ease(Elastic.easeIn).onComplete(animacionTerminada);
		}
	}

	private function animacionTerminada() {
		_usos--;
		if (_usos == 0)
			for (nodo in _nodos)
				nodo.controlarDisponibilidad(_TIEMPO_DE_ANIMACION);
	}

	public function setAccion(id: Int, destinos: Array<Int>) {
		_imagenPreview.setImagen("images/accion" + id + ".png");
		_destinosDeAccion = destinos;
	}

	public function agregar(nodo: Nodo) {
		_nodos.push(nodo);
		_clickManager.agregar(nodo);
	}

	public function intercambiarHojas(origenes: Array<CuadTree>, ids: Array<Int>) {
		if (isBloqueado())
			return;

		_usos++;
		var posOrigen: Array<Point> = new Array<Point>();
		var posDestino: Array<Point> = new Array<Point>();

		for (id in 0 ... 4) {
			posOrigen.push(origenes[id].getHijo(ids[id]).getFinder().getPosicionAbsoluta());
			posDestino.push(posOrigen[id]);
		}

		var aux: Point;
		for (destino in _destinosDeAccion) {
			aux = posDestino[destino];
			posDestino[destino] = posDestino[0];
			posDestino[0] = aux;

			origenes[0].intercambiar(ids[0], origenes[destino], ids[destino]);
		}
		animar(origenes, ids, posOrigen, posDestino);
		_usos--;
	}

	public function isBloqueado() {
		return _usos != 0;
	}

	public function mezclar(cant: Int, botonera: ScrollBotonera) {
		for (i in 0 ... cant) {
			Actuate.timer(_TIEMPO_DE_ANIMACION * 1.5 * i).onComplete(
				function() {
					botonera.clickRandom();
					_nodos[Math.floor(Math.random() * _nodos.length)].click();
				});
		}
	}

}