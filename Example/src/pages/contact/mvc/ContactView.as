package pages.contact.mvc
{
	import com.giuliandrimba.loadObject.LoadObject;
	import com.giuliandrimba.loadObject.LoadObjectEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import pathosverdes.core.page.Page;
	
	public class ContactView extends Page
	{
		private var loadSwf:LoadObject;
		
		public function ContactView()
		{
			
		}
		
		override public function startTransitionIn():void
		{
			loadSwf = new LoadObject();
			loadSwf.addEventListener(LoadObjectEvent.LOAD_COMPLETE, onLoadComplete);
			loadSwf.load("swf/contact.swf");
		}
		
		private function onLoadComplete(e:LoadObjectEvent):void
		{
			addChild(loadSwf.content);
		}
	}
}