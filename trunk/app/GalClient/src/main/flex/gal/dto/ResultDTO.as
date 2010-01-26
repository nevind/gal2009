package gal.dto
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="gal.needleman.wunsch.ResultDTO")]
	[Bindable]
	public class ResultDTO
	{
		public function ResultDTO()
		{
		}

		private var _listOfSequences:ArrayCollection;

		public function get listOfSequences():ArrayCollection
		{
			return _listOfSequences;
		}

		public function set listOfSequences(value:ArrayCollection):void
		{
			_listOfSequences = value;
		}

		private var _similarityValue:Number;

		public function get similarityValue():Number
		{
			return _similarityValue;
		}

		public function set similarityValue(value:Number):void
		{
			_similarityValue = value;
		}

	}
}

