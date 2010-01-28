package gal.model {
	import com.adobe.cairngorm.model.IModelLocator;

	import flash.events.Event;
	import flash.events.EventDispatcher;

	import gal.model.enums.ActionViewStates;
	import gal.model.enums.MainViewStates;

	import mx.collections.ArrayCollection;

	/**
	 * Model locator class (according to Cairngorm microarchitecture). It serves as a data store,
	 * a source of binding for the views and user interaction.
	 */
	[Bindable]
	public class GalModelLocator extends EventDispatcher implements IModelLocator {
		public function GalModelLocator() {
			clear();
		}

		private static var galModelLocator: GalModelLocator = new GalModelLocator();

		/**
		 * Singleton instance getter.
		 */
		public static function getInstance(): GalModelLocator {
			return galModelLocator;
		}

		/**
		 * Method to clear the data and bound user input on login.
		 */
		public function clear(): void {
			mainViewState = MainViewStates.LOGIN_VIEW;
			actionViewState = ActionViewStates.INPUT_VIEW;
			confusionMatrix = new ArrayCollection([new ConfusionMatrixRow(), new ConfusionMatrixRow(), new ConfusionMatrixRow(), new ConfusionMatrixRow()]);
			gapPenalty = 0;
			similarity = 0;
			outputSequence = new ArrayCollection();
			_outputIndex = -1;
			sequence1 = "";
			sequence2 = "";
			dispatchEvent(new Event("sequenceSelectionChange"));
		}

		/**
		 * Utility method for refreshing the output view.
		 */
		public function refreshOutput():void{
			outputIndex = 0;
			dispatchEvent(new Event("sequenceSelectionChange"));
		}

		private var _mainViewState: Number;

		/**
		 * Modeled main view state. Possible states include 'login' and 'main' states.
		 */
		public function get mainViewState(): Number {
			return _mainViewState;
		}

		/**
		 * @private
		 */
		public function set mainViewState(_mainViewState: Number): void {
			this._mainViewState = _mainViewState;
		}

		private var _actionViewState: Number;

		/**
		 * Modeled action view state. Possible states include 'input', 'output' and 'info' states.
		 */
		public function get actionViewState(): Number {
			return _actionViewState;
		}

		/**
		 * @private
		 */
		public function set actionViewState(value: Number): void {
			_actionViewState = value;
		}

		private var _confusionMatrix: ArrayCollection;

		/**
		 * Confusion matrix property - bound to the data grid in input view.
		 */
		public function get confusionMatrix(): ArrayCollection {
			return _confusionMatrix;
		}

		/**
		 * @private
		 */
		public function set confusionMatrix(value: ArrayCollection): void {
			_confusionMatrix = value;
		}

		/**
		 * Method for translating confusion matrix into single-dimension number array
		 */
		public function getConfusionMatrixAsArray(): Array {
			var collection: ArrayCollection = new ArrayCollection();
			var confusionMatrixRow: ConfusionMatrixRow;
			for each (confusionMatrixRow in confusionMatrix) {
				collection.addItem(confusionMatrixRow.adenine);
				collection.addItem(confusionMatrixRow.cytosine);
				collection.addItem(confusionMatrixRow.guanine);
				collection.addItem(confusionMatrixRow.thymine);
			}
			return collection.source;
		}

		private var _gapPenalty: Number;

		/**
		 * Penalty for fitting a nucleotide with gap.
		 */
		public function get gapPenalty(): Number {
			return _gapPenalty;
		}

		/**
		 * @private
		 */
		public function set gapPenalty(value: Number): void {
			_gapPenalty = value;
		}

		private var _sequence1: String;

		/**
		 * First DNA input sequence.
		 */
		public function get sequence1(): String {
			return _sequence1;
		}

		/**
		 * @private
		 */
		public function set sequence1(value: String): void {
			_sequence1 = value;
		}

		private var _sequence2: String;

		/**
		 * Second DNA input sequence.
		 */
		public function get sequence2(): String {
			return _sequence2;
		}

		/**
		 * @private
		 */
		public function set sequence2(value: String): void {
			_sequence2 = value;
		}

		private var _similarity: Number;

		/**
		 * Similarity value computed by the backend.
		 */
		public function get similarity(): Number {
			return _similarity;
		}

		/**
		 * @private
		 */
		public function set similarity(value: Number): void {
			_similarity = value;
		}

		private var _outputIndex: Number;

		/**
		 * Helper property - current output selection index. Updated when user choses previous/next output.
		 */
		public function get outputIndex(): Number {
			return _outputIndex;
		}

		/**
		 * @private
		 */
		public function set outputIndex(value: Number): void {
			if ((value >= 0) && (value < outputSequence.length / 2)) {
				_outputIndex = value;
				dispatchEvent(new Event("sequenceSelectionChange"));
			}
		}

		private var _outputSequence: ArrayCollection;

		/**
		 * DNA output sequence received from the server. It contains alternately aligned output
		 * one and two sequences.
		 */
		public function get outputSequence(): ArrayCollection {
			return _outputSequence;
		}

		/**
		 * @private
		 */
		public function set outputSequence(value: ArrayCollection): void {
			_outputSequence = value;
		}

		/**
		 * Output sequence one getter - binding is fired only, when 'sequenceSelectionChange' event
		 * is dispatched.
		 */
		[Bindable(event="sequenceSelectionChange")]
		public function get output1(): String {
			return sequenceAt(2 * outputIndex);
		}

		/**
		 * Output sequence two getter - binding is fired only, when 'sequenceSelectionChange' event
		 * is dispatched.
		 */
		[Bindable(event="sequenceSelectionChange")]
		public function get output2(): String {
			return sequenceAt(2 * outputIndex + 1);
		}

		/**
		 * Convenience method for getting a DNA sequence at 'i' place of
		 * output sequence list received from the server.
		 */
		private function sequenceAt(ind: Number): String {
			var length: Number = outputSequence.length;
			if (length == 0)
				return "-";
			else if ((ind >= 0) && (ind <= length)) {
				var result: String = outputSequence.getItemAt(ind) as String;
				return result;
			} else
				return "?";
		}
	}
}

