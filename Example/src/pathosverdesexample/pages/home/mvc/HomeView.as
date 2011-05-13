package pathosverdesexample.pages.home.mvc
{
	import com.giuliandrimba.data.loaddata.LoadData;
	import com.giuliandrimba.data.loaddata.LoadDataType;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import com.pathosverdes.core.view.page.PageBase;
	
	public class HomeView extends PageBase
	{
		private var initMessage:String;
		
		private var loadSwf:LoadData;
		private var controller:HomeController;
		private var model:HomeModel;
		
		private var main:MovieClip;
		
		private var btnAbout:MovieClip;
		
		public function HomeView(controller:HomeController, model:HomeModel)
		{
			this.controller = controller;
			this.model = model;
		}
		
		override protected function init():void
		{
			//This function is called just 1 time, 
			//if you want to store variables, you can set them here
			
			initMessage = "Hello World";
		}
			
		//This function is called everytime that the page is started
		override public function startPage():void
		{
			loadSwf = new LoadData(LoadDataType.OBJECT);
			loadSwf.addEventListener(Event.COMPLETE, onLoadComplete);
			loadSwf.load("swf/pages/home.swf");
		}
		
		private function onLoadComplete(e:Event):void
		{
			main = loadSwf.data as MovieClip;
			main.alpha = 0;
			addChild(main);
			
			btnAbout = MovieClip(main).btnAbout;
			btnAbout.addEventListener(MouseEvent.MOUSE_DOWN, onBtnDown,false,0,true);
			
			TweenLite.to(main,0.5,{alpha:1});
		}
		
		private function onBtnDown(e:MouseEvent):void
		{
			controller.gotoAbout();
		}
		
		override public function finishPage():void
		{
			TweenLite.to(main,0.5,{alpha:0, onComplete:onCompleteOutro});
		}
		
		private function onCompleteOutro():void
		{
			TweenLite.killTweensOf(main);
			removeChild(main);
			main = null;
			btnAbout.removeEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);
			btnAbout = null;
			
			super.dispatchFinishEvent();
		}
	}
}