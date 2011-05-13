package com.giuliandrimba.ui.mousescroll
{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import caurina.transitions.*;

	public class MouseScroll
	{
		private var _main:MovieClip;
		private var _content:MovieClip;
		private var _mask:MovieClip;
		private var _scrollX:Number = 0;
		private var _scrollY:Number = 0;
		private var _percentScrolled:Number;
		private var _totalArea:Number;
		private var _restArea:Number;
		private var _type:String;
		private var _targetEvent:MovieClip;
		
		public static const VERTICAL:String = "vertical";
		public static const HORIZONTAL:String = "horizontal";
		public static const VERTICAL_HORIZONTAL:String = "verticalHorizontal";

		public function MouseScroll($main:MovieClip,$content:MovieClip,$mask:MovieClip, $type:String = "vertical", $target:MovieClip = null)
		{
			_main = $main;
			_content = $content;
			_mask = $mask;
			_restArea = _totalArea - _content.width;
			_content.mask = _mask;
			_type = $type;
			_targetEvent = $target;
			
			if(_targetEvent != null)
			{
				_targetEvent.addEventListener(MouseEvent.MOUSE_MOVE, onScroller);
			}
			else
			{
				_targetEvent = _main;
				_targetEvent.addEventListener(MouseEvent.MOUSE_MOVE, onScroller);
			}
		}
		
		private function onScroller(event:MouseEvent):void
		{
			switch(_type)
			{
				case "horizontal":
				Tweener.addTween(_content,{x:scrollX(),time:0.5,transition:"easeOutQuad"});
				break;
				case "vertical":
				Tweener.addTween(_content,{y:scrollY(),time:0.5,transition:"easeOutQuad"});
				break;
				default:
				Tweener.addTween(_content,{x:scrollX(),time:0.5,transition:"easeOutQuad"});
				Tweener.addTween(_content,{y:scrollY(),time:0.5,transition:"easeOutQuad"});
			}
		}
		
		private function scrollX():Number
		{
			_scrollX = _targetEvent.mouseX;
			_percentScrolled = (_scrollX * 100)/_mask.width;
			var scroller:Number = ((_mask.width - _content.width) * _percentScrolled) / 100;
			
			return scroller;
		}
		
		private function scrollY():Number
		{
			_scrollY = _targetEvent.mouseY;
			_percentScrolled = (_scrollY * 100)/_mask.height;
			var scroller:Number = ((_mask.height - _content.height) * _percentScrolled) / 100;
			
			return scroller;
		}
	}
}