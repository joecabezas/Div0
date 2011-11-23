package scenario
{
	import actors.Actor;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Scenario
	{
		private var _root:Sprite;
		private var _actors:Vector.<Actor>;
		
		public function Scenario()
		{
			this.setup();
		}
		
		private function setup():void
		{
			this._root = new Sprite();
			this._actors = new Vector.<Actor>;
		}
		
		public function addActor(a:Actor):void
		{
			this._actors.push(a);
		}
		
		public function render():void
		{
			for each (var actor:Actor in this._actors)
			{
				this._root.addChild(actor.getNode());
			}
		}
		
		public function getRoot():Sprite
		{
			return _root;
		}
	
	}

}