package com.compass
{
	/**
	 * ...
	 * @author Giulian Drimba
	 */
	
	import com.compass.core.manager.PagesManager;
	
	import compassexample.pages.Pages;

	public class CompassSetup
	{
		public function CompassSetup()
		{
			//Here you can add your pages inside pathosverdes and set initial page
			//Example:
			//Use: PagesManager.Instance.addPage(page) to add a page
			//Use: PagesManager.Instance.setStartPage('pageName') to set initial page
			
			PagesManager.Instance.addPage(Pages.Instance.oHome);
			PagesManager.Instance.addPage(Pages.Instance.oAbout);
			PagesManager.Instance.addPage(Pages.Instance.oContact);
			PagesManager.Instance.addPage(Pages.Instance.oSignUp);
			PagesManager.Instance.setStartPage(Pages.HOME);
		}
	}
}