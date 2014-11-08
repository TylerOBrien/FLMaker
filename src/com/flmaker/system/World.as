package com.flmaker.system {
	import com.flmaker.display.Canvas;
	
	public class World extends Object {
		protected var _children:Array;
		
		public function World():void {
			_children = new Array;
		}
		
		public function at(index:uint):Canvas {
			return _children[index];
		}
		
		public function push(canvas:Canvas):uint {
			return _children.push(canvas);
		}
		
		public function update():void {
			for each (var canvas:Canvas in _children) {
				canvas.update();
			}
		}
	}
}