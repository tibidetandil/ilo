#if !macro
#if (openfl_html5 && !flambe)

import grepseed.ilo.Main;
import haxe.Resource;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLLoaderDataFormat;
//import flash.Assets;
import flash.Lib;

class ApplicationMain {

	private static var completed:Int;
	private static var preloader:NMEPreloader;
	private static var total:Int;

	public static var loaders:Map <String, Loader>;
	public static var urlLoaders:Map <String, URLLoader>;

	public static function main() {
		completed = 0;
		loaders = new Map <String, Loader>();
		urlLoaders = new Map <String, URLLoader>();
		total = 0;
		
		//flash.Lib.setPackage("Seba", "ilo", "grepseed.games.ilo", "1.0.0");
		flash.Lib.current.loaderInfo = flash.display.LoaderInfo.create (null);
		
		try {
			
			if (Reflect.hasField (js.Browser.window, "winParameters")) {
				
				Reflect.setField (flash.Lib.current.loaderInfo, "parameters", Reflect.field (js.Browser.window, "winParameters")());
				
			}
			
			flash.Lib.current.stage.loaderInfo = flash.Lib.current.loaderInfo;
			
		} catch (e:Dynamic) {}

		

		
		preloader = new NMEPreloader();
		
		Lib.current.addChild(preloader);
		preloader.onInit();

		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion0.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion1.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion10.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion11.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion12.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion13.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion14.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion15.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion16.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion17.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion18.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion19.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion2.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion3.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion4.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion5.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion6.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion7.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion8.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/accion9.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/botonDeshacer.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/botonImagenes.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/boton_jugar.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/ejemplo.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/fondo.jpg", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/nodoCuadTree.png", loader);
		total ++;
		
		
		var loader:Loader = new Loader();
		loaders.set("images/tablero.jpg", loader);
		total ++;
		
		
		var resourcePrefix = "NME_:bitmap_";
		for (resourceName in Resource.listNames()) {
			if (StringTools.startsWith (resourceName, resourcePrefix)) {
				var type = Type.resolveClass(StringTools.replace (resourceName.substring(resourcePrefix.length), "_", "."));
				if (type != null) {
					total++;
					var instance = Type.createInstance (type, [ 0, 0, true, 0x00FFFFFF, bitmapClass_onComplete ]);
				}
			}
		}
		
		if (total == 0) {
			begin();
		} else {
			for (path in loaders.keys()) {
				var loader:Loader = loaders.get(path);
				loader.contentLoaderInfo.addEventListener("complete",
          loader_onComplete);
				loader.load (new URLRequest (path));
			}

			for (path in urlLoaders.keys()) {
				var urlLoader:URLLoader = urlLoaders.get(path);
				urlLoader.addEventListener("complete", loader_onComplete);
				urlLoader.load(new URLRequest (path));
			}
		}
	}

	private static function begin():Void {
		preloader.addEventListener(Event.COMPLETE, preloader_onComplete);
		preloader.onLoaded ();
	}
	
	private static function bitmapClass_onComplete(instance:BitmapData):Void {
		completed++;
		var classType = Type.getClass (instance);
		Reflect.setField (classType, "preload", instance);
		if (completed == total) {
			begin ();
		}
	}

	private static function loader_onComplete(event:Event):Void {
		completed ++;
		preloader.onUpdate (completed, total);
		if (completed == total) {
			begin ();
		}
	}

	private static function preloader_onComplete(event:Event):Void {
		preloader.removeEventListener(Event.COMPLETE, preloader_onComplete);
		Lib.current.removeChild(preloader);
		preloader = null;
		if (Reflect.field(grepseed.ilo.Main, "main") == null)
		{
			var mainDisplayObj = Type.createInstance(DocumentClass, []);
			if (Std.is(mainDisplayObj, flash.display.DisplayObject))
				flash.Lib.current.addChild(cast mainDisplayObj);
		}
		else
		{
			Reflect.callMethod(grepseed.ilo.Main, Reflect.field (grepseed.ilo.Main, "main"), []);
		}
	}
}

@:build(DocumentClass.build())
class DocumentClass extends grepseed.ilo.Main {}

#else

import grepseed.ilo.Main;

class ApplicationMain {

	public static function main() {
		if (Reflect.field(grepseed.ilo.Main, "main") == null) {
			Type.createInstance(grepseed.ilo.Main, []);
		} else {
			Reflect.callMethod(grepseed.ilo.Main, Reflect.field(grepseed.ilo.Main, "main"), []);
		}
	}
}

#end
#else

import haxe.macro.Context;
import haxe.macro.Expr;

class DocumentClass {
	
	macro public static function build ():Array<Field> {
		var classType = Context.getLocalClass().get();
		var searchTypes = classType;
		while (searchTypes.superClass != null) {
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				var fields = Context.getBuildFields();
				var method = macro {
					return flash.Lib.current.stage;
				}
				fields.push ({ name: "get_stage", access: [ APrivate, AOverride ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos() });
				return fields;
			}
			searchTypes = searchTypes.superClass.t.get();
		}
		return null;
	}
	
}
#end
