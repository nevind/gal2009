package gal.dto
{
	[RemoteClass(alias="gal.needleman.wunsch.RequestDTO")]
	[Bindable]
	public class RequestDTO
	{
		public function RequestDTO()
		{
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


		private var _similarityMatrix:Array;

		public function get similarityMatrix():Array
		{
			return _similarityMatrix;
		}

		public function set similarityMatrix(value:Array):void
		{
			_similarityMatrix = value;
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


	}
}

