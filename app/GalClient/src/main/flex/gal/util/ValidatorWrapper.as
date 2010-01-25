package gal.util {
	import flash.events.Event;
	import mx.controls.Alert;
	import mx.validators.Validator;

	public class ValidatorWrapper {
		public function ValidatorWrapper() {
			super();
		}

		private var _validators: Array;

		public function get validators(): Array {
			return _validators;
		}

		public function set validators(value: Array): void {
			_validators = value;
		}

		public function push(validator: Validator): void {
			_validators.push(validator);
		}
		
		public function check(): Boolean {
			var validatorErrorArray: Array = Validator.validateAll(validators);
			return (validatorErrorArray.length == 0);
		}
	}
}