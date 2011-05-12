package giuliandrimba.scroll
{
	import flash.display.MovieClip;
	import caurina.transitions.*;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class ScrollbarHorizontal extends EventDispatcher
	{
		private var _main:MovieClip;
		private var _content:MovieClip;
		private var _scrollBar:MovieClip;
		private var _scroller:MovieClip;
		private var _scrollArea:MovieClip;
		private var _contentMask:MovieClip;
		private var _stage:Stage;
		
		private var _scrolledArea:Number;
		private var _percentScrolled:Number;
		private var _contentRestArea:Number;
		private var _scrollerArea:Number

		public static const SCROLLING:String = "scrolling";
		public function ScrollbarHorizontal($stage:Stage)
		{
			_stage = $stage;
		}
		
		public function init($main:MovieClip, $content:MovieClip, $scrollbar:MovieClip, $scroller:MovieClip, $scrollArea:MovieClip,$contentMask:MovieClip):void
		{
			_main = $main;
			_content = $content;
			_scrollBar = $scrollbar;
			_scroller = $scroller;
			_scrollArea = $scrollArea;
			_contentMask = $contentMask;
			_scroller.addEventListener(MouseEvent.MOUSE_DOWN, thumbDown);
		}
		private function thumbDown(e:MouseEvent):void
		{
			_scroller.addEventListener(Event.ENTER_FRAME, onEnterFrameEvent);
			_stage.addEventListener(MouseEvent.MOUSE_UP, thumbUp);
		}
		
		private function onEnterFrameEvent(e:Event):void 
		{
			dispatchEvent(new Event(SCROLLING))
			thumbMove();
		}
		private function thumbUp(e:MouseEvent):void
		{
			_scroller.removeEventListener(Event.ENTER_FRAME, onEnterFrameEvent);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, thumbUp);
			_scroller.stopDrag();
			
		}
		private function thumbMove(e:MouseEvent=null):void
		{
			dragscroller();
			Tweener.addTween(_content,{x:scrollObject(),time:.3,transition:"easeOutQuad"});
		}
		private function scrollObject():Number
		{
			_scrolledArea = _scroller.x;
			_scrollerArea = _scrollArea.width - _scroller.width
			_percentScrolled = (_scrolledArea * 100)/_scrollerArea;
			_contentRestArea = _content.width - _contentMask.width;
			var scroller:Number = (_contentRestArea * _percentScrolled) / 100;
			return -scroller;
		}
		private function dragscroller():void
		{
			var rheight:Number = _scrollBar.width - _scroller.width
			_scroller.startDrag(false, new Rectangle(_scrollArea.y, _scrollArea.x, rheight, 0));
		}
		
		public function hidescrollBar():void
		{
			_scrollBar.visible = false;
		}
		
		public function showscrollBar():void
		{
			_scrollBar.visible = true;
		}
		
		//SET GET
		
		public function set main (pValue:MovieClip):void
		{
			_main = pValue;
		}
		public function get main ():MovieClip
		{
			return _main;
		}
		public function set contentObject (pValue:MovieClip):void
		{
			_content = pValue;
		}
		public function get contentObject ():MovieClip
		{
			return _content;
		}
		public function set scrollBar (pValue:MovieClip):void
		{
			_scrollBar = pValue;
		}
		public function get scrollBar():MovieClip
		{
			return _scrollBar;
		}
		public function set scroller (pValue:MovieClip):void
		{
			_scroller = pValue;
		}
		public function get scroller ():MovieClip
		{
			return _scroller;
		}
		public function set scrollArea (pValue:MovieClip):void
		{
			_scrollArea = pValue;
		}
		public function get scrollArea ():MovieClip
		{
			return _scrollArea;
		}
		public function set contentObjectMask (pValue:MovieClip):void
		{
			_contentMask = pValue;
		}
		public function get contentObjectMask():MovieClip
		{
			return _contentMask;
		}
		
		public function get pStage():Stage { return _stage; }
		
		public function set pStage(value:Stage):void 
		{
			_stage = value;
		}
	}
}