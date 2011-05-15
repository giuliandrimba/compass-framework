package com.compass.core.view.structure
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.compass.core.navigation.Navigation;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class StructureBase extends Sprite
	{			
		public static var PAGE_HOLDER:MovieClip;
		public static var MAIN_HOLDER:MovieClip;
		
		public function StructureBase()
		{
			
		}
		
		protected function startCompass():void
		{
			dispatchEvent(new StructureBaseEvent(StructureBaseEvent.STARTED));
			Navigation.Instance.initNavigation();
		}
	}
}