package gal.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;

	import gal.delegates.RunSequenceDelegate;
	import gal.events.RunSequenceEvent;
	import gal.responders.RunSequenceResponder;

	/**
	 * The run sequence command class. Invoked when run command event is dispatched to the
	 * front controller. It casts received event to the relevant type and calls delegate for
	 * the business logic
	 */
	public class RunSequenceCommand implements ICommand {
		public function execute(eventParam: CairngormEvent): void {
			var event: RunSequenceEvent = eventParam as RunSequenceEvent;

			var delegate: RunSequenceDelegate = new RunSequenceDelegate(new RunSequenceResponder());
			delegate.runSequence();
		}
	}
}

