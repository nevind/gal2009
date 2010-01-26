package gal.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;

	import gal.delegates.RunSequenceDelegate;
	import gal.events.RunSequenceEvent;
	import gal.responders.RunSequenceResponder;

	public class RunSequenceCommand implements ICommand {
		public function execute(eventParam: CairngormEvent): void {
			var event: RunSequenceEvent = eventParam as RunSequenceEvent;

			var delegate: RunSequenceDelegate = new RunSequenceDelegate(new RunSequenceResponder());
			delegate.runSequence();
		}
	}
}

