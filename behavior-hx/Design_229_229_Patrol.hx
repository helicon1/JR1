package scripts;

import com.stencyl.graphics.G;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.events.Event;
import nme.events.TouchEvent;
import nme.net.URLLoader;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;



class Design_229_229_Patrol extends ActorScript
{          	
	
public var speed:Float;

public var leftanim:String;

public var rightanim:String;

public var dir:Float;
    public function _customEvent_left_to_right():Void
{
        actor.setXVelocity(speed);
        actor.setAnimation("" + rightanim);
}

    public function _customEvent_right_to_left():Void
{
        actor.setXVelocity(-(speed));
        actor.setAnimation("" + leftanim);
}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Walking Speed", "speed");
speed = 1.0;
nameMap.set("Left Animation", "leftanim");
nameMap.set("Right Animation", "rightanim");
nameMap.set("Initial Direction", "dir");
dir = -1.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            if((dir == 1))
{
            _customEvent_left_to_right();
}

        else
{
            _customEvent_right_to_left();
}

    addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(event.thisFromLeft)
{
            _customEvent_left_to_right();
}

        if(event.thisFromRight)
{
            _customEvent_right_to_left();
}

}
});
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((actor.getXVelocity() >= 0))
{
            actor.setXVelocity(speed);
}

        else
{
            actor.setXVelocity(-(speed));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}