package grepseed.ilo.posiciones;

import flash.display.DisplayObject;
import flash.geom.Point;

class Posiciones1920x1080 {

	private static var _INSTANCIA: Posiciones1920x1080;

	private var _posiciones: Map<String, Point>;

	private function new() {
		_posiciones = new Map();
		_posiciones.set("gp_botonera", new Point(1200, 650));
		_posiciones.set("gp_boton_imagenes", new Point(1625, 100));
		_posiciones.set("gp_boton_deshacer", new Point(1625, 340));
		_posiciones.set("gp_accionSeleccionada", new Point(1280, 250));
	}

	public static function getInstancia() {
		if (_INSTANCIA == null)
			_INSTANCIA = new Posiciones1920x1080();
		return _INSTANCIA;
	}

	public function posicionar(id: String, objeto: DisplayObject) {
		var posicion: Point = _posiciones.get(id);
		objeto.x = posicion.x;
		objeto.y = posicion.y;
	}

}