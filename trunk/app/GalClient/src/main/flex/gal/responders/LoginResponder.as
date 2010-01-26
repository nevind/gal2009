package gal.responders {
	import gal.model.GalModelLocator;
	import gal.model.enums.MainViewStates;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoginResponder implements IResponder {
		public function LoginResponder() {

		}

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

		public function fault(data: Object): void {
			var faultEvent: FaultEvent = data as FaultEvent;
			Alert.show("Invalid authentication attempt", "");
		}

	}
}

