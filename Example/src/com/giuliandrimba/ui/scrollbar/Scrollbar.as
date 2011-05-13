package com.giuliandrimba.ui.scrollbar
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	
	public class Scrollbar extends EventDispatcher
	{
		private var _content:MovieClip;
		private var _scroller:MovieClip;
		private var _scrollArea:MovieClip;
		private var _contentMask:MovieClip;
		
		private var _scrolledArea:Number;
		private var _percentScrolled:Number;
		private var _contentRestArea:Number;
		private var _scrollerArea:Number;
		protected var initContentPos:Number;
		
		private var scrollOrientation:String;

		public static const SCROLLING:String = "scrolling";
		
		public function Scrollbar(scrollOrientation:String,contentScrolled:MovieClip,maskArea:MovieClip, scroller:MovieClip, scrollArea:MovieClip)
		{
			this.scrollOrientation = scrollOrientation;
			_content = contentScrolled;
			_scroller = scroller;
			_scrollArea = scrollArea;
			_contentMask = maskArea;
			
			_scroller.buttonMode = true;
		}
		
		public function init():void
		{
			verifyScroll();
			_scroller.addEventListener(MouseEvent.MOUSE_DOWN, thumbDown);
			initPositions();
		}
		
		private function initPositions():void
		{
			_scroller[getPosition()] = 0;
			initContentPos = _content[getPosition()];
		}
		
		//Can return height or width, according to the orientation
		private function getWeight():String
		{
			switch(scrollOrientation)
			{
				case ScrollbarOrientation.VERTICAL:
					return "height";
					break;
				case ScrollbarOrientation.HORIZONTAL:
					return "width";
					break;
				default:
					return null;
			}
		}
		
		//Can return y or x, according to the orientation
		private function getPosition():String
		{
			switch(scrollOrientation)
			{
				case ScrollbarOrientation.VERTICAL:
					return "y";
					break;
				case ScrollbarOrientation.HORIZONTAL:
					return "x";
					break;
				default:
					return null;
			}
		}
		
		private function verifyScroll():void
		{	
			if (_content[getWeight()] <= _contentMask[getWeight()])
			{
				_scroller.parent.visible = false;
			}
			else
			{
				_scroller.parent.visible = true;
			}
		}
		
		private function thumbDown(e:MouseEvent):void
		{
			_scroller.addEventListener(Event.ENTER_FRAME, onEnterFrameEvent);
			_content.stage.addEventListener(MouseEvent.MOUSE_UP, thumbUp);
		}
		
		private function onEnterFrameEvent(e:Event):void 
		{
			dispatchEvent(new Event(SCROLLING))
			thumbMove();
		}
		private function thumbUp(e:MouseEvent):void
		{
			_scroller.removeEventListener(Event.ENTER_FRAME, onEnterFrameEvent);
			_content.stage.removeEventListener(MouseEvent.MOUSE_UP, thumbUp);
			_scroller.stopDrag();
		}
		
		private function thumbMove(e:MouseEvent=null):void
		{
			dragscroller();
			
			if(scrollOrientation == ScrollbarOrientation.VERTICAL)
			{
				TweenLite.to(_content,0.3,{y:scrollObject(),ease:Quad.easeOut});
			}
			else if(scrollOrientation == ScrollbarOrientation.HORIZONTAL)
			{
				TweenLite.to(_content,0.3,{x:scrollObject(),ease:Quad.easeOut});
			}
		}
		
		private function scrollObject():Number
		{
			_scrolledArea = _scroller[getPosition()];
			_scrollerArea = _scrollArea[getWeight()] - _scroller[getWeight()]
			_percentScrolled = (_scrolledArea * 100)/_scrollerArea;
			_contentRestArea = _content[getWeight()] - _contentMask[getWeight()];
			var scroller:Number = (_contentRestArea * _percentScrolled) / 100;
			return initContentPos + (-scroller);
		}
		
		private function dragscroller():void
		{
			var rheight:Number = _scroller.parent[getWeight()] - _scroller[getWeight()]
			
			if(scrollOrientation == ScrollbarOrientation.VERTICAL)
			{
				_scroller.startDrag(false, new Rectangle(_scrollArea.x, _scrollArea.y, 0, rheight));
			}
			else if(scrollOrientation == ScrollbarOrientation.HORIZONTAL)
			{
				_scroller.startDrag(false, new Rectangle(_scrollArea.x, _scrollArea.y, rheight, 0));
			}
		}
	}
}