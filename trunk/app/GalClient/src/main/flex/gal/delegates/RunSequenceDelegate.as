package gal.delegates {
	import com.adobe.cairngorm.business.ServiceLocator;

	import gal.service.GalServiceLocator;

	import mx.rpc.IResponder;

	/**
	 * A delegate for invoking business logic behind run sequence command. The delegate
	 * invokes business logic of the service and relays output handling to a proper responder.
	 */
	public class RunSequenceDelegate {
		private var responder: IResponder;

		private var service: Object;

		public function RunSequenceDelegate(responder: IResponder) {
			this.service = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			this.responder = responder;
		}

		public function runSequence(): void {
			service.runSequence(this.responder);
		}
	}
}

