package com.flmaker.system {
	import flash.events.EventDispatcher;
	
	public class BaseObject extends EventDispatcher {
		private const __uid:UniqueId = new UniqueId;
		
		public function identical(object:BaseObject):Boolean {
			return __uid == object.__uid;
		}
		
		//
		// GET AND SET
		//
		
		public function get uid():String {
			return __uid.id;
		}
	}
}