package gal.events {
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.events.Event;

	/**
	 * Run sequence cairngorm (business) event dispatched from input view. It triggers
	 * the run sequence command via the front controller.
	 */
	public class RunSequenceEvent extends CairngormEvent {
		public static const RUN_SEQUENCE: String = "gal.events.RunSequenceEvent";

		public function RunSequenceEvent() {
			super(RunSequenceEvent.RUN_SEQUENCE);
		}

		override public function clone(): Event {
			return new RunSequenceEvent();
		}
	}
}

