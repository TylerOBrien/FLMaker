package com.flmaker.events {
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import com.flmaker.system.BaseObject;
	
	public class FLMakerEvent extends Event {
		//
		// STATIC
		//
		
		static public const ON_COMPLETE:String = "onComplete";
		static public const ACTIVE:String = "onActive";
		static public const ANIMATE:String = "onAnimate";
		static public const ADDED_TO_CANVAS:String = "onAddedToCanvas";
		static public const CHANGE:String = "onChange";
		static public const HIDE:String = "onHide";
		static public const HIT_TEST:String = "onHitTest";
		static public const INACTIVE:String = "onInActive";
		static public const MOUSE_OUT:String = "onMouseOut";
		static public const MOUSE_OVER:String = "onMouseOver";
		static public const REMOVED_FROM_CANVAS:String = "onRemovedFromCanvas";
		static public const RESET:String = "onReset";
		static public const SHOW:String = "onShow";
		static public const TICK:String = "onTick";
		static public const UPDATE:String = "onUpdate";
		
		static public function make(entity:*, type:String):FLMakerEvent {
			var result:FLMakerEvent = new FLMakerEvent(type);
			result._entity = entity;
			
			return result;
		}
		
		//
		// INSTANCE
		//
		
		protected var _entity:*;
		protected var _time:uint;
		
		public function FLMakerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void {
			_time = getTimer();
			super(type, bubbles, cancelable);
		}
		
		//
		// GET AND SET
		//
		
		public function get entity():* {
			return _entity;
		}
		
		public function get time():uint {
			return _time;
		}
	}
}