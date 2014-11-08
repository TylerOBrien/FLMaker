package com.flmaker.system {
	import flash.display.Sprite;
	
	import com.flmaker.events.FLMakerEvent;
	import com.flmaker.display.Canvas;
	
	public class State extends BaseObject {
		protected var _parent:Sprite;
		protected var _children:Array;
		
		public function State(parent:Sprite):void {
			_parent = parent;
			_children = new Array;
		}
		
		public function update():void {
			const end:uint = _children.length;
			for (var i:uint = 0; i < end; i++) {
				_children[i].update();
			}
		}
		
		public function at(index:uint):Canvas {
			return _children[index];
		}
		
		public function push(canvas:Canvas):uint {
			_parent.addChild(canvas.container);
			return _children.push(canvas);
		}
		
		public function remove(canvas:Canvas):Canvas {
			return removeAt(_children.indexOf(canvas));
		}
		
		public function removeAt(index:uint):Canvas {
			var removedItem:Canvas = _children[index];
			_children.splice(index,1);
			return removedItem;
		}
	}
}