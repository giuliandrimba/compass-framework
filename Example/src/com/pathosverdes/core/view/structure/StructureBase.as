package com.pathosverdes.core.view.structure
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.pathosverdes.core.navigation.Navigation;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;

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