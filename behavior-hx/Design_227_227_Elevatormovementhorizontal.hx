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



class Design_227_227_Elevatormovementhorizontal extends ActorScript
{          	
	
public var _leftlimit:Float;

public var _rightlimit:Float;

public var _velocity:Float;

public var _Initialdirectionisup:Bool;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("left limit", "_leftlimit");
_leftlimit = 50.0;
nameMap.set("right limit", "_rightlimit");
_rightlimit = 400.0;
nameMap.set("velocity", "_velocity");
_velocity = 5.0;
nameMap.set("Initial direction is right", "_Initialdirectionisup");
_Initialdirectionisup = true;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            if(_Initialdirectionisup)
{
            actor.setXVelocity(_velocity);
}

        else
{
            actor.setXVelocity(-(_velocity));
}

    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((actor.getX() <= _leftlimit))
{
            actor.setXVelocity(_velocity);
}

        if((actor.getX() >= _rightlimit))
{
            actor.setXVelocity(-(_velocity));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}