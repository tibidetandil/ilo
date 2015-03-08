package grepseed.ilo.gameElements.boton;

import grepseed.ilo.screens.ScreenManager;

class AccionCambiarPantalla implements AccionDeBoton {

	private var _nextScene: String;
	private var _screenManager: ScreenManager;

	public function new(scene: String, screenManager: ScreenManager) {
		_nextScene = scene;
		_screenManager = screenManager;
	}

	public function hacer() {
		_screenManager.switchScene(_nextScene);
	}

}