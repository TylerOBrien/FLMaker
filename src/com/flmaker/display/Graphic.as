package com.flmaker.display {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import com.flmaker.FLMaker;
	import com.flmaker.events.FLMakerEvent;
	
	public class Graphic extends Displayable {
		//
		// STATIC
		//
		
		static public function fromBitmapData(bitmapData:BitmapData):Graphic {
			var result:Graphic = new Graphic(bitmapData.width, bitmapData.height);
			result.copy(bitmapData);
			return result;
		}
		
		static public function fromBitmap(bitmap:Bitmap):Graphic {
			return Graphic.fromBitmapData(bitmap.bitmapData);
		}
		
		static public function fromEmbedded(image:Class):Graphic {
			return Graphic.fromBitmapData(FLMaker.getBitmap(image).bitmapData);
		}
		
		//
		// INSTANCE
		//
		
		protected var _bitmap:Bitmap;
		protected var _layers:Array;
		
		public function Graphic(width:int, height:int):void {
			_layers = new Array;
			_bitmap = new Bitmap;
			_bitmap.bitmapData = new BitmapData(width,height);
		}
		
		public function assign(bitmapData:BitmapData):void {
			_bitmap.bitmapData = bitmapData;
			
			dispatchEvent(FLMakerEvent.make(this, FLMakerEvent.CHANGE));
		}
		
		public function copy(bitmapData:BitmapData):void {
			_bitmap.bitmapData = new BitmapData(bitmapData.width, bitmapData.height, bitmapData.transparent);
			_bitmap.bitmapData.copyPixels(bitmapData, bitmapData.rect, new Point);
			
			dispatchEvent(FLMakerEvent.make(this, FLMakerEvent.CHANGE));
		}
		
		public override function update():void {
			super.update();
			if (_bitmap != null) {
				_bitmap.transform.matrix = _matrix;
			}
		}
		
		//
		// GET AND SET
		//
		
		public function get bitmap():Bitmap {
			return _bitmap;
		}
		
		public function get bitmapData():BitmapData {
			return _bitmap.bitmapData;
		}
	}
}