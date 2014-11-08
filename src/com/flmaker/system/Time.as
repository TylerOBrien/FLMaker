package com.flmaker.system {
	import flash.utils.getTimer;
	
	public class Time extends Object {
		static private var __current:uint = 0;
		static private var __delta:uint = 0;
		static private var __previous:uint = 0;
		
		static public function update():void {
			Time.__previous = Time.__current;
			Time.__current = getTimer();
			Time.__delta = (Time.__current - Time.__previous);
		}
		
		static public function get elapsed():uint {
			return getTimer();
		}
		
		static public function get current():uint {
			return Time.__current;
		}
		
		static public function get delta():uint {
			return Time.__delta;
		}
		
		static public function get previous():uint {
			return Time.__previous;
		}
	}
}