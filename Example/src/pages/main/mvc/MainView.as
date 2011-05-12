package pages.main.mvc
{
	import com.giuliandrimba.loadObject.LoadObject;
	import com.giuliandrimba.loadObject.LoadObjectEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import pathosverdes.core.structure.Structure;
	
	public class MainView extends Structure
	{		
		private var btnHome:MovieClip;
		private var btnAbout:MovieClip;
		private var btnContact:MovieClip;
		
		private var loadSwf:LoadObject;
		
		private var controller:MainController;
		private var model:MainModel;
		
		public function MainView(controller:MainController, model:MainModel)
		{
			this.controller = controller;
			this.model = model;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			loadSwf = new LoadObject();
			loadSwf.addEventListener(LoadObjectEvent.LOAD_COMPLETE, onLoadComplete);
			loadSwf.load("swf/main.swf");
		}
		
		private function onLoadComplete(e:LoadObjectEvent):void
		{
			var main:MovieClip = loadSwf.content as MovieClip;
			addChild(loadSwf.content);
			btnHome = main.btnHome;
			btnAbout = main.btnAbout;
			btnContact = main.btnContact;
			
			btnHome.addEventListener(MouseEvent.MOUSE_DOWN, onHomeDown);
			btnAbout.addEventListener(MouseEvent.MOUSE_DOWN, onAboutDown);
			btnContact.addEventListener(MouseEvent.MOUSE_DOWN, onContactDown);
			
			PAGE_HOLDER = main.pageHolder;
			
			controller.gotoHome()
		}
		
		private function onHomeDown(e:MouseEvent):void
		{	
			controller.gotoHome();
		}
		
		private function onAboutDown(e:MouseEvent):void
		{
			controller.gotoAbout();
		}
		
		private function onContactDown(e:MouseEvent):void
		{
			controller.gotoContact();
		}
	}
}