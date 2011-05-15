package com.compass.core.navigation
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.compass.asual.swfaddress.SWFAddress;
	import com.compass.asual.swfaddress.SWFAddressEvent;
	import com.compass.core.manager.PagesManager;
	import com.compass.core.navigation.event.NavigationEvent;
	import com.compass.core.view.page.PageBase;
	import com.compass.core.view.structure.StructureBase;
	
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
		
		private var _currentPageName:String = "";
		private var newPageName:String = "";
		private var navigationEvent:NavigationEvent;
		private var canRemoveActivedPage:Boolean = true;
		private var _unremovedPageName:String = "";
		private var abovePageName:String = "";
		
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
			trace("isAddressValid() = ", isAddressValid());
			
			if(isAddressValid())
			{
				openNewPage();
			}
			else
			{
				setPage(PagesManager.START_PAGE);
			}
		}
		
		private function openNewPage():void
		{
			if(isThereAnyPage() && canRemoveActivedPage == false)
			{
				addPopupPage();
			}
			else if(isThereAnyPage())
			{
				finishCurrentActivedPage();
			}
			else
			{
				addFirstPage();
			}
		}
		
		private function addFirstPage():void
		{
			_currentPageName = newPageName;
			initNewPage();
		}
		
		private function addPopupPage():void
		{
			_unremovedPageName = _currentPageName;
			_currentPageName = newPageName;
			initNewPage();
		}
		
		private function isAddressValid():Boolean
		{
			var values:Array = SWFAddress.getValue().split("/");
			newPageName = values[1];
			
			if(newPageName.length == 0)
			{
				return false
			}
			
			return true;
		}
		
		private function finishCurrentActivedPage():void
		{			
			getPageClass(_currentPageName).addEventListener(PageBase.FINISH, onActivedPageFinish);
			getPageClass(_currentPageName).finishPage();
		}
		
		private function onActivedPageFinish(e:Event):void
		{
			_currentPageName = newPageName;
			e.currentTarget.removeEventListener(PageBase.FINISH, onActivedPageFinish);
			initNewPage();
			
			addAbovePageIfExists();
		}
		
		private function addAbovePageIfExists():void
		{
			if(canRemoveActivedPage == false)
			{
				setAbovePage(abovePageName);
			}
		}
		
		private function initNewPage():void
		{
			startPageIfIsNotStarted();
			updateNavigationEvent();
		}
		
		public function goto(pageName:String, removeCurrentPage:Boolean = true):void
		{
			canRemoveActivedPage = removeCurrentPage;
			
			if(dontRemoveCurrentPage())
			{
				checkIfCanSetPageNow(pageName);
			}
			else
			{
				if(isCurrentPageAbove())
				{
					newPageName = pageName;
					finishCurrentActivedPage();
				}
				else
				{
					setPage(pageName);
				}
			}
		}
		
		private function isCurrentPageAbove():Boolean
		{
			if(_currentPageName != getCurrentAddressValue())
			{
				return true
			}
			
			return false;
		}
		
		private function checkIfCanSetPageNow(pageName:String):void
		{
			abovePageName = pageName;
			
			if(ifCurrentPageIsFinishing() == false)
			{
				setAbovePage(abovePageName);
			}
		}
		
		private function dontRemoveCurrentPage():Boolean
		{
			if(canRemoveActivedPage == false)
			{
				return true;
			}
			
			return false;
		}
		
		private function getPageClass(pageName:String):PageBase
		{
			for(var i:int = 0; i < PagesManager.Instance.totalPages; i++)
			{
				if(PagesManager.Instance.arPages[i].name == pageName)
				{
					return PagesManager.Instance.arPages[i];
				}
			}
			
			throw new Error("Compass error: There is no page with the name " + pageName);
			return;
		}
		
		private function ifCurrentPageIsFinishing():Boolean
		{
			if(getPageClass(_currentPageName).hasEventListener(PageBase.FINISH))
			{
				return true;
			}
			
			return false;
		}
		
		private function setPage(pageName:String):void
		{
			SWFAddress.setValue(pageName);	
		}
		
		private function setAbovePage(pageName:String):void
		{
			newPageName = pageName;
			openNewPage();
		}
		
		private function startPageIfIsNotStarted():void
		{
			if(newPageName != _unremovedPageName)
			{
				getPageClass(newPageName).startPage();
			}
			else
			{
				_unremovedPageName = "";
			}
		}
		
		private function updateNavigationEvent():void
		{
			navigationEvent = new NavigationEvent(NavigationEvent.CHANGE);
			navigationEvent.currentPage = getPageClass(newPageName);
			dispatchEvent(navigationEvent);
		}
		
		private function isThereAnyPage():Boolean
		{
			if(_currentPageName != "")
			{
				return true;
			}
			
			return false;
		}
		
		public function getCurrentAddressValue():String
		{
			return SWFAddress.getValue().split("/")[1];
		}
		
		public function get currentPageName():String
		{
			return _currentPageName;
		}

		public function get unremovedPageName():String
		{				
			return _unremovedPageName;
		}
	}
}