package com.compass.core.manager
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.compass.core.view.page.PageBase;

	public class PagesManager
	{	
		public var totalPages:int;
		
		public var arPages:Array;
		
		private static var instance:PagesManager;
		private static var allowInstantiation:Boolean;
		
		public static var START_PAGE:String = "";
		
		public static function get Instance():PagesManager
		{
			if (instance == null) 
			{
				allowInstantiation = true;
				instance = new PagesManager();
				allowInstantiation = false;
			}
			
			return instance;
		}
		
		public function PagesManager()
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
		
		public function setStartPage(pageName:String):void
		{
			START_PAGE = pageName;
		}
		
		public function addPage(page:PageBase):void
		{
			if(START_PAGE == "")
			{
				START_PAGE = page.name;
			}
			
			arPages.push(page);
			totalPages = arPages.length;
		}
		
		private function init():void
		{
			arPages = new Array();
		}
	}
}