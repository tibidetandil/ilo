package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("images/accion0.png", __ASSET__images_accion0_png);
		type.set ("images/accion0.png", AssetType.IMAGE);
		className.set ("images/accion1.png", __ASSET__images_accion1_png);
		type.set ("images/accion1.png", AssetType.IMAGE);
		className.set ("images/accion10.png", __ASSET__images_accion10_png);
		type.set ("images/accion10.png", AssetType.IMAGE);
		className.set ("images/accion11.png", __ASSET__images_accion11_png);
		type.set ("images/accion11.png", AssetType.IMAGE);
		className.set ("images/accion12.png", __ASSET__images_accion12_png);
		type.set ("images/accion12.png", AssetType.IMAGE);
		className.set ("images/accion13.png", __ASSET__images_accion13_png);
		type.set ("images/accion13.png", AssetType.IMAGE);
		className.set ("images/accion14.png", __ASSET__images_accion14_png);
		type.set ("images/accion14.png", AssetType.IMAGE);
		className.set ("images/accion15.png", __ASSET__images_accion15_png);
		type.set ("images/accion15.png", AssetType.IMAGE);
		className.set ("images/accion16.png", __ASSET__images_accion16_png);
		type.set ("images/accion16.png", AssetType.IMAGE);
		className.set ("images/accion17.png", __ASSET__images_accion17_png);
		type.set ("images/accion17.png", AssetType.IMAGE);
		className.set ("images/accion18.png", __ASSET__images_accion18_png);
		type.set ("images/accion18.png", AssetType.IMAGE);
		className.set ("images/accion19.png", __ASSET__images_accion19_png);
		type.set ("images/accion19.png", AssetType.IMAGE);
		className.set ("images/accion2.png", __ASSET__images_accion2_png);
		type.set ("images/accion2.png", AssetType.IMAGE);
		className.set ("images/accion3.png", __ASSET__images_accion3_png);
		type.set ("images/accion3.png", AssetType.IMAGE);
		className.set ("images/accion4.png", __ASSET__images_accion4_png);
		type.set ("images/accion4.png", AssetType.IMAGE);
		className.set ("images/accion5.png", __ASSET__images_accion5_png);
		type.set ("images/accion5.png", AssetType.IMAGE);
		className.set ("images/accion6.png", __ASSET__images_accion6_png);
		type.set ("images/accion6.png", AssetType.IMAGE);
		className.set ("images/accion7.png", __ASSET__images_accion7_png);
		type.set ("images/accion7.png", AssetType.IMAGE);
		className.set ("images/accion8.png", __ASSET__images_accion8_png);
		type.set ("images/accion8.png", AssetType.IMAGE);
		className.set ("images/accion9.png", __ASSET__images_accion9_png);
		type.set ("images/accion9.png", AssetType.IMAGE);
		className.set ("images/botonDeshacer.png", __ASSET__images_botondeshacer_png);
		type.set ("images/botonDeshacer.png", AssetType.IMAGE);
		className.set ("images/botonImagenes.png", __ASSET__images_botonimagenes_png);
		type.set ("images/botonImagenes.png", AssetType.IMAGE);
		className.set ("images/boton_jugar.png", __ASSET__images_boton_jugar_png);
		type.set ("images/boton_jugar.png", AssetType.IMAGE);
		className.set ("images/ejemplo.jpg", __ASSET__images_ejemplo_jpg);
		type.set ("images/ejemplo.jpg", AssetType.IMAGE);
		className.set ("images/fondo.jpg", __ASSET__images_fondo_jpg);
		type.set ("images/fondo.jpg", AssetType.IMAGE);
		className.set ("images/nodoCuadTree.png", __ASSET__images_nodocuadtree_png);
		type.set ("images/nodoCuadTree.png", AssetType.IMAGE);
		className.set ("images/tablero.jpg", __ASSET__images_tablero_jpg);
		type.set ("images/tablero.jpg", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "images/accion0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion11.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion12.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion13.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion14.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion15.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion16.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion17.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion18.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion19.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/accion9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/botonDeshacer.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/botonImagenes.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/boton_jugar.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/ejemplo.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/fondo.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/nodoCuadTree.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/tablero.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("images/accion0.png", __ASSET__images_accion0_png);
		type.set ("images/accion0.png", AssetType.IMAGE);
		
		className.set ("images/accion1.png", __ASSET__images_accion1_png);
		type.set ("images/accion1.png", AssetType.IMAGE);
		
		className.set ("images/accion10.png", __ASSET__images_accion10_png);
		type.set ("images/accion10.png", AssetType.IMAGE);
		
		className.set ("images/accion11.png", __ASSET__images_accion11_png);
		type.set ("images/accion11.png", AssetType.IMAGE);
		
		className.set ("images/accion12.png", __ASSET__images_accion12_png);
		type.set ("images/accion12.png", AssetType.IMAGE);
		
		className.set ("images/accion13.png", __ASSET__images_accion13_png);
		type.set ("images/accion13.png", AssetType.IMAGE);
		
		className.set ("images/accion14.png", __ASSET__images_accion14_png);
		type.set ("images/accion14.png", AssetType.IMAGE);
		
		className.set ("images/accion15.png", __ASSET__images_accion15_png);
		type.set ("images/accion15.png", AssetType.IMAGE);
		
		className.set ("images/accion16.png", __ASSET__images_accion16_png);
		type.set ("images/accion16.png", AssetType.IMAGE);
		
		className.set ("images/accion17.png", __ASSET__images_accion17_png);
		type.set ("images/accion17.png", AssetType.IMAGE);
		
		className.set ("images/accion18.png", __ASSET__images_accion18_png);
		type.set ("images/accion18.png", AssetType.IMAGE);
		
		className.set ("images/accion19.png", __ASSET__images_accion19_png);
		type.set ("images/accion19.png", AssetType.IMAGE);
		
		className.set ("images/accion2.png", __ASSET__images_accion2_png);
		type.set ("images/accion2.png", AssetType.IMAGE);
		
		className.set ("images/accion3.png", __ASSET__images_accion3_png);
		type.set ("images/accion3.png", AssetType.IMAGE);
		
		className.set ("images/accion4.png", __ASSET__images_accion4_png);
		type.set ("images/accion4.png", AssetType.IMAGE);
		
		className.set ("images/accion5.png", __ASSET__images_accion5_png);
		type.set ("images/accion5.png", AssetType.IMAGE);
		
		className.set ("images/accion6.png", __ASSET__images_accion6_png);
		type.set ("images/accion6.png", AssetType.IMAGE);
		
		className.set ("images/accion7.png", __ASSET__images_accion7_png);
		type.set ("images/accion7.png", AssetType.IMAGE);
		
		className.set ("images/accion8.png", __ASSET__images_accion8_png);
		type.set ("images/accion8.png", AssetType.IMAGE);
		
		className.set ("images/accion9.png", __ASSET__images_accion9_png);
		type.set ("images/accion9.png", AssetType.IMAGE);
		
		className.set ("images/botonDeshacer.png", __ASSET__images_botondeshacer_png);
		type.set ("images/botonDeshacer.png", AssetType.IMAGE);
		
		className.set ("images/botonImagenes.png", __ASSET__images_botonimagenes_png);
		type.set ("images/botonImagenes.png", AssetType.IMAGE);
		
		className.set ("images/boton_jugar.png", __ASSET__images_boton_jugar_png);
		type.set ("images/boton_jugar.png", AssetType.IMAGE);
		
		className.set ("images/ejemplo.jpg", __ASSET__images_ejemplo_jpg);
		type.set ("images/ejemplo.jpg", AssetType.IMAGE);
		
		className.set ("images/fondo.jpg", __ASSET__images_fondo_jpg);
		type.set ("images/fondo.jpg", AssetType.IMAGE);
		
		className.set ("images/nodoCuadTree.png", __ASSET__images_nodocuadtree_png);
		type.set ("images/nodoCuadTree.png", AssetType.IMAGE);
		
		className.set ("images/tablero.jpg", __ASSET__images_tablero_jpg);
		type.set ("images/tablero.jpg", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__images_accion0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion15_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion16_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion17_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion18_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion19_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_accion9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_botondeshacer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_botonimagenes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_boton_jugar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_ejemplo_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_fondo_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_nodocuadtree_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_tablero_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5

#if openfl




























#end

#else

#if openfl

#end

#if (windows || mac || linux)


@:bitmap("assets/images/accion0.png") class __ASSET__images_accion0_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion1.png") class __ASSET__images_accion1_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion10.png") class __ASSET__images_accion10_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion11.png") class __ASSET__images_accion11_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion12.png") class __ASSET__images_accion12_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion13.png") class __ASSET__images_accion13_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion14.png") class __ASSET__images_accion14_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion15.png") class __ASSET__images_accion15_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion16.png") class __ASSET__images_accion16_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion17.png") class __ASSET__images_accion17_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion18.png") class __ASSET__images_accion18_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion19.png") class __ASSET__images_accion19_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion2.png") class __ASSET__images_accion2_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion3.png") class __ASSET__images_accion3_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion4.png") class __ASSET__images_accion4_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion5.png") class __ASSET__images_accion5_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion6.png") class __ASSET__images_accion6_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion7.png") class __ASSET__images_accion7_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion8.png") class __ASSET__images_accion8_png extends lime.graphics.Image {}
@:bitmap("assets/images/accion9.png") class __ASSET__images_accion9_png extends lime.graphics.Image {}
@:bitmap("assets/images/botonDeshacer.png") class __ASSET__images_botondeshacer_png extends lime.graphics.Image {}
@:bitmap("assets/images/botonImagenes.png") class __ASSET__images_botonimagenes_png extends lime.graphics.Image {}
@:bitmap("assets/images/boton_jugar.png") class __ASSET__images_boton_jugar_png extends lime.graphics.Image {}
@:bitmap("assets/images/ejemplo.jpg") class __ASSET__images_ejemplo_jpg extends lime.graphics.Image {}
@:bitmap("assets/images/fondo.jpg") class __ASSET__images_fondo_jpg extends lime.graphics.Image {}
@:bitmap("assets/images/nodoCuadTree.png") class __ASSET__images_nodocuadtree_png extends lime.graphics.Image {}
@:bitmap("assets/images/tablero.jpg") class __ASSET__images_tablero_jpg extends lime.graphics.Image {}



#end

#end
#end

