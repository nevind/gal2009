package gal.view.validators {
	import mx.validators.ValidationResult;
	import mx.validators.Validator;

	/**
	 * Input sequence validator validates whether DNA sequence entered in a text area by the user is valid.
	 * It uses a regular expression as a mean of validation.
	 * 
	 * @see mx.validators.Validator
	 */
	public class InputSequenceValidator extends Validator {
		public function InputSequenceValidator() {
			super();
		}

		private var _sequenceError: String;

		/**
		 * Sequence error string.
		 */
		public function get sequenceError(): String {
			return _sequenceError;
		}

		/**
		 * @private
		 */
		public function set sequenceError(value: String): void {
			_sequenceError = value;
		}

		/**
		 * Main validation method facilitating regular expression.
		 * The input cannot be empty or contain letters other than ACTG
		 */
		override protected function doValidation(value: Object): Array {
			var validatorResults: Array = new Array();
			var pattern: RegExp = /^[ACGT]*$/
			var seq: String = value as String;
			if (seq.length < 1) {
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

