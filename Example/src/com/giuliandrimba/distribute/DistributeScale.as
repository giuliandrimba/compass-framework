package com.giuliandrimba.distribute
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	import flash.display.MovieClip;
	
	public class DistributeScale extends AbstractDistribute
	{
		private var _icons:Array;
		private var _speed:Number;
		
		public function DistributeScale()
		{

		}
		
		override public function init($icons:Array,$content:MovieClip,$positions:Array,$animationFunction:Function,$completeFunction:Function, $speed:Number):void
		{
			_icons = $icons;
			_speed = $speed;
			
			positionScale();
			
			for (var i:Number = 0; i < _icons.length-1; i++)
			{
				TweenLite.to(_icons[i], 0.5,{alpha:1, scaleX:1, scaleY:1, x:$positions[i].posX, y:$positions[i].posY,delay:.1 * (i/_speed), ease:Quad.easeOut, onComplete:$animationFunction});
			}
			var _index:Number = _icons.length - 1;
			TweenLite.to(_icons[_index], 0.5,{alpha:1, scaleX:1, scaleY:1, x:$positions[_index].posX, y:$positions[_index].posY,delay:.1 * (_index/_speed), ease:Quad.easeOut, onComplete:$completeFunction});
		}
		
		private function positionScale():void
		{
			for (var i:Number = 0; i < _icons.length; i++)
			{
				_icons[i].scaleX = 5;
				_icons[i].scaleY = 5;
				_icons[i].x = _icons[i].x - (_icons[i].width / 2);
				_icons[i].y = _icons[i].y - (_icons[i].height / 2)
			}
		}
	}
}