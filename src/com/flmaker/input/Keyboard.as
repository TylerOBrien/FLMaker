package com.flmaker.input {
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	
	public class Keyboard extends Object {
		static public var keysDown:Dictionary = new Dictionary;
		static public var keysPressed:Dictionary = new Dictionary;
		static public var keysReleased:Dictionary = new Dictionary;
		
		static public function reset():void {
			Keyboard.keysReleased = new Dictionary;
			for (var index:String in Keyboard.keysPressed) {
				Keyboard.keysPressed[index] = false;
			}
		}
		
		static public function onKeyPress(event:KeyboardEvent):void {
			Keyboard.keysDown[event.keyCode] = true;
			Keyboard.keysPressed[event.keyCode] = !(event.keyCode in Keyboard.keysPressed);
		}
		
		static public function onKeyRelease(event:KeyboardEvent):void {
			delete Keyboard.keysDown[event.keyCode];
			delete Keyboard.keysPressed[event.keyCode];
			
			Keyboard.keysReleased[event.keyCode] = true;
		}
	}
}