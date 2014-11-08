package com.flmaker.input 
{	
	import flash.utils.Dictionary;
	public class Key extends Object {	
		static public const BACKSPACE:int   = 8;
		static public const TAB:int         = 9;
		static public const ENTER:int       = 13;
		static public const SHIFT:int       = 16;
		static public const CTRL:int        = 17;
		static public const PAUSE_BREAK:int = 19;
		static public const CAPSLOCK:int    = 20;
		static public const ESC:int         = 27;
		static public const SPACEBAR:int    = 32;
		static public const PAGE_UP:int     = 33;
		static public const PAGE_DOWN:int   = 34;
		static public const END:int         = 35;
		static public const HOME:int        = 36;
		static public const LEFT:int        = 37;
		static public const UP:int          = 38;
		static public const RIGHT:int       = 39;
		static public const DOWN:int        = 40;
		static public const INSERT:int      = 45;
		static public const DELETE:int      = 46;
		static public const NUMLOCK:int     = 144;
		static public const SCRLK:int       = 145;
		static public const A:int           = 65;
		static public const B:int 			= 66;
		static public const C:int 			= 67;
		static public const D:int 			= 68;
		static public const E:int 			= 69;
		static public const F:int 			= 70;
		static public const G:int 			= 71;
		static public const H:int 			= 72;
		static public const I:int 			= 73;
		static public const J:int 			= 74;
		static public const K:int 			= 75;
		static public const L:int 			= 76;
		static public const M:int 			= 77;
		static public const N:int 			= 78;
		static public const O:int 			= 79;
		static public const P:int 			= 80;
		static public const Q:int 			= 81;
		static public const R:int 			= 82;
		static public const S:int 			= 83;
		static public const T:int 			= 84;
		static public const U:int 			= 85;
		static public const V:int 			= 86;
		static public const W:int 			= 87;
		static public const X:int 			= 88;
		static public const Y:int 			= 89;
		static public const Z:int 			= 90;
		static public const NUMBER0:int		= 48;
		static public const NUMBER1:int 	= 49;
		static public const NUMBER2:int 	= 50;
		static public const NUMBER3:int 	= 51;
		static public const NUMBER4:int 	= 52;
		static public const NUMBER5:int 	= 53;
		static public const NUMBER6:int 	= 54;
		static public const NUMBER7:int 	= 55;
		static public const NUMBER8:int 	= 56;
		static public const NUMBER9:int 	= 57;
		static public const F1:int 			= 112;
		static public const F2:int 			= 113;
		static public const F3:int 			= 114;
		static public const F4:int 			= 115;
		static public const F5:int 			= 116;
		static public const F6:int 			= 117;
		static public const F7:int 			= 118;
		static public const F8:int 			= 119;
		static public const F9:int 			= 120;
		static public const F11:int 		= 122;
		static public const F12:int 		= 123;
		static public const F13:int 		= 124;
		static public const F14:int 		= 125;
		static public const F15:int 		= 126;
		
		static private function __getState(haystack:Dictionary, args:Array):Boolean {
			var matchesFound:uint = 0;
			var isCurrentIndexFound:Boolean;
			var i:uint; //Used to track the index position while iterating through the args Array.
			var indexAsInt:int; //The index value of "haystack" (during the iteration) in integer form.
			
			for (var index:String in haystack) {
				isCurrentIndexFound = false;
				i = 0;
				indexAsInt = int(index);
				
				for each (var key:int in args) {
					//Look for a matching character code between the index in "haystack" and the value in "args".
					//If there is a match, and the haystack element is "true", then it is considered a success.
					if (indexAsInt == key && haystack[index] == true) {
						isCurrentIndexFound = true;
						args.splice(i, 1);
						break;
					} else {
						i++;
					}
				}
				
				if (isCurrentIndexFound == false) {
					break;
				}
			}
			
			return (matchesFound == args.length);
		}

		static public function isDown(args:*):Boolean {
			if (args is uint) {
				return Keyboard.keysDown[args];
			} else {
				return Key.__getState(Keyboard.keysDown, args);
			}
		}
		
		static public function isPressed(args:*):Boolean {
			if (args is uint) {
				return Keyboard.keysPressed[args];
			} else {
				return Key.__getState(Keyboard.keysPressed, args);
			}
		}
		
		static public function isReleased(args:*):Boolean {
			if (args is uint) {
				return Keyboard.keysReleased[args];
			} else {
				return Key.__getState(Keyboard.keysReleased, args);
			}
		}
	}
}