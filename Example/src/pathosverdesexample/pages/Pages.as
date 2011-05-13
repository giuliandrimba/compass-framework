package pathosverdesexample.pages
{
	import pathosverdesexample.pages.about.mvc.AboutView;
	import pathosverdesexample.pages.contact.mvc.ContactView;
	import pathosverdesexample.pages.home.mvc.HomeController;
	import pathosverdesexample.pages.home.mvc.HomeModel;
	import pathosverdesexample.pages.home.mvc.HomeView;

	public class Pages
	{	
		private static var instance:Pages;
		private static var allowInstantiation:Boolean;
		
		public static function get Instance():Pages
		{
			if (instance == null) 
			{
				allowInstantiation = true;
				instance = new Pages();
				allowInstantiation = false;
			}
			
			return instance;
		}
		
		public static const HOME:String = "home";
		public static const ABOUT:String = "about";
		public static const CONTACT:String = "contact";
		
		public var oHome:HomeView;
		public var oAbout:AboutView;
		public var oContact:ContactView;
		
		public function Pages()
		{
			if (!allowInstantiation)
			{
				throw new Error("Error: Instantiation failed: Use Pages.getInstance() instead of new.");
			}
			else
			{
				init();
			}
		}
		
		private function init():void
		{
			oHome = new HomeView(new HomeController(), new HomeModel());
			oHome.name = HOME;
			oAbout = new AboutView();
			oAbout.name = ABOUT;
			oContact = new ContactView();
			oContact.name = CONTACT;
		}
	}
}