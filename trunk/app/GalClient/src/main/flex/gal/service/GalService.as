package gal.service {
	import gal.dto.RequestDTO;
	import gal.model.GalModelLocator;

	import mx.controls.Alert;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.mxml.RemoteObject;

	/**
	 * Main service class - used for backend communication.
	 */
	public class GalService {
		/**
		 * Constructor
		 */
		public function GalService() {
		}

		/**
		 * Service 'singleton' variable.
		 */
		private static var galService: GalService = new GalService();

		/**
		 * A remote object used for backend method calls. Call logic facilitated by BlazeDS data services gateway.
		 * 
		 * @private
		 */
		private var remoteService: RemoteObject = new RemoteObject;

		/**
		 * Channel set used for communication. In GAL it incorporates only one AMF channel.
		 * In some applications a failover channel is included.
		 * 
		 * @private
		 */
		private var channelSet: ChannelSet = new ChannelSet();

		/**
		 * Model locator
		 * 
		 * @private
		 */
		private var model: GalModelLocator = GalModelLocator.getInstance();

		/**
		 * Method used for setting the endpoint the frontend communicates with.
		 * It initiates the channel set, assigns it to the remote object and 
		 * sets relevant properties of the remote object.
		 */
		public function setEndpoint(url: String, destination: String): void {
			channelSet = new ChannelSet();
			var myAMF: Channel = new AMFChannel("gal-amf", url + "amf");
			channelSet.addChannel(myAMF);
			remoteService.channelSet = channelSet;

			remoteService.destination = destination;
			remoteService.showBusyCursor = true;
			remoteService.makeObjectsBindable = true;
		}

		/**
		 * Method for acquiring the singleton of this service class.
		 */
		public static function getInstance(): GalService {
			return galService;
		}

		/**
		 * Method used to log into the backend via remote object
		 */
		public function login(responder: IResponder, login: String, password: String): void {
			channelSet.login(login, password).addResponder(responder);
		}

		/**
		 * Method used to log out of the backend via remote object
		 */
		public function logout(responder: IResponder): void {
			channelSet.logout().addResponder(responder);
			channelSet.disconnectAll();
		}

		/**
		 * Method used to disconnect all channels in case of failure.
		 */
		public function disconnectAll(): void {
			channelSet.disconnectAll();
		}

		/**
		 * Method used to send a 'run sequence' request via remote object to the backend.
		 * It triggers computation and waits for the output asynchronously. The result is
		 * then processed by a responder object and presented in the output view to the user.
		 */
		public function runSequence(responder: IResponder): void {
			var requestDto: RequestDTO = new RequestDTO();
			requestDto.sequence1 = model.sequence1;
			requestDto.sequence2 = model.sequence2;
			requestDto.gapPenalty = model.gapPenalty;
			requestDto.similarityMatrix = model.getConfusionMatrixAsArray();
			remoteService.getOperation("runSequence").send(requestDto).addResponder(responder);
		}
	}
}

