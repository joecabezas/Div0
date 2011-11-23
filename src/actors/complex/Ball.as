package actors.complex 
{
	import actors.primitives.Circle;
	import flash.events.KeyboardEvent;
	import interfaces.IRespondToKeyEvent;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Ball extends Circle implements IRespondToKeyEvent
	{
		
		public function Ball() 
		{
			super(20);
		}
		
		public function onKeyEvent(e:KeyboardEvent):void
		{
			trace('Ball.onKeyEvent');
		}
	}

}