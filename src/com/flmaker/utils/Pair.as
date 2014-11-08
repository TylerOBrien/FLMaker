package com.flmaker.utils {
	import com.flmaker.system.BaseObject;
	
	public class Pair extends BaseObject {
		public var first:*;
		public var second:*;
		
		public function Pair(first:*, second*):void {
			this.first = first;
			this.second = second;
		}
	}
}