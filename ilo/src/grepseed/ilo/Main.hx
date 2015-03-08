package grepseed.ilo;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.Lib;
import grepseed.ilo.gameElements.scroll.ScrollNulo;
import grepseed.ilo.screens.GamePlayScreen;
import grepseed.ilo.screens.MenuScreen;
import grepseed.ilo.screens.ScreenManager;
import haxe.Timer;

class Main extends Sprite {

	private static var _ANCHO_PANTALLA = 1925;
	private static var _ALTO_PANTALLA = 1080;

	private var _inited : Bool;
	private var _beginTime : Float;
	private var _screenManager : ScreenManager;

	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	private function added(e) {
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
			haxe.Timer.delay(init, 100); // iOS 6
		#else
			init();
		#end
	}

	private function init() {
		if (_inited) return;
		_inited = true;

		var clickManager: ManagerDeClicks = new ManagerDeClicks();
		clickManager.setScroll(new ScrollNulo());
		_beginTime = Timer.stamp();
		_screenManager = new ScreenManager();
		_screenManager.suscribeScreen('juego', new GamePlayScreen(_screenManager, clickManager));
		_screenManager.suscribeScreen('menu', new MenuScreen(_screenManager, clickManager));
		addChild(_screenManager);
		stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		stage.addEventListener(MouseEvent.MOUSE_DOWN, clickManager.clickAbajo);
		stage.addEventListener(MouseEvent.MOUSE_UP, clickManager.clickArriba);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, clickManager.movida);
		resize(null);
	}

	private function gameLoop(e) {
		_screenManager.updateLogic(Timer.stamp() - _beginTime);
	}

	private function resize(e) {
		if (!_inited) init();
		var scaleX:Float = stage.stageWidth / _ANCHO_PANTALLA;
		var scaleY:Float = stage.stageHeight / _ALTO_PANTALLA;
		this.scaleX = this.scaleY = Math.min(scaleX, scaleY);
		this.x = (stage.stageWidth - (_ANCHO_PANTALLA * this.scaleX)) / 2;
		this.y = (stage.stageHeight - (_ALTO_PANTALLA * this.scaleY)) / 2;
	}

	public static function main() {
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.stage.addEventListener (KeyboardEvent.KEY_UP, eventoTeclaApretada);
		Lib.current.addChild(new Main());
	}

	private static function eventoTeclaApretada (event:KeyboardEvent) {
		if (event.keyCode == 27) {
			#if android
				Sys.exit(0);
			#end
		}
	}

}
