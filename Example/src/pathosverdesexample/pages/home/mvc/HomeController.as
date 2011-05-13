package pathosverdesexample.pages.home.mvc
{
	import com.pathosverdes.core.navigation.Navigation;
	
	import pathosverdesexample.pages.Pages;

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