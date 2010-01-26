package gal.responders {
	import gal.dto.ResultDTO;
	import gal.model.GalModelLocator;
	import gal.model.enums.ActionViewStates;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class RunSequenceResponder implements IResponder {
		public function RunSequenceResponder() {
		}

		public function result(data: Object): void {
			var model: GalModelLocator = GalModelLocator.getInstance();
			var resultEvent: ResultEvent = data as ResultEvent;
			var result: ResultDTO = resultEvent.result as ResultDTO;

			model.similarity = result.similarityValue;
			model.outputSequence = result.listOfSequences;
			model.refreshOutput();
			model.actionViewState = ActionViewStates.OUTPUT_VIEW;
		}

		public function fault(data: Object): void {
			var faultEvent: FaultEvent = data as FaultEvent;
			Alert.show("Fault: " + faultEvent.message, "");
		}
	}
}

