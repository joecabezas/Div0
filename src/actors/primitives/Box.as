package actors.primitives 
{
	import actors.Actor;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import com.as3joelib.utils.Singleton;
	import engine.Physics;
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Box extends Actor
	{
		
		public function Box() 
		{
			this.createShapeDefs();
			this.createBodyDef();
		}
		
		private function createShapeDefs():void 
		{
			var psdef:b2PolygonDef = new b2PolygonDef();
			psdef.SetAsBox(500 / Physics.WORLD_SCALE, 10 / Physics.WORLD_SCALE);
			
			psdef.friction = 0.5;
			psdef.restitution = 0.3;
			psdef.density = 0;
			
			this.shapes.push(psdef);
		}
		
		private function createBodyDef():void 
		{
			this.body_def = new b2BodyDef();
		}		
	}
}