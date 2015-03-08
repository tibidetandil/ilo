package grepseed.ilo.screens;

import grepseed.ilo.gameElements.Boton;
import grepseed.ilo.gameElements.boton.AccionCambiarPantalla;
import grepseed.ilo.ManagerDeClicks;

class MenuScreen extends Screen {

	private var _botonJugar: Boton;

	public function new(sm: ScreenManager, cm: ManagerDeClicks) {
		super(sm);
		_botonJugar = new Boton("images/boton_jugar.png", new AccionCambiarPantalla("juego", sm));
		_botonJugar.x = _botonJugar.getWidth() * 3;
		_botonJugar.y = _botonJugar.getHeight() * 3;
		cm.agregar(_botonJugar);
	}

	override public function init(time: Float) {
		addChild(_botonJugar);
	}

	override public function end(onComplete:Dynamic) {
		removeChild(_botonJugar);
		super.end(onComplete);
	}

}