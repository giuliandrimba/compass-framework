package
{
	import flash.display.Sprite;
	
	import pathosverdes.core.page.Page;
	import pages.main.mvc.MainController;
	import pages.main.mvc.MainModel;
	import pages.main.mvc.MainView;
	
	[SWF(width="550", height="400")]
	public class SiteFramework extends Sprite
	{
		private var main:MainView;
		private var arPages:Array;
		
		public function SiteFramework()
		{
			setStructure();
		}
		
		private function setStructure():void
		{
			main = new MainView(new MainController(), new MainModel());
			addChild(main);
		}
	}
}