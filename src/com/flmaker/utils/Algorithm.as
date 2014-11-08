package com.flmaker.utils {
	public class Algorithm extends Object {
		static public const NOT_FOUND:uint = uint(~0);
		
		static public function itoh(value:*):String {
			return "0x" + value.toString(16).toUpperCase();
		}
		
		static public function firstNotEqual(source:Array, value:*):uint {
			return NOT_FOUND;
		}
		
		static public function lastNotEqual(source:Array, value:*):uint {
			return NOT_FOUND;
		}
		
		static public function random(min:int, max:int):int {
			return Math.floor(Math.random() * (1+(max-min))) + min;
		}
		
		/*
		 * numBits() returns uint
			* @param  
		 * Returns the number of bits required to store (in integer format) the passed value.
		 * */
		static public function numBits(value:int):uint {
			var result:uint = 0;
			
			while (value > 0) {
				value *= 0.5;
				result++;
			}
			
			return result;
		}
	}
}