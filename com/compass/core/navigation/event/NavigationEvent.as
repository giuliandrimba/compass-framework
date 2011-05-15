package com.compass.core.navigation.event
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import flash.events.Event;
	
	import com.compass.core.view.page.PageBase;
	
	public class NavigationEvent extends Event
	{
		public static const CHANGE:String = "change";
		
		public var currentPage:PageBase;
		
		public function NavigationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}