package pathosverdesexample.pages.contact.mvc
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ContactModel extends EventDispatcher
	{
		public function ContactModel(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}