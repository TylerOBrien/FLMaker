package com.flmaker.utils {
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import com.flmaker.events.FLMakerEvent;
	import com.flmaker.system.BaseObject;
	
	public class Tween extends BaseObject {
		//
		// STATIC
		//
		
		static private var __pool:Dictionary = new Dictionary;
		
		static public function push(object:*, key:String, operator:String, value:*, length:uint, over:Boolean=false):String {
			var tween:Tween = new Tween(object, key, operator, value, length, over);
			__pool[tween.uid] = tween;
			return tween.uid;
		}
		
		static public function pop(uid:String):void {
			delete __pool[uid];
		}
		
		static public function update():void {
			for each (var tween:Tween in __pool) {
				tween.update();
			}
		}
		
		static public function getTween(uid:String):Tween {
			return __pool[uid];
		}
		
		//
		// INSTANCE
		//
		
		protected var _object:*;
		protected var _key:String;
		protected var _operator:String;
		protected var _value:*;
		protected var _endValue:*;
		protected var _length:uint;
		protected var _endTime:uint;
		protected var _isComplete:Boolean;
		
		public function Tween(object:*, key:String, operator:String, value:*, length:uint, constant:Boolean=true):void {
			_object = object;
			_key = key;
			_value = constant ? value : Number(value/(length/30));
			_endValue = value;
			_length = length;
			_operator = operator;
			_endTime = (getTimer() + _length);
			_isComplete = false;
		}
		
		public function update():void {
			if (getTimer() <= _endTime) {
				if (_operator == "+=") {
					_object[_key] += _value;
				} else if (_operator == "-=") {
					_object[_key] -= _value;
				}
			} else if (_isComplete == false) {
				_object[_key] = _endValue;
				delete __pool[uid];
				_isComplete = true;
				dispatchEvent(FLMakerEvent.make(this, FLMakerEvent.ON_COMPLETE));
			}
		}
	}
}