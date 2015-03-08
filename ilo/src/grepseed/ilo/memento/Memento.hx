package grepseed.ilo.memento;

interface Memento {

	public function deshacer(): Void;
	public function getAnterior(): Memento;

}