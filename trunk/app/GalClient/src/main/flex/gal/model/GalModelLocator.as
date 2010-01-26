package gal.model {
	import com.adobe.cairngorm.model.IModelLocator;

	import flash.events.Event;
	import flash.events.EventDispatcher;

	import gal.model.enums.ActionViewStates;
	import gal.model.enums.MainViewStates;

	import mx.collections.ArrayCollection;

	[Bindable]
	public class GalModelLocator extends EventDispatcher implements IModelLocator {
		public function GalModelLocator() {
			clear();
		}

		private static var galModelLocator: GalModelLocator = new GalModelLocator();

		public static function getInstance(): GalModelLocator {
			return galModelLocator;
		}

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

		public function refreshOutput():void{
			_outputIndex = 0;
			dispatchEvent(new Event("sequenceSelectionChange"));
		}

		private var _mainViewState: Number;

		public function get mainViewState(): Number {
			return _mainViewState;
		}

		public function set mainViewState(_mainViewState: Number): void {
			this._mainViewState = _mainViewState;
		}

		private var _actionViewState: Number;

		public function get actionViewState(): Number {
			return _actionViewState;
		}

		public function set actionViewState(value: Number): void {
			_actionViewState = value;
		}

		private var _confusionMatrix: ArrayCollection;

		public function get confusionMatrix(): ArrayCollection {
			return _confusionMatrix;
		}

		public function set confusionMatrix(value: ArrayCollection): void {
			_confusionMatrix = value;
		}

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

		public function get gapPenalty(): Number {
			return _gapPenalty;
		}

		public function set gapPenalty(value: Number): void {
			_gapPenalty = value;
		}

		private var _sequence1: String;

		public function get sequence1(): String {
			return _sequence1;
		}

		public function set sequence1(value: String): void {
			_sequence1 = value;
		}

		private var _sequence2: String;

		public function get sequence2(): String {
			return _sequence2;
		}

		public function set sequence2(value: String): void {
			_sequence2 = value;
		}

		private var _similarity: Number;

		public function get similarity(): Number {
			return _similarity;
		}

		public function set similarity(value: Number): void {
			_similarity = value;
		}

		private var _outputIndex: Number;

		public function get outputIndex(): Number {
			return _outputIndex;
		}

		public function set outputIndex(value: Number): void {
			if ((value >= 0) && (value < outputSequence.length / 2)) {
				_outputIndex = value;
				dispatchEvent(new Event("sequenceSelectionChange"));
			}
		}

		private var _outputSequence: ArrayCollection;

		public function get outputSequence(): ArrayCollection {
			return _outputSequence;
		}

		public function set outputSequence(value: ArrayCollection): void {
			_outputSequence = value;
		}

		[Bindable(event="sequenceSelectionChange")]
		public function get output1(): String {
			return sequenceAt(2 * outputIndex);
		}

		[Bindable(event="sequenceSelectionChange")]
		public function get output2(): String {
			return sequenceAt(2 * outputIndex + 1);
		}

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

