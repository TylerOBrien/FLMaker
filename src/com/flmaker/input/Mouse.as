package com.flmaker.input {
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Mouse extends Object {
		static private var __x:Number = 0;
		static private var __y:Number = 0;
		static private var __isMoving:Boolean = false;
		static private var __isOverStage:Boolean = false;
		
		static public function onClick(event:MouseEvent):void {
			
		}
		
		static public function onMouseDown(event:MouseEvent):void {
			
		}
		
		static public function onMouseUp(event:MouseEvent):void {
			
		}
		
		static public function onMouseWheel(event:MouseEvent):void {
			
		}
		
		static public function onMove(event:MouseEvent):void {
			Mouse.__x = event.stageX;
			Mouse.__y = event.stageY;
			Mouse.__isMoving = true;
			Mouse.__isOverStage = true;
		}
		
		static public function onLeaveStage(event:Event):void {
			Mouse.__isOverStage = false;
		}
		
		static public function reset():void {
			Mouse.__isMoving = false;
		}
		
		static public function get x():Number {
			return Mouse.__x;
		}
		
		static public function get y():Number {
			return Mouse.__y;
		}
	}
}