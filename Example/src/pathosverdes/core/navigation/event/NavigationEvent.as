package pathosverdes.core.navigation.event
{
	import flash.events.Event;
	
	import pathosverdes.core.page.Page;
	
	public class NavigationEvent extends Event
	{
		public static const CHANGE:String = "change";
		
		public var currentPage:Page;
		
		public function NavigationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}