package compassexample.pages.main.mvc
{
	import com.compass.core.view.structure.StructureBase;
	import com.giuliandrimba.data.loaddata.LoadData;
	import com.giuliandrimba.data.loaddata.LoadDataType;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/** TO SET THIS CLASS TO STRUCTURE, IT HAS DO INHERT THE 'StructureBase' class **/
	
	public class MainView extends StructureBase
	{		
		private var btnHome:MovieClip;
		private var btnAbout:MovieClip;
		private var btnContact:MovieClip;
		private var btnSignUp:MovieClip;
		
		private var loadSwf:LoadData;
		
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
			loadSwf = new LoadData(LoadDataType.OBJECT);
			loadSwf.addEventListener(Event.COMPLETE, onLoadComplete);
			loadSwf.load("swf/pages/main.swf");
		}
		
		private function onLoadComplete(e:Event):void
		{
			var main:MovieClip = loadSwf.data as MovieClip;
			addChild(main);
			btnHome = main.btnHome;
			btnAbout = main.btnAbout;
			btnContact = main.btnContact;
			btnSignUp = main.btnSignUp;
			
			btnHome.addEventListener(MouseEvent.MOUSE_DOWN, onHomeDown,false,0,true);
			btnAbout.addEventListener(MouseEvent.MOUSE_DOWN, onAboutDown,false,0,true);
			btnContact.addEventListener(MouseEvent.MOUSE_DOWN, onContactDown,false,0,true);
			btnSignUp.addEventListener(MouseEvent.MOUSE_DOWN, onSignUpDown,false,0,true);
			
			PAGE_HOLDER = main.pageHolder;
			MAIN_HOLDER = main;
			
			super.startCompass();
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
		
		private function onSignUpDown(e:MouseEvent):void
		{
			controller.showSignUp();
		}
	}
}