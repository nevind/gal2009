package gal.dto
{
	import mx.collections.ArrayCollection;

	/**
	 * Result data transfer object received from the server. On the server side,
	 * the result is automatically serialized by BlazeDS data services gateway.
	 * Front end deserializes the result using client-side part of BlazeDS.
	 * Link between server-side and client-side classes is established via
	 * RemoteClass annotation.
	 */
	[RemoteClass(alias="gal.needleman.wunsch.ResultDTO")]
	[Bindable]
	public class ResultDTO
	{
		public function ResultDTO()
		{
		}

		private var _listOfSequences:ArrayCollection;

		/**
		 * Array collection of received DNA sequences
		 */
		public function get listOfSequences():ArrayCollection
		{
			return _listOfSequences;
		}

		/**
		 * @private
		 */
		public function set listOfSequences(value:ArrayCollection):void
		{
			_listOfSequences = value;
		}

		private var _similarityValue:Number;

		/**
		 * Similarity value received from the server. It is the same for all found pairs of sequence alignments.
		 */
		public function get similarityValue():Number
		{
			return _similarityValue;
		}

		/**
		 * @private
		 */
		public function set similarityValue(value:Number):void
		{
			_similarityValue = value;
		}

	}
}

