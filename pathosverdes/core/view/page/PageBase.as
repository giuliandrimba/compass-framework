package com.pathosverdes.core.view.page
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class PageBase extends Sprite
	{
		public static const FINISH:String = "finish:";
		
		public function PageBase()
		{
			init();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function init():void
		{
			
		}
		
		protected function dispatchFinishEvent():void
		{
			dispatchEvent(new Event(FINISH));
		}
		
		private function onAdded(e:Event):void
		{
			startPage();
		}
		
		public function startPage():void
		{
			
		}
		
		public function finishPage():void
		{
			dispatchFinishEvent();
		}
	}
}