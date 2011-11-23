package
{
	import actors.complex.SoftBall;
	import actors.primitives.Box;
	import actors.primitives.Circle;
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import scenario.Scenario;
	//import com.as3joelib.box2d.dynamics.joints.ConstantVolumeJointDef;
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
		
		private var _scenario:Scenario;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			this.setup();
			this.addListeners();
			this.render();
		}
		
		private function render():void 
		{
			
		}
		
		private function setup():void
		{
			Singleton.getInstance().data.physics = new Physics();
			
			this.addChild(Physics(Singleton.getInstance().data.physics).getDebugDrawSprite());
			
			this.addChild(this._scenario.getRoot());
			
			var floor:Box = new Box();
			floor.setPositionInPixels(0, this.stage.stageHeight - 200);
			floor.addToWorld();
			
			//var circle:Circle = new Circle();
			//circle.setPositionInPixels(30, 50);
			//circle.addToWorld();
			
			//this.soft_ball = new SoftBall(50, 10);
			//this.addChild(this.soft_ball.node);
			//this.soft_ball.node.y += 10;
			
			///TEST CONSTANT VOLUME JOINT DEF
			/*
			var cvjd:ConstantVolumeJointDef = new ConstantVolumeJointDef();
			
			var cx:Number = 0.0;
			var cy:Number = 10.0;
			var rx:Number = 5.0;
			var ry:Number = 5.0;
			var nBodies:int = 20;
			var bodyRadius:Number = 0.5;
			
			for (var i:int = 0; i < nBodies; ++i)
			{
				
				//float angle = PApplet.map(i, 0, nBodies, 0, 2*3.1415f);
				var angle:Number = i * 2 * Math.PI / nBodies;
				
				var bd:b2BodyDef = new b2BodyDef();
				//bd.isBullet = true;
				bd.fixedRotation = true;
				
				var x:Number = cx + rx * Math.sin(angle);
				var y:Number = cy + ry * Math.cos(angle);
				
				bd.position.Set(x, y);
				
				var body:b2Body = Physics(Singleton.getInstance().data.physics).getWorld().CreateBody(bd);
				var cd:b2CircleDef = new b2CircleDef();
				cd.radius = bodyRadius;
				cd.density = 1.0;
				cd.filter.groupIndex = -2;
				
				body.CreateShape(cd);
				
				cvjd.addBody(body);
				body.SetMassFromShapes();
			}
			
			cvjd.frequencyHz = 10.0;
			cvjd.dampingRatio = 1.0;
			Physics(Singleton.getInstance().data.physics).getWorld().CreateJoint(cvjd);
			*/
		}
		
		private function addListeners():void
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void
		{
			Physics(Singleton.getInstance().data.physics).getWorld().Step(1 / 60, 10);
			//this.soft_ball.step();
		}
	
	}

}