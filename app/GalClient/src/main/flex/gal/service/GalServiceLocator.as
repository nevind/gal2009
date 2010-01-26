package gal.service {
	import com.adobe.cairngorm.business.ServiceLocator;

	public class GalServiceLocator extends ServiceLocator {
		private var galService: GalService = GalService.getInstance();

		public function GalServiceLocator() {
			super();
		}

		public function getGalService(): GalService {
			return galService;
		}

	}
}

