package com.flmaker.net {
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.DataEvent;
    import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.XMLSocket;
	
	import com.flmaker.events.FLMakerEvent;
	import com.flmaker.system.BaseObject;
	
	public class Connection extends BaseObject {
		protected var _socket:XMLSocket;
		protected var _address:IPAddress;
		protected var _isConnected:Boolean;
		protected var _sendOnConnect:Array;
		
		public function Connection(host:String, port:int):void {
			_socket = new XMLSocket(host,port);
			_isConnected = false;
			_sendOnConnect = new Array;
			
			_socket.addEventListener(Event.CONNECT, _onConnect);
			_socket.addEventListener(Event.CLOSE, _onClose);
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, _onData);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onSecurityError);
		}
		
		protected function _onConnect(event:Event):void {
			_isConnected = true;
			
			var end:uint = _sendOnConnect.length;
			for (var i:uint = 0; i < end; i++) {
				_socket.send(_sendOnConnect[i]);
			}
			
			if (end) {
				_sendOnConnect.splice(0, end);
			}
		}
		
		protected function _onClose(event:Event):void {
			_isConnected = false;
		}
		
		protected function _onData(event:ProgressEvent):void {
			//
		}
		
		protected function _onIOError(event:IOErrorEvent):void {
			//
		}
		
		protected function _onSecurityError(event:SecurityErrorEvent):void {
			//
		}
		
		public function send(data:*):void {
			if (_isConnected) {
				_socket.send(data);
			} else {
				_sendOnConnect.push(data);
			}
		}
		
		//
		// GET AND SET
		//
		
		public function get address():IPAddress {
			return _address;
		}
	}
}