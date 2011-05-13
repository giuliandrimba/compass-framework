package com.pathosverdes.core.view.structure
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.giuliandrimba.utils.ExternalTrace;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import com.pathosverdes.core.navigation.Navigation;
	import com.pathosverdes.core.view.page.PageBase;

	public class StructureBase extends Sprite
	{		
		public static var PAGE_HOLDER:MovieClip;
		
		public function StructureBase()
		{
			
		}
		
		protected function startPathosVerdes(pageHolder:MovieClip):void
		{
			PAGE_HOLDER = pageHolder;
			dispatchEvent(new StructureBaseEvent(StructureBaseEvent.STARTED));
			Navigation.Instance.initNavigation();
		}
	}
}