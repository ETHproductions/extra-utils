import com.stencyl.Engine;
import com.stencyl.models.Actor;
import com.stencyl.models.actor.Group;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.Font;
import com.stencyl.models.Region;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import nme.display.BitmapData;
import nme.display.Bitmap;
import box2D.dynamics.joints.B2Joint;
// import com.stencyl.behavior.Attribute;
// import com.stencyl.behavior.SceneScript;

class ExtraUtils {
	public static function sanitizeGameName(name:String):String {
		var replacements:Map<String, String> = [
			"$" => "$$",
			"\n" => "$0A",
			"\r" => "$0D",
			" " => "$20",
			"\"" => "$22",
			"#" => "$23",
			"%" => "$25",
			"&" => "$26",
			"'" => "$27",
			"," => "$2C",
			":" => "$3A",
			";" => "$3B",
			"<" => "$3C",
			">" => "$3E",
			"?" => "$3F",
			"\\" => "$5C",
			"~" => "$7E"
		];
		for (key in replacements.keys()) {
			name = StringTools.replace(name, key, replacements[key]);
		}
		return name;
	}
	
	public static function equalsOr(thing:Dynamic, thing1:Dynamic, thing2:Dynamic):Bool {
		return thing == thing1 || thing == thing2;
	}
	
	public static function is(thing:Dynamic, type:String):Bool {
		if (type == "String") {
			return Std.is(thing, String);
		} else if (type == "Bool") {
			return Std.is(thing, Bool);
		} else if (type == "Int") {
			return Std.is(thing, Int);
		} else if (type == "Float") {
			return Std.is(thing, Float);
		} else if (type == "Actor") {
			return Std.is(thing, Actor);
		} else if (type == "Group") {
			return Std.is(thing, Group);
		} else if (type == "Type") {
			return Std.is(thing, Type);
		} else if (type == "Font") {
			return Std.is(thing, Font);
		} else if (type == "BitmapData") {
			return Std.is(thing, BitmapData);
		} else if (type == "Bitmap") {
			return Std.is(thing, Bitmap);
		} else if (type == "Joint") {
			return Std.is(thing, B2Joint);
		} else if (type == "Region") {
			return Std.is(thing, Region);
		} else if (type == "Scene") {
			return Std.is(thing, Scene);
		} else if (type == "Sound") {
			return Std.is(thing, Sound);
		} else if (type == "Array") {
			switch (Type.typeof(thing)) {
			case TClass(Array):
				return true;
			default:
				return false;
			}
		} else if (type == "Map") {
//			switch (Type.typeof(thing)) {
//			case TClass(Map):
//				return true;
//			default:
				return false;
//			}
		} else {
			trace("ERROR: Type (" + type + ") is not a valid type!");
			return false;
		}
	}
	
/*	public static function getSceneBehaviorNames():Array<Dynamic> {
		var behaviorNames:Array<Dynamic> = new Array<Dynamic>();
		for (i in Engine.engine.behaviors.behaviors) {
			behaviorNames.push(i.name);
		}
		return behaviorNames;
	}

	public static function getActorBehaviorNames(actor:Actor):Array<Dynamic> {
		var behaviorNames:Array<Dynamic> = new Array<Dynamic>();
		for (i in actor.behaviors.behaviors) {
			behaviorNames.push(i.name);
		}
		return behaviorNames;
	}
	
	public static function getSceneBehaviorAttrs(name:String):Map<String,Dynamic> {
		var behavior:Dynamic = null;
		for (i in Engine.engine.behaviors.behaviors) {
			if (i.name == name) {
				behavior = i;
			}
		}
		if (behavior == null) { return null; }
		var attrs:Map<String,Attribute> = behavior.attributes;
		var behaviorAttrs:Map<String,Dynamic> = new Map<String,Dynamic>();
		for (i in attrs) {
			behaviorAttrs.set(i.fullName, i.getRealValue());
		}
		return behaviorAttrs;
	}

	public static function getActorBehaviorAttrs(actor:Actor, name:String):Map<String,Dynamic> {
		var behavior:Dynamic = null;
		for (i in actor.behaviors.behaviors) {
			if (i.name == name) {
				behavior = i;
			}
		}
		if (behavior == null) { return null; }
		var attrs:Map<String,Attribute> = behavior.attributes;
		var behaviorAttrs:Map<String,Dynamic> = new Map<String,Dynamic>();
		for (i in attrs) {
			behaviorAttrs.set(i.fullName, i.getRealValue());
		}
		return behaviorAttrs;
	} */
}