package com.giuliandrimba.data.loaddata
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import com.giuliandrimba.data.loaddata.LoadDataType;
	import flash.system.LoaderContext;
	import flash.display.Loader;

	public class LoadData extends EventDispatcher
	{
		private var urlRequest:URLRequest;
		private var urlLoader:URLLoader;
		private var loader:Loader;
		private var loaderContext:LoaderContext;
		
		private var _data:Object;
		private var dataType:String = "text";
			
		public function LoadData(dataType:String)
		{
			this.dataType = dataType;
		}
		
		public function load(url:String, loaderContext:LoaderContext = null):void
		{
			this.loaderContext = loaderContext;
			urlRequest = new URLRequest(url);
			
			switch(dataType)
			{
				case LoadDataType.TEXT:
					loadTextData();
					break;
				case LoadDataType.OBJECT:
					loadObjectData();
					break;
				default:
					throw new Error("Please, specify a dataType in the constructor");
					break;
			}
		}
		
		private function loadTextData():void
		{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, onCompleteText);
			urlLoader.addEventListener(Event.OPEN, onOpen);
			urlLoader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTP);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
			urlLoader.load(urlRequest);
		}
		
		private function loadObjectData():void
		{
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, onInit);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteObject);
			loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTP);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.contentLoaderInfo.addEventListener(Event.OPEN, onOpen);
			loader.contentLoaderInfo.addEventListener(Event.UNLOAD, onUnloadData);
			
			loader.load(urlRequest, loaderContext);
		}
		
		private function onCompleteText(e:Event):void
		{
			_data = e.currentTarget.data;
			dispatchEvent(e);
		}
		
		private function onCompleteObject(e:Event):void
		{
			_data = e.currentTarget.content;
			dispatchEvent(e);
		}
		
		private function onUnloadData(e:Event):void
		{
			dispatchEvent(e);
		}
		
		private function onInit(e:Event):void
		{
			dispatchEvent(e);
		}
		
		private function onOpen(e:Event):void
		{
			dispatchEvent(e);
		}
		
		private function onProgress(e:ProgressEvent):void
		{
			dispatchEvent(e);
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			dispatchEvent(e);
		}
		
		private function onHTTP(e:HTTPStatusEvent):void
		{
			dispatchEvent(e);
		}
	
		private function onIOError(e:IOErrorEvent):void
		{
			dispatchEvent(e);
		}
		
		public function get data():Object
		{
			return _data;
		}
	}
}