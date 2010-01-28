package gal.responders {
	import com.adobe.cairngorm.business.ServiceLocator;

	import gal.model.GalModelLocator;
	import gal.model.enums.MainViewStates;
	import gal.service.GalServiceLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * Class that responds to logout response from the server. It handles
	 * proper results being send back, as well as faults.
	 */
	public class LogoutResponder implements IResponder {
		public function LogoutResponder() {

		}

		/**
		 * Logout result handler - switches to login view.
		 */
		public function result(data: Object): void {
			var resultEvent: ResultEvent = data as ResultEvent;
			var service: Object = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			var model: GalModelLocator = GalModelLocator.getInstance();

			model.mainViewState = MainViewStates.LOGIN_VIEW;
		}

		/**
		 * Logout fault handler - in case of logout failure, all connections
		 * are disconnected from the channel set. User receives a proper alert.
		 */
		public function fault(data: Object): void {
			var faultEvent: FaultEvent = data as FaultEvent;
			var service: Object = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			var model: GalModelLocator = GalModelLocator.getInstance();

			model.mainViewState = MainViewStates.LOGIN_VIEW;
			service.disconnectAll();

			Alert.show("Application fault - please restart and try again", "");
		}

	}
}

