package com.giuliandrimba.loadObject
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LoadObjectEvent extends Event 
	{
		public static const LOAD_OPEN:String = "loadOpen";
		public static const LOAD_COMPLETE:String = "loadComplete";
		public static const LOAD_ERROR:String = "loadError";
		public static const LOAD_PROGRESS:String = "loadProgress";
		
		private var _obj:Object;
		
		public function LoadObjectEvent(type:String,obj:Object, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			_obj = obj;			
		} 
		
		public override function clone():Event 
		{ 
			return new LoadObjectEvent(type, _obj, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("LoadObjectEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get obj():Object { return _obj; }
		
		public function set obj(value:Object):void 
		{
			_obj = value;
		}
		
	}
	
}