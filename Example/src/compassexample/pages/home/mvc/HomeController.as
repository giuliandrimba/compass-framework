package compassexample.pages.home.mvc
{
	import com.compass.core.navigation.Navigation;
	
	import compassexample.pages.Pages;

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