package grepseed.ilo.memento;

class MementoNulo implements Memento {

	public function new() {}

	public function deshacer() {}

	public function getAnterior(): Memento {
		return this;
	}

}