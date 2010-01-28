package gal.view.validators {
	import gal.model.ConfusionMatrixRow;

	import mx.collections.ArrayCollection;
	import mx.validators.ValidationResult;
	import mx.validators.Validator;

	/**
	 * Confusion matrix validator validates if confusion matrix contains only valid floating point numbers.
	 * 
	 * @see mx.validators.Validator
	 */
	public class ConfusionMatrixValidator extends Validator {
		public function ConfusionMatrixValidator() {
			super();
		}

		private var _confusionMatrixError: String;

		/**
		 * Confusion matrix error text
		 */
		public function get confusionMatrixError(): String {
			return _confusionMatrixError;
		}

		/**
		 * @private
		 */
		public function set confusionMatrixError(value: String): void {
			_confusionMatrixError = value;
		}

		/**
		 * Method for validating each cell of confusion matrix input.
		 */
		override protected function doValidation(value: Object): Array {
			var validatorResults: Array = new Array();
			var confusionMatrix: ArrayCollection = value as ArrayCollection;
			var confusionMatrixRow: ConfusionMatrixRow;
			for each (confusionMatrixRow in confusionMatrix) {
				if (!validateNumber(confusionMatrixRow.adenine) || !validateNumber(confusionMatrixRow.cytosine) || !validateNumber(confusionMatrixRow.
					guanine) || !validateNumber(confusionMatrixRow.thymine)) {
					validatorResults.push(new ValidationResult(true, "", "confusionMatrixError", confusionMatrixError));
					return validatorResults;
				}
			}

			return validatorResults;
		}

		/**
		 * Helper method for validating a proper number.
		 */
		private function validateNumber(value: Number): Boolean {
			if (isNaN(value) || value == Number.NEGATIVE_INFINITY || value == Number.POSITIVE_INFINITY)
				return false;
			else
				return true;

		}
	}
}

