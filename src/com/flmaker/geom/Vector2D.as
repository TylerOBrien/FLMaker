package com.flmaker.geom {
	import flash.geom.Point;
	
	public class Vector2D extends Object {
		protected var _vector:Point;
		protected var _length:Number;
		
		public function Vector2D():void {
			
		}
		
		public function get length():Number {
			return _length;
		}
		
		public function get x():Number {
			return _vector.x;
		}
		
		public function get y():Number {
			return _vector.y;
		}
	}
}