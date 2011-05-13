package com.pathosverdes.core.navigation
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.pathosverdes.asual.swfaddress.SWFAddress;
	import com.pathosverdes.asual.swfaddress.SWFAddressEvent;
	import com.pathosverdes.core.manager.PagesManager;
	import com.pathosverdes.core.navigation.event.NavigationEvent;
	import com.pathosverdes.core.view.page.PageBase;
	import com.pathosverdes.core.view.structure.StructureBase;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

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
		}
		
		public function initNavigation():void
		{
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, onChangePage);
		}
		
		private function onChangePage(e:SWFAddressEvent):void
		{			
			if(isAddressValid())
			{
				addNewPage();
			}
			else
			{
				SWFAddress.setValue(PagesManager.START_PAGE);
			}
		}
		
		private function addNewPage():void
		{
			if(currentPageName != "")
			{
				finishCurrentPage();
			}
			else
			{
				currentPageName = newPageName;
				initNewPage();
			}
		}
		
		private function isAddressValid():Boolean
		{
			newPageName = SWFAddress.getValue().split("/")[1];
			
			if(newPageName.length == 0)
			{
				return false
			}
			
			return true;
		}
		
		private function initNewPage():void
		{
			StructureBase.PAGE_HOLDER.addChild(getPage(newPageName));
			
			navigationEvent = new NavigationEvent(NavigationEvent.CHANGE);
			navigationEvent.currentPage = getPage(newPageName);
			
			dispatchEvent(navigationEvent);
		}
		
		private function finishCurrentPage():void
		{			
			getPage(currentPageName).addEventListener(PageBase.FINISH, onPageFinish);
			getPage(currentPageName).finishPage();
		}
		
		private function onPageFinish(e:Event):void
		{
			currentPageName = newPageName;
			e.currentTarget.removeEventListener(PageBase.FINISH, onPageFinish);
			removePage(e.currentTarget as PageBase);
			initNewPage();
		}
		
		private function removePage(page:PageBase):void
		{
			if(page.parent == StructureBase.PAGE_HOLDER)
			{
				StructureBase.PAGE_HOLDER.removeChild(page);
			}
		}
		
		public function goto(pageName:String):void
		{
			SWFAddress.setValue(pageName);
		}
		
		private function getPage(pageName:String):PageBase
		{
			for(var i:int = 0; i < PagesManager.Instance.totalPages; i++)
			{
				if(PagesManager.Instance.arPages[i].name == pageName)
				{
					return PagesManager.Instance.arPages[i];
				}
			}
			
			throw new Error("PathosVerdes error: There is no page with the name " + pageName);
			return;
		}
	}
}