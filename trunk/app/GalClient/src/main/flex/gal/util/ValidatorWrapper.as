package gal.util {
	import flash.events.Event;
	import mx.controls.Alert;
	import mx.validators.Validator;

	/**
	 * Utility class used for validating multiple elements and conditional method invocation
	 */
	public class ValidatorWrapper {
		public function ValidatorWrapper() {
			super();
		}

		private var _validators: Array;

		/**
		 * Validators table.
		 */
		public function get validators(): Array {
			return _validators;
		}

		/**
		 * @private
		 */
		public function set validators(value: Array): void {
			_validators = value;
		}
		
		/**
		 * Method for adding a new validator to the validator wrapper.
		 */
		public function push(validator: Validator): void {
			_validators.push(validator);
		}

		/**
		 * Method returning the state of validator wrapper. If none of the validators is triggered it returns 'true'.
		 * Otherwise 'false'.
		 */
		public function check(): Boolean {
			var validatorErrorArray: Array = Validator.validateAll(validators);
			return (validatorErrorArray.length == 0);
		}
	}
}

