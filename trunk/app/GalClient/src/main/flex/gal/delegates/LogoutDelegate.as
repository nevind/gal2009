package gal.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import gal.service.GalServiceLocator;
	
	import mx.rpc.IResponder;
	
	public class LogoutDelegate
	{
		private var responder : IResponder;
		private var service: Object;
		
		public function LogoutDelegate(responder: IResponder)
		{
			this.service = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			this.responder = responder;
		}
		
		public function logout():void
		{
			service.logout(this.responder);
		}
	}
}