package pathosverdes
{
	import pages.about.mvc.AboutView;
	import pages.contact.mvc.ContactView;
	import pages.home.mvc.HomeController;
	import pages.home.mvc.HomeModel;
	import pages.home.mvc.HomeView;

	public class Pages
	{
		public static const HOME:String = "home";
		public static const ABOUT:String = "about";
		public static const CONTACT:String = "contact";
		
		public var oHome:HomeView;
		public var oAbout:AboutView;
		public var oContact:ContactView;
		
		public var totalPages:int;
		
		public var arPages:Array;
		
		private static var instance:Pages;
		private static var allowInstantiation:Boolean;
		
		public static var START_PAGE:String = HOME;
		
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
		
		public function Pages()
		{
			if (!allowInstantiation)
			{
				throw new Error("Error: Instantiation failed: Use Pages.getInstance() instead of new.");
			}
			else
			{
				setUpPages();
			}
		}
		
		private function setUpPages():void
		{
			oHome = new HomeView(new HomeController(), new HomeModel());
			oHome.name = HOME;
			oAbout = new AboutView();
			oAbout.name = ABOUT;
			oContact = new ContactView();
			oContact.name = CONTACT;
			
			arPages = new Array();
			arPages.push(oHome);
			arPages.push(oAbout);
			arPages.push(oContact);
			
			totalPages = arPages.length;
		}
	}
}