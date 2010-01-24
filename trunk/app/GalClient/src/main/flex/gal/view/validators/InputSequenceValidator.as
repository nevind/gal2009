package gal.view.validators
{
	import mx.validators.ValidationResult;
	import mx.validators.Validator;
	
	public class InputSequenceValidator extends Validator
	{
		public function InputSequenceValidator()
		{
			super();
		}
		
		private var _sequenceError:String;

		public function get sequenceError():String
		{
			return _sequenceError;
		}

		public function set sequenceError(value:String):void
		{
			_sequenceError = value;
		}
		
		override protected function doValidation(value:Object) : Array{
			var validatorResults: Array = new Array();
			var pattern: RegExp = /^[ACGT]*$/
			var seq: String = value as String;
			if (seq.length<1)
			{
				validatorResults.push(new ValidationResult(true, "", "sequenceError", requiredFieldError));
				return validatorResults;
			}
			if (!pattern.test(seq)) {
				validatorResults.push(new ValidationResult(true, "", "sequenceError", sequenceError));
				return validatorResults;
			}
			return validatorResults;
		}
	}
}