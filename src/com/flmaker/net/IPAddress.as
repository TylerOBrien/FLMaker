package com.flmaker.net {
	public class IPAddress extends Object {
		//
		// STATIC
		//
		
		/*static private function __doSumArray(src:Array):void {
			return uint(src[0] << 24) + uint(src[1] << 16) + uint(src[2] << 8) + uint(src[3]);
		}*/
		
		//
		// INSTANCE
		//

		protected var _host:String;
		protected var _port:int;
		
		public function IPAddress(host:String="", port:int=0):void {
			_host = host;
			_port = port;
		}
		
		/*public function fromString(value:String):void {
			_value = IPAddress.__doSumArray(value.split("."));
		}
		
		public function toInt():int {
			return _value;
		}
		
		public function toString():String {
			var a:int = (__mValue >>> 24) & 255;
			var b:int = (__mValue >>> 16) & 255;
			var c:int = (__mValue >>> 8) & 255;
			var d:int = __mValue & 255;
			
			return (a+"."+b+"."+c+"."+d);
		}*/
		
		//
		// GET AND SET
		//
		
		public function get host():String {
			return _host;
		}
		
		public function get port():int {
			return _port;
		}
	}
}