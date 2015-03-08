package grepseed.ilo.screens;

import flash.display.Sprite;
import grepseed.ilo.gameElements.GameElement;

class Screen extends GameElement {

	private var _screenManager: ScreenManager;

	public function new(sm:ScreenManager) {
		super();
		_screenManager = sm;
	}

	public function init(time: Float) { }

	public function end(onComplete:Dynamic){
		while (numChildren > 0)
			removeChildAt(0);
		onComplete();
	}

	public function getScreenManager(): ScreenManager {
		return _screenManager;
	}

}