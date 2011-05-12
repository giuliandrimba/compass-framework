package pages.home.mvc
{
	import pathosverdes.Pages;
	import pathosverdes.core.navigation.Navigation;

	public class HomeController
	{
		public function HomeController()
		{
			
		}
		
		public function gotoAbout():void
		{
			Navigation.Instance.goto(Pages.ABOUT);
		}
	}
}