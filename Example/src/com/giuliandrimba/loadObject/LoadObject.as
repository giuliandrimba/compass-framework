package com.giuliandrimba.loadObject
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.display.DisplayObject;
	import flash.system.LoaderContext;
	
	public class LoadObject extends EventDispatcher
	{
		private var _urlObject:String;
		private var _loaderObject:Loader;
		private var _urlObjectRequest:URLRequest;
		private var _content:DisplayObject;
		private var _loaderContext:LoaderContext;
		
		public function LoadObject()
		{
			
		}
		public function load($url:String,$loaderContext:LoaderContext = null):void
		{
			_loaderContext = $loaderContext;
			_urlObjectRequest = new URLRequest($url);
			_loaderObject = new Loader();
			_loaderObject.contentLoaderInfo.addEventListener(Event.INIT, loadInit)
			_loaderObject.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgress)
			_loaderObject.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete)
			_loaderObject.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
			_loaderObject.load(_urlObjectRequest, _loaderContext);
			
		}

		private function loadInit(e:Event):void
		{
			dispatchEvent(new LoadObjectEvent(LoadObjectEvent.LOAD_OPEN, "init"));
		}
		private function loadProgress(e:Event):void
		{
			dispatchEvent(new LoadObjectEvent(LoadObjectEvent.LOAD_PROGRESS, "loading"));
		}
		private function loadComplete(e:Event):void
		{
			_content = e.currentTarget.content as DisplayObject
			dispatchEvent(new LoadObjectEvent(LoadObjectEvent.LOAD_COMPLETE, "completed"));
		}
		private function loadError(e:IOErrorEvent):void
		{
			dispatchEvent(new LoadObjectEvent(LoadObjectEvent.LOAD_ERROR, "the object cannot be find"));
		}
		
		//SET GET
		
		public function set content(pValue:DisplayObject):void
		{
			_content = pValue;
		}
		public function get content():DisplayObject
		{
			return _content;
		}
	}
}