package gal.events {
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.events.Event;

	public class LoginEvent extends CairngormEvent {
		public static const LOGIN: String = "gal.events.LoginEvent";

		public var login: String;

		public var password: String;

		public function LoginEvent(login: String, password: String) {
			super(LoginEvent.LOGIN);
			this.login = login;
			this.password = password;
		}

		override public function clone(): Event {
			return new LoginEvent(login, password);
		}

	}
}

