package gal.delegates {
	import com.adobe.cairngorm.business.ServiceLocator;

	import gal.service.GalServiceLocator;

	import mx.rpc.IResponder;

	/**
	 * A delegate for invoking business logic behind logout command. The delegate
	 * invokes business logic of the service and relays output handling to a proper responder.
	 */
	public class LogoutDelegate {
		private var responder: IResponder;

		private var service: Object;

		public function LogoutDelegate(responder: IResponder) {
			this.service = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			this.responder = responder;
		}

		public function logout(): void {
			service.logout(this.responder);
		}
	}
}

