package gal.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import gal.service.GalServiceLocator;
	
	import mx.rpc.IResponder;
	
	public class LoginDelegate
	{
		private var responder : IResponder;
		private var service: Object;
		
		public function LoginDelegate(responder: IResponder)
		{
			this.service = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			this.responder = responder;
		}
		
		public function login(login:String, password:String):void
		{
			service.login(this.responder, login, password);
		}
	}
}