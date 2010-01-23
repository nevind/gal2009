package gal.model
{
	import com.adobe.cairngorm.model.IModelLocator;

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
			_mainViewState = 0;
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

	}
}