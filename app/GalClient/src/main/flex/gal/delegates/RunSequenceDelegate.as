package gal.delegates {
	import com.adobe.cairngorm.business.ServiceLocator;

	import gal.service.GalServiceLocator;

	import mx.rpc.IResponder;

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

