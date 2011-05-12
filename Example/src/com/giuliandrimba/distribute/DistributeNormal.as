package com.giuliandrimba.distribute
{
	import flash.display.MovieClip;
	public class DistributeNormal extends AbstractDistribute
	{
		private var _speed:Number;
		public function DistributeNormal()
		{
			
		}
		
		override public function init($icons:Array,$content:MovieClip,$positions:Array,$animationFunction:Function,$completeFunction:Function, $speed:Number):void
		{
			_speed = $speed;
			for (var i:Number = 0; i < $icons.length; i++)
			{
				$icons[i].alpha = 1;
				$completeFunction();
			}
		}
	}
}