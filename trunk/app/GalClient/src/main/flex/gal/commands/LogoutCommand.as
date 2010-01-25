package gal.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import gal.delegates.LogoutDelegate;
	import gal.events.LogoutEvent;
	import gal.responders.LogoutResponder;
	
	
	public class LogoutCommand implements ICommand
	{
		
		public function execute(eventParam: CairngormEvent):void
		{
			var event:LogoutEvent = eventParam as LogoutEvent;
			
			var delegate:LogoutDelegate = new LogoutDelegate(new LogoutResponder())
			delegate.logout();
		}
		
	}
}