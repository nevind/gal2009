package gal.dto
{
	[RemoteClass(alias="gal.dto.TestDto")]
	[Bindable]
	public class TestDto
	{
		public function TestDto()
		{
		}
		
		private var _text:String;
		
		public function set text(_text:String):void
		{
			this._text = _text;
		}
		
		public function get text():String
		{
			return this._text;
		}

	}
}