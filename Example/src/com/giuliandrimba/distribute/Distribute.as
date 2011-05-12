package com.giuliandrimba.distribute
{
	import com.giuliandrimba.distribute.*;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	public class Distribute extends EventDispatcher
	{
		protected var _arIcons:Array = new Array() //Array com os elementos a ser distribuído
		private var _total:Number; //Total de elementos a serem distribuídos
		private var _animation:*; //Clase do tipo de animação que será utilizada enquanto distribui
		private var _currentCol:Number;
		private var _content:MovieClip;
		private var _line:Number;
		private var _arPosition:Array; //Array com as posições finais dos elementos a serem distribuidos 
		private var _margin:Number; //Distância entre cada elemento
		private var _colums:Number; //Número de colunas
		protected var _speed:Number = 1; //Velocidade - quanto maior mais rápido
		
		public static const DISTRIBUTE_COMPLETE:String = "distributeComplete";
		public static const ANIMATION_COMPLETE:String = "animationComplete";
		
		public function Distribute ($array:Array,$content:MovieClip, $margin:Number, $colums:Number, $animation:AbstractDistribute) 
		{
			_total = $array.length
			_content = $content;
			_animation = $animation;
			_margin = $margin;
			_colums = $colums;
			_arIcons = $array;
		}
		
		public function init():void
		{
			_arPosition = [];
			positionIcons()
		}
		
		private function positionIcons():void //Posiciona os elementos em suas posições finais
		{
			_line = 0
			_currentCol = 0;

			for(var i:Number = 0; i<_total; i++)
			{
				_arIcons[i].alpha = 0;
				_arIcons[i].x = (0 + _arIcons[_currentCol].width + _margin) * _currentCol;
				_currentCol ++; 
				_arIcons[i].y = (0 + _arIcons[i].height + _margin) * _line;
				if(_currentCol >= _colums)
				{
					_currentCol = 0;
					_line ++ 
				}
				_arPosition.push( { posX:_arIcons[i].x, posY:_arIcons[i].y } ); //Guarda as posições na array
			}
			
			VerifyAnimation();
		}
		
		protected function distributeComplete():void
		{
			dispatchEvent(new Event(DISTRIBUTE_COMPLETE))
		}
		protected function animationComplete():void
		{
			dispatchEvent(new Event(ANIMATION_COMPLETE))
		}
		
		public function Remover():void
		{
			for (var i:Number = 0; i < _arIcons.length; i++)
			{
				_arIcons = []
			}
		}
		
		private function VerifyAnimation():void//Inicia a animação dos elementos de acordo com a variavel _animation
		{
			_animation.init(_arIcons,_content,_arPosition,animationComplete,distributeComplete, _speed);
		}
		
		//SET GET
		
		public function set arIcons (pValue:Array):void	{_arIcons = pValue;}
		
		public function get arIcons():Array	{return _arIcons;}
		
		public function set total(pValue:Number):void {_total = pValue;}
		public function get total ():Number	{ return _total; }
		
		public function set content(pValue:MovieClip):void {_content = pValue;}
		public function get content ():MovieClip	{return _content;}
		
		public function set animation (pValue:String):void	{_animation = pValue;}
		public function get animation():String	{return _animation;}
		
		public function get speed():Number { return _speed; }
		
		public function set speed(value:Number):void 
		{
			_speed = value;
		}
	}
}