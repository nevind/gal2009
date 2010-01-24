package gal.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class GalModelLocator implements IModelLocator
	{
		public function GalModelLocator()
		{
			clear();
		}
		
		private static var galModelLocator:GalModelLocator = new GalModelLocator();
		
		public static function getInstance():GalModelLocator
		{
			return galModelLocator;
		}
		
		public function clear():void
		{
			mainViewState = 0;
			confusionMatrix = new ArrayCollection([new ConfusionMatrixRow(),new ConfusionMatrixRow(),new ConfusionMatrixRow(),new ConfusionMatrixRow()]);
			gapPenalty = 0;
			sequence1 = "";
			sequence2 = "";
		}
		
		private var _mainViewState: Number;
		
		public function get mainViewState():Number
		{
			return _mainViewState;
		}
		
		public function set mainViewState(_mainViewState:Number):void
		{
			this._mainViewState = _mainViewState;
		}
		
		private var _confusionMatrix:ArrayCollection;

		public function get confusionMatrix():ArrayCollection
		{
			return _confusionMatrix;
		}

		public function set confusionMatrix(value:ArrayCollection):void
		{
			_confusionMatrix = value;
		}

		private var _gapPenalty:Number;

		public function get gapPenalty():Number
		{
			return _gapPenalty;
		}

		public function set gapPenalty(value:Number):void
		{
			_gapPenalty = value;
		}

		private var _sequence1:String;

		public function get sequence1():String
		{
			return _sequence1;
		}

		public function set sequence1(value:String):void
		{
			_sequence1 = value;
		}

		private var _sequence2:String;

		public function get sequence2():String
		{
			return _sequence2;
		}

		public function set sequence2(value:String):void
		{
			_sequence2 = value;
		}

	}
}