package gal.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	public class LogoutEvent extends CairngormEvent
	{
		public static const LOGOUT:String = "gal.events.LogoutEvent";
		
		public function LogoutEvent()
		{
			super(LogoutEvent.LOGOUT);
		}
		
		override public function clone():Event
		{
			return new LogoutEvent();
		}
		
	}
}