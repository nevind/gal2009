package gal.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;

	import gal.delegates.LoginDelegate;
	import gal.events.LoginEvent;
	import gal.responders.LoginResponder;


	public class LoginCommand implements ICommand {

		/**
		 * The run login class. Invoked when login event is dispatched to the
		 * front controller. It casts received event to the relevant type and calls delegate for
		 * the business logic
		 */
		public function execute(eventParam: CairngormEvent): void {
			var event: LoginEvent = eventParam as LoginEvent;

			var delegate: LoginDelegate = new LoginDelegate(new LoginResponder())
			delegate.login(event.login, event.password);
		}

	}
}

