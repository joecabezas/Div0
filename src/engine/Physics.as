package engine
{
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	
	//TODO: averiguar herencia de singletons
	public class Physics
	{
		//physics vars
		public static const WORLD_SCALE:Number = 30;
		
		private var world:b2World;
		private var gravity:b2Vec2;
		
		//physiscs debug
		private var debug_draw:b2DebugDraw;
		private var debug_sprite:Sprite;
		
		//no editar
		public function Physics()
		{
			this.setupWorld();
			this.setupDebugDraw();
		}
		
		private function setupDebugDraw():void
		{
			this.debug_sprite = new Sprite();
			
			this.debug_draw = new b2DebugDraw();
			
			this.debug_draw.m_sprite = this.debug_sprite;
			this.debug_draw.m_drawScale = Physics.WORLD_SCALE;
			//this.debug_draw.m_fillAlpha = 1;
			this.debug_draw.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
			
			this.debug_draw.m_lineThickness = 2;
			
			this.world.SetDebugDraw(this.debug_draw);
		}
		
		private function setupWorld():void
		{
			var bounds:b2AABB = new b2AABB();
			
			bounds.lowerBound.Set(-5000 / Physics.WORLD_SCALE, -5000 / Physics.WORLD_SCALE);
			bounds.upperBound.Set(5000 / Physics.WORLD_SCALE, 5000 / Physics.WORLD_SCALE);
			
			this.gravity = new b2Vec2(0, 9.8);
			
			this.world = new b2World(bounds, this.gravity, true);
		}
		
		//metodos custom
		public function getWorld():b2World
		{
			return this.world;
		}
		
		public function getDebugDrawSprite():Sprite
		{
			return this.debug_sprite;
		}
	}
}
