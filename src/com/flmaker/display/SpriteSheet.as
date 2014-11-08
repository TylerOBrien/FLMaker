package com.flmaker.display {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import com.flmaker.system.BaseObject;

	public class SpriteSheet extends BaseObject {
		//
		// STATIC
		//
		
		static public function toArray(bitmapData:BitmapData, blockWidth:uint, blockHeight:uint, bgColour:uint):Array {
			var result:SpriteSheet = new SpriteSheet;
			result.process(bitmapData, blockHeight, blockWidth, bgColour);
			return result._sprites;
		}
		
		//
		// INSTANCE
		//
		
		protected var _sprites:Array;
		
		public function SpriteSheet():void {
			_sprites = new Array;
		}
		
		public function process(bitmapData:BitmapData, blockWidth:uint, blockHeight:uint, bgColour:uint):void {
			var framesX:uint = (bitmapData.width/blockWidth);
			var framesY:uint = (bitmapData.height/blockHeight);
			var block:BitmapData = new BitmapData(blockWidth,blockHeight);
			var selection:Rectangle = new Rectangle(0, 0, blockWidth, blockHeight);
			var point:Point = new Point;
			
			for (var i:uint = 0; i < framesY; i++) {
				_sprites.push(new Array);
				
				for (var j:uint = 0; j < framesX; j++) {
					selection.x = (blockWidth*j) + j;
					block.copyPixels(bitmapData, selection, point);
					
					var rect:Rectangle = block.getColorBoundsRect(bgColour, bgColour, false);
					
					if (rect.width && rect.height) {
						var sprite:BitmapData = new BitmapData(rect.width, rect.height);
						
						sprite.copyPixels(block, rect, point);
						sprite.threshold(sprite, sprite.rect, point, "==", bgColour);
						
						_sprites[i].push(sprite);
					} else {
						break;
					}
				}
				
				selection.y += (blockHeight+1);
			}
		}
		
		//
		// GET AND SET
		//
		
		public function getSprite(x:uint, y:uint):BitmapData {
			return _sprites[x][y];
		}
	}
}