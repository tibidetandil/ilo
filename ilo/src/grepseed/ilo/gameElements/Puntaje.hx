package grepseed.ilo.gameElements;

import flash.net.SharedObject;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

class Puntaje extends GameElement {

	private var _cartelTiempo : TextField;
	private var _cartelMejorTiempo : TextField;
	private var _tiempoInicio: Float;
	private var _dataGuardada: SharedObject;
	private var _mejorTiempo: Float;
	private var _mejorTiempoGuardado: Bool;

	public function new(ancho: Float, alto: Float) {
		super();
		cargarMejorTiempo();
		iniciarCartelTiempo(ancho, alto);
		iniciarCartelMejorTiempo(ancho);
		addChild(_cartelTiempo);
		addChild(_cartelMejorTiempo);
	}

	private function iniciarCartelTiempo(ancho: Float, alto: Float) {
		_cartelTiempo = new TextField();

		var tf = new TextFormat(openfl.Assets.getFont('fonts/losPollos.ttf').fontName);
		tf.color = 0;
		tf.size = 65;
		_cartelTiempo.defaultTextFormat = tf;

		_cartelTiempo.text = "TIME " + getTiempo(0);
		_cartelTiempo.width = ancho;
		_cartelTiempo.y = alto - _cartelTiempo.height;
//		_cartel.x = (ancho - _cartel.width) / 2;
		_cartelTiempo.x = 50;
		_cartelTiempo.selectable = false;
	}

	private function iniciarCartelMejorTiempo(ancho: Float) {
		_cartelMejorTiempo = new TextField();

		var tf = new TextFormat(openfl.Assets.getFont('fonts/losPollos.ttf').fontName);
		tf.color = 0;
		tf.size = 30;
		_cartelMejorTiempo.defaultTextFormat = tf;

		_cartelMejorTiempo.text = "Best " + getTiempo(_mejorTiempo + _tiempoInicio);
		_cartelMejorTiempo.width = ancho;
		_cartelMejorTiempo.y = _cartelTiempo.y + _cartelMejorTiempo.height * 3 / 5;
//		_cartel.x = (ancho - _cartel.width) / 2;
		_cartelMejorTiempo.x = 150;
		_cartelMejorTiempo.selectable = false;
	}

	private function cargarMejorTiempo() {
		_dataGuardada = SharedObject.getLocal("saved_score");
		_mejorTiempoGuardado = true;
		_mejorTiempo = 0;
		if (_dataGuardada.data.scores == null)
			_dataGuardada.data.scores = new Array();
		else
			_mejorTiempo = _dataGuardada.data.scores.pop();
	}

	public function guardarMejorTiempo() {
		if (!_mejorTiempoGuardado) {
			_dataGuardada.data.scores.pop();
			_dataGuardada.data.scores.push(_mejorTiempo);
			_dataGuardada.flush();
			_mejorTiempoGuardado = true;
		}
	}

	public function reset(time: Float) {
		_tiempoInicio = time;
	}

	override public function updateLogic(time: Float) {
		super.updateLogic(time);
		if (time - _tiempoInicio > _mejorTiempo) {
			_mejorTiempo = time - _tiempoInicio;
			_mejorTiempoGuardado = false;
		}
		_cartelTiempo.text = "TIME " + getTiempo(time - _tiempoInicio);
		_cartelMejorTiempo.text = "BEST " + getTiempo(_mejorTiempo);
	}

	private static function getTiempo(time: Float): String {
		var minutos: Int = Math.floor(time/60);
		var segundos: Int = Math.floor(time - 60*minutos);
		var milisegundos: Int = Math.floor((time - Math.floor(time)) * 60);
		return getValorReloj(minutos) + ":" + getValorReloj(segundos) + ":" + getValorReloj(milisegundos);
	}

	private static function getValorReloj(valor: Int): String {
		if (valor < 10)
			return "0" + valor;
		return "" + valor;
	}
}