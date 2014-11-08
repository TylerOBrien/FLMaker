package com.flmaker.display {
	import flash.display.BitmapData;
	import flash.utils.getTimer;
	
	import com.flmaker.events.FLMakerEvent;
	import com.flmaker.system.BaseObject;
	import com.flmaker.system.Time;
	
	public class Reel extends BaseObject {
		protected var _doLoop:Boolean;
		protected var _frames:Array;
		protected var _activeFrameIndex:uint;
		protected var _nextFrameTime:uint;
		
		public function Reel():void {
			_doLoop = true;
			_frames = new Array;
			_nextFrameTime = 0;
		}
		
		public function push(frame:Frame):uint {
			return _frames.push(frame);
		}
		
		public function reset():void {
			_activeFrameIndex = 0;
			_nextFrameTime = (getTimer() + activeFrame.delay);
		}
		
		public function update():void {
			if (getTimer() >= _nextFrameTime) {
				if (_doLoop && ++_activeFrameIndex >= _frames.length) {
					_activeFrameIndex = 0;
				}
				_nextFrameTime = (getTimer() + activeFrame.delay);
				dispatchEvent(FLMakerEvent.make(this, FLMakerEvent.CHANGE));
			}
			
			dispatchEvent(FLMakerEvent.make(this, FLMakerEvent.UPDATE));
		}
		
		//
		// GET AND SET
		//
		
		public function get activeFrame():Frame {
			return _frames[_activeFrameIndex];
		}
		
		public function set doLoop(doLoop:Boolean):void {
			_doLoop = doLoop;
		}
	}
}