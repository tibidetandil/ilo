package grepseed.ilo.gameElements.cuadtree;

import flash.display.BitmapData;
import flash.display.Graphics;
import flash.geom.Rectangle;
import openfl.Assets;
import openfl.display.Tilesheet;

class FuenteCT {

	private var _tileSheet:Tilesheet;
	private var _alto:Float;
	private var _ancho:Float;

	public function new (path:String, columnas:Int, filas:Int) {
		var imagen:BitmapData = Assets.getBitmapData(path);
		_ancho = imagen.width / columnas;
		_alto = imagen.height / filas;
		_tileSheet = new Tilesheet(imagen);
		inicializarTileSheet(0, 0, imagen.width);
	}

	private function inicializarTileSheet(inicioX: Float, inicioY: Float, tamanio: Float) {
		if (_ancho == tamanio)
			_tileSheet.addTileRect(new Rectangle(inicioX, inicioY, _ancho, _alto));
		else {
			tamanio /= 2;
			inicializarTileSheet(inicioX,			inicioY,							tamanio);
			inicializarTileSheet(inicioX + tamanio,	inicioY,							tamanio);
			inicializarTileSheet(inicioX,			inicioY + tamanio * _alto / _ancho,	tamanio);
			inicializarTileSheet(inicioX + tamanio,	inicioY + tamanio * _alto / _ancho,	tamanio);
		}
	}

	public function getAlto(): Float {
		return _alto;
	}

	public function getAncho(): Float {
		return _ancho;
	}

	public function dibujar(graficos: Graphics, id: Int) {
		_tileSheet.drawTiles(graficos, [0, 0, id]);
	}

}