package gal.view.events
{
	import flash.events.Event;
	
	public class RunEvent extends Event
	{
		public function RunEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		// Define static constant.
		public static const RUN:String = "run";
		
		
		// Override the inherited clone() method.
		override public function clone():Event {
			return new RunEvent(type, bubbles, cancelable);
		}
		
	}
}