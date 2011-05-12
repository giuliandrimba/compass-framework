package com.giuliandrimba.distribute
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	import flash.display.MovieClip;
	
	public class DistributeAlpha extends AbstractDistribute
	{
		private var _speed:Number;
		
		public function DistributeAlpha()
		{
			
		}
		
		override public function init($icons:Array,$content:MovieClip,$positions:Array,$animationFunction:Function,$completeFunction:Function,$speed:Number):void
		{
			_speed = $speed;
			for (var i:Number = 0; i < $icons.length; i++)
			{
				TweenLite.to($icons[i], .5, { alpha:1, delay:.25 * (i/_speed), ease:Quad.easeOut, onComplete:$animationFunction } );
			}
			var _index:Number = $icons.length - 1;
			TweenLite.to($icons[_index], .5, { alpha:1, delay:25 * (_index/_speed), ease:Quad.easeOut, onComplete:$completeFunction } );
		}
	}
}