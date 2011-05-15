package compassexample.pages.signup
{
	import com.compass.core.navigation.Navigation;
	import com.compass.core.view.page.PageBase;
	import com.compass.core.view.structure.StructureBase;
	import com.giuliandrimba.data.loaddata.LoadData;
	import com.giuliandrimba.data.loaddata.LoadDataType;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class SignUp extends PageBase
	{
		private var loadSwf:LoadData;
		private var main:MovieClip;
		private var btnClose:MovieClip;
		
		public function SignUp()
		{
			
		}
		
		override public function startPage():void
		{
			StructureBase.MAIN_HOLDER.addChild(this);
		}
		
		override protected function onAddedToStage():void
		{
			loadSwf = new LoadData(LoadDataType.OBJECT);
			loadSwf.addEventListener(Event.COMPLETE, onLoadSwf);
			loadSwf.load("swf/pages/signup.swf");
		}
		
		private function onLoadSwf(e:Event):void
		{
			main = loadSwf.data as MovieClip;
			btnClose = main.btnClose;
			btnClose.addEventListener(MouseEvent.MOUSE_DOWN, onBtnCloseDown);
			
			addChild(main);
		}
		
		private function onBtnCloseDown(e:MouseEvent):void
		{
			var pageName:String = Navigation.Instance.unremovedPageName;
			
			Navigation.Instance.goto(pageName);
		}
		
		override protected function removeFromDisplayList():void
		{
			StructureBase.MAIN_HOLDER.removeChild(this);
		}
		
		override public function finishPage():void
		{
			btnClose.removeEventListener(MouseEvent.MOUSE_DOWN, onBtnCloseDown);
			removeChild(main);
			main = null;
			btnClose = null;
			super.finishPage();
		}
	}
}