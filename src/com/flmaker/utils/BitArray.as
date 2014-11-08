package com.flmaker.utils {
	public class BitArray extends Object {
		protected var _data:Vector.<int>;

		public function fromInteger(value:*):void {
			_data = new Vector.<int>(Algorithm.numBits(value));
			
			for (var i:uint = 0, j:int = (_data.length-1); j >= 0; i++, j--) {
				_data[i] = (value & (1 << j)) ? 1 : 0;
			}
		}
		
		public function fromHex(value:String, signed:Boolean=true):void {
			fromInteger(signed ? int(value) : uint(value));
		}
		
		public function toArray():Array {
			var result:Array = new Array;

			for each (var i:int in _data){
				result.push(i);
			}

			return result;
		}
		
		public function toInteger(signed:Boolean=true):* {
			var bitValue:uint = (_data.length-1);
			var result:*;

			if (signed) result = int(0);
			else result = uint(0);

			for each (var i:Boolean in _data) {
				if (i) result += (1 << bitValue);
				bitValue--;
			}

			return result;
		}
		
		public function toHex(signed:Boolean=true):String {
			return Algorithm.itoh(toInteger(signed));
		}
		
		public function getBit(position:uint):int {
			return _data[(_data.length-1) - position];
		}
		
		public function setBit(position:uint, value:int):void {
			_data[(_data.length-1) - position] = value?1:0;
		}
	}
}