package com.flmaker.geom {
	import flash.geom.Point;
	
	public class Orientation extends Object {
		public var anchor:Point;
		public var position:Point;
		public var scale:Point;
		public var rotation:Number;
		
		public function Orientation():void {
			anchor = new Point;
			position = new Point;
			scale = new Point(1,1);
			rotation = 0;
		}
	}
}