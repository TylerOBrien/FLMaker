package com.flmaker.display {
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import com.flmaker.events.FLMakerEvent;
	import com.flmaker.geom.Dimensions;
	import com.flmaker.geom.Orientation;
	import com.flmaker.system.BaseObject;
	
	public class Displayable extends BaseObject {
		protected var _parent:Displayable;
		protected var _size:Dimensions;
		protected var _orientation:Orientation;
		protected var _matrix:Matrix;
		protected var _isActive:Boolean;
		
		public function Displayable(parent:Displayable=null):void {
			_parent = parent;
			_size = new Dimensions;
			_orientation = new Orientation;
			_matrix = new Matrix;
		}
		
		public function update():void {
			if (_isActive) {
				_matrix.identity();
				_matrix.translate(_orientation.anchor.x, _orientation.anchor.y);
				_matrix.scale(_orientation.scale.x, _orientation.scale.y);
				_matrix.rotate(_orientation.rotation);
				_matrix.translate(_orientation.position.x, _orientation.position.y);
			}
		}
		
		public function rotate(angle:Number):void {
			_orientation.rotation += angle;
		}
		
		public function scale(x:Number, y:Number):void {
			_orientation.scale.x += x;
			_orientation.scale.y += y;
		}
		
		public function translate(x:Number, y:Number):void {
			_orientation.position.x += x;
			_orientation.position.y += y;
		}
		
		//
		// GET AND SET
		//
		
		public function set orientation(value:Orientation):void {
			_orientation = value;
		}
	}
}