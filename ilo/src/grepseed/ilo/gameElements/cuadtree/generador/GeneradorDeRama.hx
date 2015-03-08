package grepseed.ilo.gameElements.cuadtree.generador ;

import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CTRama;
import grepseed.ilo.gameElements.cuadtree.CuadTree;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.gameElements.cuadtree.FuenteCT;

class GeneradorDeRama implements GeneradorDeCuadTree {

	public function new() {}

	public function generar(id:Int, cantHojas:Int, posicion:Point, finder: Finder, fuente:FuenteCT): CuadTree {
		return new CTRama(id, finder, cantHojas, posicion, fuente);
	}
	
}