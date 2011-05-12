package com.giuliandrimba.distribute
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	import flash.display.MovieClip;
	
	public class DistributeBottom extends AbstractDistribute
	{
		private var _icons:Array;
		private var _contentObject:MovieClip;
		private var _speed:Number;
		
		public function DistributeBottom()	{	}
		
		override public function init($icons:Array,$content:MovieClip,$positions:Array,$animationFunction:Function,$completeFunction:Function,$speed:Number):void
		{
			_icons = $icons;
			_contentObject = $content;
			_speed = $speed;
			
			positionBottom();
			
			for (var i:Number = 0; i < _icons.length; i++)
			{
				TweenLite.to(_icons[i], 1, { alpha:1, y:$positions[i].posY,delay:.25 * (i/_speed), ease:Quad.easeOut. onComplete:$animationFunction } );
			}
			
			var _index:Number = _icons.length - 1;
			TweenLite.to(_icons[_index], 1, { alpha:1, y:$positions[_index].posY,delay:.25 * (_index/_speed), ease:Quad.easeOut, onComplete:$completeFunction } );
		}
		
		private function positionBottom():void
		{
			for (var i:Number = 0; i < _icons.length; i++)
			{
				_icons[i].y = 0 + _contentObject.height;
			}
		}
	}
}