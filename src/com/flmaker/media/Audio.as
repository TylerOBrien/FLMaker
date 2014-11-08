package com.flmaker.media {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	import com.flmaker.FLMaker;
	import com.flmaker.system.BaseObject;

	public class Audio extends BaseObject {
		//
		// STATIC
		//
		
		public static function fromEmbedded(sound:Class):Audio {
			return new Audio(FLMaker.getSound(sound));
		}
		
		//
		// INSTANCE
		//
		
		protected var _sound:Sound;
		protected var _channel:SoundChannel;
		protected var _transform:SoundTransform;
		protected var _isPlaying:Boolean;
		protected var _numLoops:int;
		protected var _previousTimePosition:Number;
		
		public function Audio(sound:Sound):void {
			_channel = new SoundChannel;
			_transform = new SoundTransform;
			_numLoops = 0;
			_previousTimePosition = 0;
		}
		
		public function clone():Audio {
			var output:Audio = new Audio(_sound);
			
			output._channel = new SoundChannel;
			output._transform = new SoundTransform(volume,pan);
			output._numLoops = _numLoops;
			output._previousTimePosition = _previousTimePosition;
			
			return output;
		}
		
		public function start(startTime:Number=0, numLoops:int=0):void {
			if (_isPlaying) {
				_channel.stop();
			}
			
			_numLoops = numLoops;
			_channel = _sound.play(startTime, numLoops, _transform);
			_isPlaying = true;
		}
		
		public function play():void {
			if (_isPlaying) {
				_channel.stop();
			}
			
			_channel = _sound.play(_previousTimePosition, _numLoops, _transform);
			_isPlaying = true;
		}
		
		public function pause():void {
			if (_isPlaying) {
				_previousTimePosition = _channel.position;
				_channel.stop();
				_isPlaying = false;
			}
		}
		
		public function stop():void {
			_channel.stop();
			_previousTimePosition = 0;
			_isPlaying = false;
		}
		
		//
		// GET AND SET
		//
		
		public function get volume():Number {
			return _transform.volume;
		}
		
		public function get pan():Number {
			return _transform.pan;
		}
		
		public function setLevels(ltol:Number, ltor:Number, rtol:Number, rtor:Number):void {
			_transform.leftToLeft = ltol;
			_transform.leftToRight = ltor;
			_transform.rightToLeft = rtol;
			_transform.rightToRight = rtor;
			_channel.soundTransform = _transform;
		}
		
		
		public function set pan(pan:Number):void {
			_transform.pan = pan;
			_channel.soundTransform = _transform;
		}
		
		public function set volume(volume:Number):void {
			_transform.volume = volume;
			_channel.soundTransform = _transform;
		}
		
		public function set levels(levels:Array):void {
			_transform.leftToLeft = levels[0];
			_transform.leftToRight = levels[1];
			_transform.rightToLeft = levels[2];
			_transform.rightToRight = levels[3];
			_channel.soundTransform = _transform;
		}
		
		public function setPan(pan:Number):void {
			_transform.pan = pan;
			_channel.soundTransform = _transform;
		}
		
		public function setVolume(volume:Number):void {
			_transform.volume = volume;
			_channel.soundTransform = _transform;
		}
	}
}