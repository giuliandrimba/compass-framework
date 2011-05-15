package compassexample.pages
{
	import compassexample.pages.about.mvc.AboutView;
	import compassexample.pages.contact.mvc.ContactView;
	import compassexample.pages.home.mvc.HomeController;
	import compassexample.pages.home.mvc.HomeModel;
	import compassexample.pages.home.mvc.HomeView;
	import compassexample.pages.signup.SignUp;

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
		public static const SIGN_UP:String = "signup";
		
		public var oHome:HomeView;
		public var oAbout:AboutView;
		public var oContact:ContactView;
		public var oSignUp:SignUp;
		
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
			oSignUp = new SignUp();
			oSignUp.name = SIGN_UP;
		}
	}
}