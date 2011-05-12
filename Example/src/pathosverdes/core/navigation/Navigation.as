package pathosverdes.core.navigation
{
	import com.giuliandrimba.utils.RemoveObject;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import pathosverdes.Pages;
	import pathosverdes.core.navigation.event.NavigationEvent;
	import pathosverdes.core.page.Page;
	import pathosverdes.core.structure.Structure;
	import pathosverdes.libs.asual.swfaddress.SWFAddress;
	import pathosverdes.libs.asual.swfaddress.SWFAddressEvent;

	public class Navigation extends EventDispatcher
	{
		private static var instance:Navigation;
		private static var allowInstantiation:Boolean;
		
		public static function get Instance():Navigation
		{
			if (instance == null) 
			{
				allowInstantiation = true;
				instance = new Navigation();
				allowInstantiation = false;
			}
			
			return instance;
		}
		
		private var currentPageName:String = "";
		private var newPageName:String = "";
		private var navigationEvent:NavigationEvent;
		
		public function Navigation()
		{
			if (!allowInstantiation)
			{
				throw new Error("Error: Instantiation failed: Use Pages.getInstance() instead of new.");
			}
			else
			{
				SWFAddress.addEventListener(SWFAddressEvent.CHANGE, onChangePage);
			}
		}
		
		private function onChangePage(e:SWFAddressEvent):void
		{
			if(isAddressValid())
			{
				addNewPage();
			}
			else
			{
				SWFAddress.setValue(Pages.START_PAGE);
			}
		}
		
		private function addNewPage():void
		{
			if(currentPageName != "")
			{
				finishCurrentPage();
				currentPageName = newPageName;
			}
			else
			{
				trace(newPageName);
				//currentPageName = newPageName;
				//initNewPage();
			}
		}
		
		private function isAddressValid():Boolean
		{
			newPageName = SWFAddress.getValue().split("/")[1];
			
			trace("NEW PAGE = ", Structure.PAGE_HOLDER);
			
			if(newPageName.length == 0)
			{
				return false
			}
			
			return true;
		}
		
		private function initNewPage():void
		{
			Structure.PAGE_HOLDER.addChild(getPage(newPageName));
			
			navigationEvent = new NavigationEvent(NavigationEvent.CHANGE);
			navigationEvent.currentPage = getPage(newPageName);
			
			dispatchEvent(navigationEvent);
		}
		
		private function finishCurrentPage():void
		{			
			getPage(currentPageName).addEventListener(Page.FINISH, onPageFinish);
			getPage(currentPageName).startTransitionOut();
		}
		
		private function onPageFinish(e:Event):void
		{
			e.currentTarget.removeEventListener(Page.FINISH, onPageFinish);
			Structure.PAGE_HOLDER.removeChild(e.currentTarget as Page);
			
			initNewPage();
		}
		
		public function goto(pageName:String):void
		{
			SWFAddress.setValue(pageName);
		}
		
		private function getPage(pageName:String):Page
		{
			for(var i:int = 0; i < Pages.Instance.totalPages; i++)
			{
				if(Pages.Instance.arPages[i].name == pageName)
				{
					return Pages.Instance.arPages[i];
				}
			}
			
			return null;
		}
	}
}