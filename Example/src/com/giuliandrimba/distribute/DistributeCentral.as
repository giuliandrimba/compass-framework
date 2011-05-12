package com.giuliandrimba.distribute
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	import flash.display.MovieClip;
	
	public class DistributeCentral extends AbstractDistribute
	{
		private var _icons:Array;
		private var _content:MovieClip;
		private var _speed:Number;
		
		public function DistributeCentral()
		{
			
		}
		
		override public function init($icons:Array,$content:MovieClip,$positions:Array,$animationFunction:Function,$completeFunction:Function,$speed:Number):void
		{
			_icons = $icons;
			_content = $content;
			_speed = $speed;
			
			positionCentral();
			
			for (var i:Number = 0; i < _icons.length; i++)
			{
				TweenLite.to( _icons[i], 0.5, {alpha:1, x:$positions[i].posX, y:$positions[i].posY, delay:.25 * (i/_speed), ease:Quad.easeOut, onComplete:$animationFunction} );
			}
			var _index:Number = _icons.length - 1;
			TweenLite.to(_icons[_index], 0.5, { alpha:1, x:$positions[_index].posX, y:$positions[_index].posY, delay:.25 * (_index/_speed), ease:Quad.easeOut, onComplete:$completeFunction } );
		}
		
		private function positionCentral():void
		{
			for (var i:Number = 0; i < _icons.length; i++)
			{
				_icons[i].x = (_content.width/2) - (_icons[i].width/2)
				_icons[i].y = (_content.height / 2) - (_icons[i].height / 2)
			}
		}
	}
}