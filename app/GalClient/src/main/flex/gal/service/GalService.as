package gal.service
{
	import gal.dto.TestDto;
	
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class GalService
	{
		public function GalService()
		{
		}
		
		private static var galService:GalService = new GalService();
		
		private var remoteService:RemoteObject = new RemoteObject;
		
		private var channelSet:ChannelSet = new ChannelSet();

		public function setEndpoint(url:String, destination:String):void
		{
			channelSet = new ChannelSet(); 
			var myAMF:Channel = new AMFChannel("gal-amf", url + "amf");
			channelSet.addChannel(myAMF);
			remoteService.channelSet = channelSet; 
 
			remoteService.destination = destination;
			remoteService.showBusyCursor = true;
			remoteService.makeObjectsBindable = true;		
		}
		
		public static function getInstance():GalService
		{
			return galService;
		}
		
		// Do przerobienia na Swiz, odpowiednia obsluga przez beany i respondery
		public function login(responder:IResponder, login:String, password:String):void
		{
			return channelSet.login(login,password).addResponder(responder);
		}
		
		public function logout(responder:IResponder):void
		{
			return channelSet.logout().addResponder(responder);
		}
		
		public function test(testDto:TestDto):void
		{
			remoteService.getOperation("testCall").send(testDto);
		}
		
		public function disconnectAll():void
		{
			channelSet.disconnectAll();
		}

	}
}