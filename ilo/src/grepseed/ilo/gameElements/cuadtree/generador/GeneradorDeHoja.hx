package grepseed.ilo.gameElements.cuadtree.generador ;

import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CTHoja;
import grepseed.ilo.gameElements.cuadtree.CuadTree;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.gameElements.cuadtree.FuenteCT;

class GeneradorDeHoja implements GeneradorDeCuadTree {

	public function new() {}

	public function generar(id:Int, cantHojas:Int, posicion:Point, finder: Finder, fuente:FuenteCT):CuadTree {
		return new CTHoja(id, finder, posicion, fuente);
	}
	
}