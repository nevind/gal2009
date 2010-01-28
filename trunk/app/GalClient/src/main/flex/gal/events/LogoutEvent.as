package gal.events {
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.events.Event;

	/**
	 * Logout cairngorm (business) event dispatched from header panel. It triggers
	 * the logout command via the front controller.
	 */
	public class LogoutEvent extends CairngormEvent {
		public static const LOGOUT: String = "gal.events.LogoutEvent";

		public function LogoutEvent() {
			super(LogoutEvent.LOGOUT);
		}

		override public function clone(): Event {
			return new LogoutEvent();
		}

	}
}

