package gal.view.validators {
	import gal.model.ConfusionMatrixRow;

	import mx.collections.ArrayCollection;
	import mx.validators.ValidationResult;
	import mx.validators.Validator;

	public class ConfusionMatrixValidator extends Validator {
		public function ConfusionMatrixValidator() {
			super();
		}

		private var _confusionMatrixError: String;

		public function get confusionMatrixError(): String {
			return _confusionMatrixError;
		}

		public function set confusionMatrixError(value: String): void {
			_confusionMatrixError = value;
		}

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

		private function validateNumber(value: Number): Boolean {
			if (isNaN(value) || value == Number.NEGATIVE_INFINITY || value == Number.POSITIVE_INFINITY)
				return false;
			else
				return true;

		}
	}
}

