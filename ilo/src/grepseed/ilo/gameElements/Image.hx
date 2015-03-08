package grepseed.ilo.gameElements;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import openfl.Assets;

class Image extends GameElement {

	public function new(path: String) {
		super();
		setImagen(path);
//		setSize(tamanio);
	}

	public function setImagen(path: String) {
		if (numChildren > 0)
			removeChildAt(0);
		addChild(new Bitmap(Assets.getBitmapData(path)));
	}

}