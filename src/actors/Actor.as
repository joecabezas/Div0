package actors
{
	import Box2D.Collision.Shapes.b2ShapeDef;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import com.as3joelib.utils.Singleton;
	import engine.Physics;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class Actor
	{
		protected var sprite:Sprite;
		protected var body:b2Body;
		protected var body_def:b2BodyDef;
		
		protected var shapes:Vector.<b2ShapeDef>;
		
		public function Actor()
		{
			this.setup();
		}
		
		private function setup():void
		{
			this.shapes = new Vector.<b2ShapeDef>;
		}
		
		public function addToWorld():b2Body
		{
			this.body = Physics(Singleton.getInstance().data.physics).getWorld().CreateBody(this.body_def);
			
			//create shapes
			for each (var s:b2ShapeDef in this.shapes)
			{
				this.body.CreateShape(s);
			}
			this.body.SetMassFromShapes();
			
			return this.body;
		}
		
		public function setPositionInPixels(x:Number, y:Number):void
		{
			this.body_def.position.Set(x / Physics.WORLD_SCALE, y / Physics.WORLD_SCALE);
		}
		
		public function getBody():b2Body
		{
			return this.body;
		}
		
		public function getAnchor():b2Vec2
		{
			return this.body.GetLocalCenter();
		}
	}
}