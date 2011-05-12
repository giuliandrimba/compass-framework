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
		private var _currentPage:int = 0;
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
		
		public function get currentPage():int
		{
			return _currentPage + 1;
		}
		
		private function get totalPages():int
		{
			return _totalPages;
		}
		
		public function nextPage():Array
		{
			_currentPage <= _totalPages?_currentPage ++:_currentPage;
			return arPages[_currentPage];
		}
		
		public function previousPage():Array
		{
			_currentPage > 0?_currentPage --:_currentPage;
			return arPages[_currentPage];
		}
		
		public function gotoPage(page:int):Array
		{
			if (page - 1 >= _totalPages || page - 1 < 0)
			{
				throw new Error("Could not find page number " + (page - 1));
			}
			else
			{
				return arPages[page - 1];
			}
			
			return arPages[currentPage];
		}
		
		public function gotoLastPage():Array
		{
			return arPages[totalPages - 1];
		}
		
		public function gotoFirstPage():Array
		{
			return arPages[0];
		}
	}

}