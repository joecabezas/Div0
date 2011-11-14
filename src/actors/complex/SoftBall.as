package actors.complex
{
	import actors.primitives.Circle;
	import Box2D.Dynamics.Joints.b2DistanceJoint;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2RevoluteJoint;
	import Box2D.Dynamics.Joints.b2RevoluteJointDef;
	import com.as3joelib.utils.Singleton;
	import engine.Physics;
	
	/**
	 * ...
	 * @author Joe Cabezas
	 */
	public class SoftBall
	{
		private var complexity:int;
		private var radius:Number;
		
		public var circles:Vector.<Circle>;
		public var joints:Vector.<b2DistanceJointDef>
		
		public function SoftBall(radius:Number = 50, complexity:int = 3)
		{
			if (complexity < 3)
				throw new Error('SoftBall complexity must be 3 or more');
			
			this.radius = radius;
			this.complexity = complexity;
			
			this.setup();
			
			this.createCircles();
			this.createJoints();
		}
		
		private function setup():void 
		{
			this.circles = new Vector.<Circle>;
			this.joints = new Vector.<b2DistanceJointDef>;
		}
		
		private function createCircles():void
		{
			for (var i:int = 0; i < this.complexity; i++)
			{
				var c:Circle = new Circle(5);
				
				
				var angle:Number = i * 2*Math.PI / this.complexity;
				c.setPositionInPixels(100+this.radius * Math.cos(angle), this.radius * Math.sin(angle));
				
				
				c.addToWorld();
				
				this.circles.push(c);
			}
		}
		
		private function createJoints():void
		{
			for (var i:int = 0; i < this.complexity; i++)
			{
				var joint_def:b2DistanceJointDef = new b2DistanceJointDef();
				var rev_joint_def:b2RevoluteJointDef = new b2RevoluteJointDef();
				
				var c1:Circle = this.circles[i];
				var c2:Circle;
				
				if (i == this.complexity - 1)
				{
					c2 = this.circles[0];
				}
				else
				{
					c2 = this.circles[i + 1];
				}
				
				//joint_def.Initialize(c1.getBody(), c2.getBody(), c1.getBody().GetPosition(), c2.getBody().GetPosition() );
				//joint_def.collideConnected = true;
				
				rev_joint_def.Initialize(c1.getBody(), c2.getBody(), c1.getBody().GetPosition());
				rev_joint_def.collideConnected = false;
				rev_joint_def.enableLimit = true;
				rev_joint_def.lowerAngle = 0 * Math.PI / 180;
				rev_joint_def.upperAngle = 360 * Math.PI / 180;
				
				//Physics(Singleton.getInstance().data.physics).getWorld().CreateJoint(joint_def) as b2DistanceJoint;
				
				Physics(Singleton.getInstance().data.physics).getWorld().CreateJoint(rev_joint_def) as b2RevoluteJoint;
			}
		}
		
		public function addToWorld():void
		{
			for (var i:int = 0; i < this.complexity; i++)
			{
				//this.circles[i].addToWorld();
			}
		}
	
	}

}