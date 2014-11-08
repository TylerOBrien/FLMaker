package com.flmaker.display  {
	import flash.display.BitmapData;
	
	import com.flmaker.system.BaseObject;
	
	public class Frame extends BaseObject {
		public var bitmapData:BitmapData;
		public var delay:uint;
		
		public function Frame(bitmapData:BitmapData, delay:uint):void {
			this.bitmapData = bitmapData;
			this.delay = delay;
		}
		
		public function clone():Frame {
			return new Frame(bitmapData.clone(), delay);
		}
	}
}