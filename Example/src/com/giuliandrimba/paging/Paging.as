package com.giuliandrimba.paging 
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	 
	public class Paging
	{
		private var arOriginalData:Array;
		private var arPages:Array;
		
		private var itensPerPage:int;
		private var _currentPageNumber:int = 0;
		private var _totalPages:int = 0;
		
		public function Paging(data:Array, itensPerPage:Number) 
		{
			arOriginalData = data;
			this.itensPerPage = itensPerPage;
			sliceArray();
		}
		
		private function sliceArray():void
		{
			arPages = new Array();
			for (var i:int = 0; i < arOriginalData.length; i++) 
			{
				if (i % itensPerPage == 0)
				{
					var newArray:Array = arOriginalData.slice(i, i + itensPerPage)
					arPages.push(newArray);
				}
			}
			
			_totalPages = arPages.length;
		}
		
		private function get totalPages():int
		{
			return _totalPages;
		}
		
		public function gotoNextPage():void
		{
			_currentPageNumber <= _totalPages?_currentPageNumber ++:_currentPageNumber;
		}
		
		public function gotoPreviousPage():void
		{
			_currentPageNumber > 0?_currentPageNumber --:_currentPageNumber;
		}
		
		public function gotoPage(pageNumber:int):void
		{
			if (pageNumber - 1 >= _totalPages || pageNumber - 1 < 0)
			{
				throw new Error("Could not find page number " + (pageNumber - 1));
			}
			else
			{
				_currentPageNumber = pageNumber - 1;
			}
		}
		
		public function get currentPage():Array
		{
			return arPages[_currentPageNumber];
		}
		
		public function get currentPageNumber():Number
		{
			return _currentPageNumber + 1;
		}
		
		public function gotoLastPage():void
		{
			_currentPageNumber = totalPages - 1;
		}
		
		public function gotoFirstPage():void
		{
			_currentPageNumber = 0;
		}
	}
}