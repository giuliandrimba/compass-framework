package pathosverdesexample.pages.contact.mvc
{
	import com.giuliandrimba.data.loaddata.LoadData;
	import com.giuliandrimba.data.loaddata.LoadDataType;
	import com.greensock.TweenLite;
	import com.pathosverdes.core.view.page.PageBase;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class ContactView extends PageBase
	{
		private var loadSwf:LoadData;
		private var main:MovieClip;
		
		public function ContactView()
		{
			
		}
		
		override public function startPage():void
		{
			loadSwf = new LoadData(LoadDataType.OBJECT);
			loadSwf.addEventListener(Event.COMPLETE, onLoadComplete);
			loadSwf.load("swf/pages/contact.swf");
		}
		
		private function onLoadComplete(e:Event):void
		{
			main = loadSwf.data as MovieClip;
			main.alpha = 0;
			addChild(main);
			TweenLite.to(main,0.5,{alpha:1});
		}
		
		override public function finishPage():void
		{
			TweenLite.to(main,0.5,{alpha:0, onComplete:onCompleteOutro});
		}
		
		private function onCompleteOutro():void
		{
			// Here ou can clean your view for memory purpose
			TweenLite.killTweensOf(main);
			removeChild(main);
			main = null;
			super.dispatchFinishEvent();
		}
	}
}