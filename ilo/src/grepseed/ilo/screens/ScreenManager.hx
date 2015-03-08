package grepseed.ilo.screens;

import flash.display.Sprite;
import flash.display.Stage;
import flash.Lib;

class ScreenManager extends Sprite {

	private var _currentScreen : Screen;
	private var _screens: Map<String, Screen>;
	private var _screenTimes: Map<Screen, Float>;
	private var _otherScreensTime: Float;

	public function new() {
		super();
		_screens = new Map<String, Screen>();
		_screenTimes = new Map<Screen, Float>();
	}

	public function switchScene(name:String) {
		var escene: Screen = _screens.get(name);
		if (_currentScreen != null) {
			_currentScreen.end(
				function() {
					removeChild(_currentScreen);
					setCurrentScreen(escene);
				}
			);
		} else {
			setCurrentScreen(escene);
		}
	}

	private function setCurrentScreen(screen: Screen) {
		_currentScreen = screen;
		addChild(_currentScreen);
		actualizarTiempos();
		_currentScreen.init(_screenTimes.get(_currentScreen));
		Lib.current.stage.focus = _currentScreen;
	}

	private function actualizarTiempos() {
		_otherScreensTime = 0;
		for (time in _screenTimes) {
			_otherScreensTime += time;
		}
		_otherScreensTime -= _screenTimes.get(_currentScreen);
	}

	public function suscribeScreen(name:String, screen:Screen) {
		_screens.set(name, screen);
		_screenTimes.set(screen, 0);
		if (_currentScreen == null) {
			setCurrentScreen(screen);
		}
	}

	public function updateLogic(time: Float) {
		time -= _otherScreensTime;
		_currentScreen.updateLogic(time);
		_screenTimes.set(_currentScreen, time);
	}

}