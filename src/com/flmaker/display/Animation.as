package com.flmaker.display {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import com.flmaker.FLMaker;
	import com.flmaker.events.FLMakerEvent;
	
	public class Animation extends Displayable {
		protected var _bitmap:Bitmap;
		protected var _reels:Dictionary;
		protected var _activeReel:Reel;
		
		public function Animation():void {
			_bitmap = new Bitmap;
			_reels = new Dictionary;
		}
		
		protected function _onChangeFrame(event:FLMakerEvent):void {
			_bitmap.bitmapData = _activeReel.activeFrame.bitmapData;
		}
		
		public function push(frame:Frame):void {
			
		}
		
		public function play(name:String, doLoop:Boolean=true):void {
			if (name in _reels) {
				if (_activeReel) {
					_activeReel.removeEventListener(FLMakerEvent.CHANGE, _onChangeFrame);
				}
				_activeReel = _reels[name];
				_activeReel.addEventListener(FLMakerEvent.CHANGE, _onChangeFrame);
				_activeReel.doLoop = doLoop;
				reset();
			}
		}
		
		public function reset():void {
			_activeReel.reset();
			_onChangeFrame(null);
			dispatchEvent(FLMakerEvent.make(this, FLMakerEvent.RESET));
		}
		
		public override function update():void {
			super.update();
			if (_activeReel) {
				_activeReel.update();
			}
		}
		
		//
		// GET AND SET
		//
		
		public function get bitmap():Bitmap {
			return _bitmap;
		}
	}
}