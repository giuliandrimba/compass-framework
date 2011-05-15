package com.compass.core.view.page
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.compass.core.view.structure.StructureBase;
	
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
		
		public function startPage():void
		{
			StructureBase.PAGE_HOLDER.addChild(this);
		}
		
		protected function removeFromDisplayList():void
		{
			if(this.parent == StructureBase.PAGE_HOLDER)
			{
				StructureBase.PAGE_HOLDER.removeChild(this);
			}
		}
		
		private function dispatchFinishEvent():void
		{
			this.dispatchEvent(new Event(PageBase.FINISH));
		}
		
		private function onAdded(e:Event):void
		{
			onAddedToStage();
		}
		
		protected function onAddedToStage():void
		{
			
		}
		
		public function finishPage():void
		{
			removeFromDisplayList();
			dispatchFinishEvent();
		}
	}
}