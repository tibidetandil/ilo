package grepseed.ilo.gameElements;

import flash.display.BitmapData;
import flash.geom.Rectangle;
import openfl.Assets;
import openfl.display.Tilesheet;

class Animacion extends GameElement {

	private var _tileSheet:Tilesheet;
	private var _cantFrames:Int;

	public function new (path:String, columnas:Int, filas:Int) {
		super();
		var imagen:BitmapData = Assets.getBitmapData(path);
		var ancho:Float = Math.round(imagen.width / columnas);
		var alto:Float = Math.round(imagen.height / filas);

		_cantFrames = columnas * filas;
		_tileSheet = new Tilesheet(imagen);
		for (fila in 0 ... filas)
			for (columna in 0 ... columnas)
				_tileSheet.addTileRect(new Rectangle(columna * ancho, fila * alto, ancho, alto));
		_tileSheet.drawTiles(graphics, [0, 0, 0]);
	}

	override public function updateLogic(time:Float){
		graphics.clear();
		_tileSheet.drawTiles(graphics,[0, 0, Math.round(time) % _cantFrames]);
	}

}
