package com.flmaker.display {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class Texture extends Graphic {
		public function Texture(width:int=0, height:int=0):void {
			super(width, height);
		}
		
		public function fill(source:BitmapData, spacingX:int=0, spacingY:int=0):void {
			var sizeX:uint = (this.width / (source.width + spacingX));
			var sizeY:uint = (this.height / (source.height + spacingY));
			var width:uint = (source.width + spacingX);
			var height:uint = (source.width + spacingX);
			var sourceRect:Rectangle = source.rect;
			
			for (var i:uint = 0; i < sizeX; i++) {
				for (var j:uint = 0; j < sizeY; j++) {
					_bitmap.bitmapData.copyPixels(source, sourceRect, new Point(i*width,j*height));
				}
			}
		}
	}
}