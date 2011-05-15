package com.compass.core.view.structure
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import flash.events.Event;
	
	public class StructureBaseEvent extends Event
	{
		public static const STARTED:String = "started";
		
		public function StructureBaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}