package com.flmaker {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	import com.flmaker.input.Keyboard;
	import com.flmaker.input.Mouse;
	import com.flmaker.system.Time;
	import com.flmaker.system.State;
	import com.flmaker.utils.Tween;
	
	public class FLMaker extends Sprite {
		static private var __stage:Stage;
		static private var __state:State;
		
		static private var __bitmapCache:Dictionary = new Dictionary;
		static private var __soundCache:Dictionary = new Dictionary;
		
		public function FLMaker(stage:Stage=null):void {
			if (FLMaker.__stage) {
				FLMaker.__stage = stage;
				__init();
			} else if (this.stage) {
				FLMaker.__stage = this.stage;
				__init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, __onAddedToStage, false, 0, true);
			}
		}
		
		private function __onAddedToStage(event:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, __onAddedToStage, false);
			__init();
		}
		
		private function __onEnterFrame(event:Event):void {
			Time.update();
			FLMaker.__state.update();
			Tween.update();
			update();
			Keyboard.reset();
			Mouse.reset();
		}
		
		private function __init():void {
			FLMaker.__state = new State(this);
			
			FLMaker.__stage.addEventListener(KeyboardEvent.KEY_DOWN, Keyboard.onKeyPress, false, 2147483647, true);
			FLMaker.__stage.addEventListener(KeyboardEvent.KEY_UP, Keyboard.onKeyRelease, false, 2147483647, true);
			FLMaker.__stage.addEventListener(MouseEvent.CLICK, Mouse.onClick, false, 2147483647, true);
			FLMaker.__stage.addEventListener(MouseEvent.MOUSE_DOWN, Mouse.onMouseDown, false, 2147483647, true);
			FLMaker.__stage.addEventListener(MouseEvent.MOUSE_UP, Mouse.onMouseUp, false, 2147483647, true);
			FLMaker.__stage.addEventListener(MouseEvent.MOUSE_WHEEL, Mouse.onMouseWheel, false, 2147483647, true);
			FLMaker.__stage.addEventListener(MouseEvent.MOUSE_MOVE, Mouse.onMove, false, 2147483647, true);
			FLMaker.__stage.addEventListener(Event.MOUSE_LEAVE, Mouse.onLeaveStage, false, 2147483647, true);
			
			prepare();
			
			addEventListener(Event.ENTER_FRAME, __onEnterFrame, false, 0, true);
		}
		
		public function prepare():void {
			// Intentionally left blank.
		}
		
		public function update():void {
			// Intentionally left blank.
		}
		
		//
		// GET AND SET
		//
		
		static public function get state():State {
			return FLMaker.__state;
		}
		
		static public function getBitmap(image:Class):Bitmap {
			if ((image in __bitmapCache) == false) {
				return __bitmapCache[image] = (new image) as Bitmap;
			} else {
				return __bitmapCache[image];
			}
		}
		
		static public function getBitmapData(image:Class):BitmapData {
			return FLMaker.getBitmap(image).bitmapData;
		}
		
		static public function getSound(sound:Class):Sound {
			if ((sound in __soundCache) == false) {
				return __soundCache[sound] = (new sound) as Sound;
			} else {
				return __soundCache[sound];
			}
		}
	}
}