package grepseed.ilo.gameElements.cuadtree.generador ;

import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;
import grepseed.ilo.gameElements.cuadtree.finder.Finder;
import grepseed.ilo.gameElements.cuadtree.FuenteCT;

interface GeneradorDeCuadTree {

	public function generar(id: Int, cantHojas: Int, posicion: Point, finder: Finder, fuente: FuenteCT): CuadTree;

}