package grepseed.ilo.gameElements;

import flash.display.Sprite;

class GameElement extends Sprite {

	private var _logicalChild:Array<GameElement>;

	public function new () {
		super();
		_logicalChild = new Array<GameElement>();
	}

	public function updateLogic(time:Float) {
		for (hijo in _logicalChild) {
			hijo.updateLogic(time);
		}
	}

	public function setSize(height: Float) {
		this.scaleX = this.scaleY = 1;
		var proporcion: Float = height/this.height;
		this.scaleX = this.scaleY = proporcion;
	}

	public function isTouched() {
		return (0 < mouseX && 0 < mouseY && getWidth() > mouseX && getHeight() > mouseY);
	}

	public function getWidth(): Float {
		return width;
	}

	public function getHeight(): Float {
		return height;
	}

	public function addLogicalChild(child : GameElement) {
		removeLogicalChild(child);
		_logicalChild.push(child);
	}

	public function borrarHijoCompleto(hijo: GameElement) {
		removeChild(hijo);
		removeLogicalChild(hijo);
	}

	public function agregarHijoCompleto(hijo: GameElement) {
		addChild(hijo);
		addLogicalChild(hijo);
	}

	public function removeLogicalChild(child : GameElement) {
		_logicalChild.remove(child);
	}
}