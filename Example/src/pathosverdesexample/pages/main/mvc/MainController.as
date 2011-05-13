package pathosverdesexample.pages.main.mvc
{
	import com.pathosverdes.core.navigation.Navigation;
	import com.pathosverdes.core.navigation.event.NavigationEvent;
	
	import pathosverdesexample.pages.Pages;

	public class MainController
	{
		public function MainController()
		{
			init();
		}
		
		private function init():void
		{
			Navigation.Instance.addEventListener(NavigationEvent.CHANGE, onPageChange);	
		}
		
		public function gotoHome():void
		{
			//The class "Pages" has nothing to do with the framework,
			//it is used just to store the pages variables and names
			Navigation.Instance.goto(Pages.HOME);
		}
		
		public function gotoAbout():void
		{
			Navigation.Instance.goto(Pages.ABOUT);
		}
		
		public function gotoContact():void
		{
			Navigation.Instance.goto(Pages.CONTACT);
		}
		
		private function onPageChange(e:NavigationEvent):void
		{
			trace(e.currentPage.name);
		}
	}
}