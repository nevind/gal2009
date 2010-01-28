package gal.responders {
	import gal.model.GalModelLocator;
	import gal.model.enums.MainViewStates;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * Class that responds to login response from the server. It handles
	 * proper results being send back, as well as faults.
	 */
	public class LoginResponder implements IResponder {
		public function LoginResponder() {

		}

		/**
		 * Result handler - clears data in the model and switches the application to the main view.
		 * User needs to have the ROLE_ADMIN role configured in Spring security configuratin file.
		 */
		public function result(data: Object): void {
			var resultEvent: ResultEvent = data as ResultEvent;
			var model: GalModelLocator = GalModelLocator.getInstance();
			model.clear();
			if (resultEvent.result.authorities.indexOf("ROLE_ADMIN") >= 0) {
				model.mainViewState = MainViewStates.MAIN_VIEW;
			} else {
				Alert.show("Invalid authentication attempt", "");
			}
		}

		/**
		 * Login fault handler
		 */
		public function fault(data: Object): void {
			var faultEvent: FaultEvent = data as FaultEvent;
			Alert.show("Invalid authentication attempt", "");
		}

	}
}

