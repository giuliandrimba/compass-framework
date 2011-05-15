package compassexample.pages.about.mvc
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class AboutModel extends EventDispatcher
	{
		public function AboutModel(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}