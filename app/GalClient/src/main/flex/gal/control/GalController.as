package gal.control {
	import com.adobe.cairngorm.control.FrontController;

	import gal.commands.LoginCommand;
	import gal.commands.LogoutCommand;
	import gal.commands.RunSequenceCommand;
	import gal.events.LoginEvent;
	import gal.events.LogoutEvent;
	import gal.events.RunSequenceEvent;

	public class GalController extends FrontController {
		public function GalController() {
			addCommand(LoginEvent.LOGIN, LoginCommand);
			addCommand(LogoutEvent.LOGOUT, LogoutCommand);
			addCommand(RunSequenceEvent.RUN_SEQUENCE, RunSequenceCommand);
		}

	}
}

