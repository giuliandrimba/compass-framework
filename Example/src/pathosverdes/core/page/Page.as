package pathosverdes.core.page
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Page extends Sprite
	{
		public static const FINISH:String = "finish:";
		
		public function Page()
		{
			init();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function init():void
		{
			
		}
		
		protected function finish():void
		{
			dispatchEvent(new Event(FINISH));
		}
		
		private function onAdded(e:Event):void
		{
			startTransitionIn();
		}
		
		public function startTransitionIn():void
		{
			
		}
		
		public function startTransitionOut():void
		{
			finish();
		}
	}
}