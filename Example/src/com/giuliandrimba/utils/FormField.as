package com.giuliandrimba.utils
{
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.text.TextField;

	public class FormField
	{
		private var _textField:TextField;
		private var defaultText:String;
		private var _errorMessage:String;
		
		public function FormField(textField:TextField)
		{
			_textField = textField;
			defaultText = textField.text;
			_textField.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
			_textField.addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
		}
		
		protected function alert():void
		{
			_textField.text = _errorMessage;
		}
		
		private function onFocusIn(e:FocusEvent):void
		{
			if(_textField.text == defaultText || _textField.text == _errorMessage)
			{
				_textField.text = "";
				_textField.stage.focus = _textField;
			}
		}
		
		private function onFocusOut(e:FocusEvent):void
		{
			if(_textField.text == "")
			{
				_textField.text = defaultText;
			}
		}
		
		public function set errorMessage(value:String):void
		{
			_errorMessage = value;
		}
		
		public function get errorMessage():String
		{
			return _errorMessage;
		}
		
		public function get isValid():Boolean
		{		
			if(_textField.text != defaultText && _textField.text != _errorMessage)
			{
				return true;
			}
			else
			{
				return false;
			}
			
			return false;
		}
		
		public function get text():String
		{
			return _textField.text;
		}
		
		public function get textField():TextField
		{
			return _textField;
		}
	}
}