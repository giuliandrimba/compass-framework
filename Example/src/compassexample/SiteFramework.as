package compassexample
{
	import com.compass.CompassSetup;
	
	import flash.display.Sprite;
	
	import compassexample.pages.main.mvc.MainController;
	import compassexample.pages.main.mvc.MainModel;
	import compassexample.pages.main.mvc.MainView;
	
	/* 
	
	ALL THE CLASSES INSIDE THE PACKAGE "pathosverdesexample"
	HAS NOTHING TO DO WITH THE "PathosVerdes" framework, THEY ARE JUST THE SITE'S
	CLASSES THAT USE THE FRAMEWORK TO NAVIGATE BETWEEN THE PAGES
	
	*/
	
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
			//In this class, you add pages and set the initial page of pathosverdes
			var setup:CompassSetup = new CompassSetup();
			
			//Here you instantiate the Structure page (the parent of the pages)
			main = new MainView(new MainController(), new MainModel());
			addChild(main);
		}
	}
}