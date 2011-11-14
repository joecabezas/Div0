package actors.primitives
{
	import actors.Actor;
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import com.as3joelib.utils.Singleton;
	import engine.Physics;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Circle extends Actor
	{
		private var radius:Number;
		
		public function Circle(radius:Number = 15)
		{
			this.radius = radius;
			
			this.createShapeDefs();
			this.createBodyDef();
		}
		
		private function createShapeDefs():void 
		{
			var bcdef:b2CircleDef = new b2CircleDef();
			bcdef.radius = this.radius / Physics.WORLD_SCALE;
			bcdef.density = 1;
			
			this.shapes.push(bcdef);
		}
		
		private function createBodyDef():void 
		{
			this.body_def = new b2BodyDef();
		}
	}
}