package com.giuliandrimba.distribute
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	import flash.display.MovieClip;
	
	public class DistributeLeft extends AbstractDistribute
	{
		private var _icons:Array;
		private var _speed:Number;
		
		public function DistributeLeft()
		{

		}
		
		override public function init($icons:Array,$content:MovieClip,$positions:Array,$animationFunction:Function,$completeFunction:Function, $speed:Number):void
		{
			_icons = $icons;
			_speed = $speed;
			
			positionLeft();
			
			for (var i:Number = 0; i < _icons.length; i++)
			{
				TweenLite.to(_icons[i], 1, {x:$positions[i].posX,alpha:1, delay:.25 * (i/_speed), ease:Quad.easeOut, onComplete:$animationFunction} );
			}
			var _index:Number = _icons.length - 1;
			TweenLite.to(_icons[_index], 1, {x:$positions[_index].posX,alpha:1, delay:.25 * (_index/_speed), ease:Quad.easeOut, onComplete:$completeFunction} );
		}
		
		private function positionLeft():void
		{
			for (var i:Number = 0; i < _icons.length; i++)
			{
				_icons[i].x = 0 - _icons[i].width;
			}
		}
	}
}