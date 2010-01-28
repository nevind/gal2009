package gal.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;

	import gal.delegates.LogoutDelegate;
	import gal.events.LogoutEvent;
	import gal.responders.LogoutResponder;


	/**
	 * The run logout class. Invoked when logut event is dispatched to the
	 * front controller. It casts received event to the relevant type and calls delegate for
	 * the business logic
	 */
	public class LogoutCommand implements ICommand {

		public function execute(eventParam: CairngormEvent): void {
			var event: LogoutEvent = eventParam as LogoutEvent;

			var delegate: LogoutDelegate = new LogoutDelegate(new LogoutResponder())
			delegate.logout();
		}

	}
}

