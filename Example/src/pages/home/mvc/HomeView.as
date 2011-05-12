package pages.home.mvc
{
	import com.giuliandrimba.loadObject.LoadObject;
	import com.giuliandrimba.loadObject.LoadObjectEvent;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import pathosverdes.core.page.Page;
	
	public class HomeView extends Page
	{
		private var initMessage:String;
		
		private var loadSwf:LoadObject;
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
			initMessage = "Ola";
		}
		
		private function onLoadComplete(e:LoadObjectEvent):void
		{
			main = loadSwf.content as MovieClip;
			addChild(loadSwf.content);
			
			btnAbout = MovieClip(loadSwf.content).btnAbout;
			btnAbout.addEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);
			
			TweenLite.to(main,0.5,{alpha:1});
		}
		
		private function onBtnDown(e:MouseEvent):void
		{
			controller.gotoAbout();
		}
		
		override public function startTransitionIn():void
		{
			loadSwf = new LoadObject();
			loadSwf.addEventListener(LoadObjectEvent.LOAD_COMPLETE, onLoadComplete);
			loadSwf.load("swf/home.swf");
		}
		
		override public function startTransitionOut():void
		{
			TweenLite.to(main,0.5,{alpha:0, onComplete:onCompleteOutro});
		}
		
		private function onCompleteOutro():void
		{
			main = null;
			removeChild(loadSwf.content);
			btnAbout = null;
			
			finish();
		}
	}
}