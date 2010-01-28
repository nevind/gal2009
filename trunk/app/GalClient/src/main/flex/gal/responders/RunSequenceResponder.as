package gal.responders {
	import gal.dto.ResultDTO;
	import gal.model.GalModelLocator;
	import gal.model.enums.ActionViewStates;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * Class that responds to run sequence response from the server. It handles
	 * proper results being send back, as well as faults.
	 */
	public class RunSequenceResponder implements IResponder {
		public function RunSequenceResponder() {
		}

		/**
		 * Run sequence result handler - it modifies the data in model locator
		 * to reflect computation results. Switches the action view to results
		 * panel.
		 */
		public function result(data: Object): void {
			var model: GalModelLocator = GalModelLocator.getInstance();
			var resultEvent: ResultEvent = data as ResultEvent;
			var result: ResultDTO = resultEvent.result as ResultDTO;

			model.similarity = result.similarityValue;
			model.outputSequence = result.listOfSequences;
			model.refreshOutput();
			model.actionViewState = ActionViewStates.OUTPUT_VIEW;
		}

		/**
		 * Run sequence fault handler.
		 */ 
		public function fault(data: Object): void {
			var faultEvent: FaultEvent = data as FaultEvent;
			Alert.show("Fault: " + faultEvent.message, "");
		}
	}
}

