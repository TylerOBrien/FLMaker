package com.flmaker.system {
	public class UniqueId extends Object {
		//
		// STATIC
		//
		
		static private var __nextId:String = "a";
		
		static public function setAt(src:String, index:uint, value:String):String {
			var asArray:Array = src.split("");
			asArray[index] = value;
			return asArray.join("");
		}
		
		static public function indexOfLastNotZ(str:String):int {
			for (var i:int = (str.length-1); i != -1; i--) {
				if (str.charCodeAt(i) != 122) {
					return i;
				}
			}
			
			return -1;
		}
		
		static public function incrementUid(str:String):String {
			var index:int = UniqueId.indexOfLastNotZ(str);
			
			if (index != -1) {
				return UniqueId.setAt(str, index, String.fromCharCode(str.charCodeAt(index)+1));
			}
			
			var result:String = "";
			
			for (var i:int = (str.length); i != -1; i--) {
				result += "a";
			}
			
			return result;
		}
		
		static public function newId():String {
			return (new UniqueId).__id;
		}
		
		//
		// INSTANCE
		//
		
		private const __id:String = UniqueId.__nextId;
		
		public function UniqueId():void {
			UniqueId.__nextId = UniqueId.incrementUid(UniqueId.__nextId);
		}
		
		public function get id():String {
			return __id;
		}
	}
}