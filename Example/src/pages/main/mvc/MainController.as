package pages.main.mvc
{
	import pathosverdes.Pages;
	import pathosverdes.core.navigation.Navigation;
	import pathosverdes.core.navigation.event.NavigationEvent;

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