package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new Map <String, Dynamic> ();
	public static var library = new Map <String, LibraryType> ();
	public static var path = new Map <String, String> ();
	public static var type = new Map <String, AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			path.set ("images/accion0.png", "images/accion0.png");
			type.set ("images/accion0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion1.png", "images/accion1.png");
			type.set ("images/accion1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion10.png", "images/accion10.png");
			type.set ("images/accion10.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion11.png", "images/accion11.png");
			type.set ("images/accion11.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion12.png", "images/accion12.png");
			type.set ("images/accion12.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion13.png", "images/accion13.png");
			type.set ("images/accion13.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion14.png", "images/accion14.png");
			type.set ("images/accion14.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion15.png", "images/accion15.png");
			type.set ("images/accion15.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion16.png", "images/accion16.png");
			type.set ("images/accion16.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion17.png", "images/accion17.png");
			type.set ("images/accion17.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion18.png", "images/accion18.png");
			type.set ("images/accion18.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion19.png", "images/accion19.png");
			type.set ("images/accion19.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion2.png", "images/accion2.png");
			type.set ("images/accion2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion3.png", "images/accion3.png");
			type.set ("images/accion3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion4.png", "images/accion4.png");
			type.set ("images/accion4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion5.png", "images/accion5.png");
			type.set ("images/accion5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion6.png", "images/accion6.png");
			type.set ("images/accion6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion7.png", "images/accion7.png");
			type.set ("images/accion7.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion8.png", "images/accion8.png");
			type.set ("images/accion8.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/accion9.png", "images/accion9.png");
			type.set ("images/accion9.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/botonDeshacer.png", "images/botonDeshacer.png");
			type.set ("images/botonDeshacer.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/botonImagenes.png", "images/botonImagenes.png");
			type.set ("images/botonImagenes.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/boton_jugar.png", "images/boton_jugar.png");
			type.set ("images/boton_jugar.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/ejemplo.jpg", "images/ejemplo.jpg");
			type.set ("images/ejemplo.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/fondo.jpg", "images/fondo.jpg");
			type.set ("images/fondo.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/nodoCuadTree.png", "images/nodoCuadTree.png");
			type.set ("images/nodoCuadTree.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("images/tablero.jpg", "images/tablero.jpg");
			type.set ("images/tablero.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}





























