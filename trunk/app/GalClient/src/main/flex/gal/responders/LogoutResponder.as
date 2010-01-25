package gal.responders
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import gal.model.GalModelLocator;
	import gal.model.enums.ActionViewStates;
	import gal.service.GalServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LogoutResponder implements IResponder
	{
		public function LogoutResponder()
		{
			
		}
		
		public function result(data: Object):void
		{
			var resultEvent:ResultEvent = data as ResultEvent;
			var service:Object = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			var model:GalModelLocator = GalModelLocator.getInstance();
			
			model.clear();
		}
		
		public function fault(data: Object):void
		{
			var faultEvent:FaultEvent = data as FaultEvent;
			var service:Object = (ServiceLocator.getInstance() as GalServiceLocator).getGalService();
			var model:GalModelLocator = GalModelLocator.getInstance();
			
			model.clear();
			service.disconnectAll();
			
			Alert.show("Application fault - please restart and try again", "");
		}
		
	}
}