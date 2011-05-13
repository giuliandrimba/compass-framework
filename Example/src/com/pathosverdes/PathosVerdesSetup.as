package com.pathosverdes
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.pathosverdes.core.manager.PagesManager;
	
	import pathosverdesexample.pages.Pages;

	public class PathosVerdesSetup
	{
		public function PathosVerdesSetup()
		{
			//Here you can add your pages inside pathosverdes and set initial page
			//Example:
			//Use: PagesManager.Instance.addPage(page) to add a page
			//Use: PagesManager.Instance.setStartPage('pageName') to set initial page
			
			PagesManager.Instance.addPage(Pages.Instance.oHome);
			PagesManager.Instance.addPage(Pages.Instance.oAbout);
			PagesManager.Instance.addPage(Pages.Instance.oContact);
			PagesManager.Instance.setStartPage(Pages.HOME);
		}
	}
}