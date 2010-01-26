package gal.service {
	import gal.dto.RequestDTO;
	import gal.model.GalModelLocator;

	import mx.controls.Alert;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.mxml.RemoteObject;

	public class GalService {
		public function GalService() {
		}

		private static var galService: GalService = new GalService();

		private var remoteService: RemoteObject = new RemoteObject;

		private var channelSet: ChannelSet = new ChannelSet();

		private var model: GalModelLocator = GalModelLocator.getInstance();

		public function setEndpoint(url: String, destination: String): void {
			channelSet = new ChannelSet();
			var myAMF: Channel = new AMFChannel("gal-amf", url + "amf");
			channelSet.addChannel(myAMF);
			remoteService.channelSet = channelSet;

			remoteService.destination = destination;
			remoteService.showBusyCursor = true;
			remoteService.makeObjectsBindable = true;
		}

		public static function getInstance(): GalService {
			return galService;
		}

		public function login(responder: IResponder, login: String, password: String): void {
			channelSet.login(login, password).addResponder(responder);
		}

		public function logout(responder: IResponder): void {
			channelSet.logout().addResponder(responder);
			channelSet.disconnectAll();
		}

		public function disconnectAll(): void {
			channelSet.disconnectAll();
		}

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

