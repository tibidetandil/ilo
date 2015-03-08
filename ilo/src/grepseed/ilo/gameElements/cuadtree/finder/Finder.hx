package grepseed.ilo.gameElements.cuadtree.finder;

import flash.geom.Point;
import grepseed.ilo.gameElements.cuadtree.CuadTree;

interface Finder {

	public function getCT(): CuadTree;
	public function getCTPadre(): CuadTree;
	public function getHoja(): CuadTree;
	public function getPosicionAbsoluta(): Point;
	public function getId(): Int;

}