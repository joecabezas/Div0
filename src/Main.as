package 
{
	import actors.complex.SoftBall;
	import actors.primitives.Box;
	import actors.primitives.Circle;
	import com.as3joelib.utils.Singleton;
	import engine.Physics;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Joe Cabezas
	 */
	[SWF(backgroundColor="#1D1D1F",width=1120,height=690,frameRate=60)]
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{

		//private var physics:Physics;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			this.setup();
			this.addListeners();
		}
		
		private function setup():void {
			Singleton.getInstance().data.physics = new Physics();
			
			this.addChild(Physics(Singleton.getInstance().data.physics).getDebugDrawSprite());
			
			var floor:Box = new Box();
			floor.setPositionInPixels(0, this.stage.stageHeight-200);
			floor.addToWorld();
			
			//var circle:Circle = new Circle();
			//circle.setPositionInPixels(30, 50);
			//circle.addToWorld();
			
			var soft_ball:SoftBall = new SoftBall(50,10);
		}
		
		private function addListeners():void {
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			Physics(Singleton.getInstance().data.physics).getWorld().Step(1 / 60, 10);
		}

	}

}