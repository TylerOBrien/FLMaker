package com.flmaker.display {
	
	import flash.display.Sprite;
	
	public class Canvas extends Displayable {
		protected var _children:Array;
		protected var _container:Sprite;
		
		public function Canvas():void {
			_children = new Array;
			_container = new Sprite;
		}
		
		public function at(index:uint):Graphic {
			return _children[index];
		}
		
		public function push(graphic:Graphic):void {
			_children.push(graphic);
			_container.addChild(graphic.bitmap);
		}
		
		public override function update():void {
			super.update();
			const end:uint = _children.length;
			for (var i:uint = 0; i < end; i++) {
				_children[i].update();
			}
		}
		
		//
		// GET AND SET
		//
		
		public function get container():Sprite {
			return _container;
		}
	}
}