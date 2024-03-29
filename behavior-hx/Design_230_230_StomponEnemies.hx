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



class Design_230_230_StomponEnemies extends ActorScript
{          	
	
public var _StompableGroup:Group;

public var _JumpKey:String;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Stompable Group", "_StompableGroup");
nameMap.set("Jump Key", "_JumpKey");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(event.thisCollidedWithActor)
{
            if(event.thisFromBottom)
{
                if((internalGetGroup(event.otherActor, event.otherShape) == _StompableGroup))
{
                    if(!(asBoolean(actor.getLastCollidedActor().getActorValue("_BeingStomped"))))
{
                        actor.getLastCollidedActor().say("Stompable", "_customEvent_" + "stomped");
                        if(isKeyDown(_JumpKey))
{
                            actor.setYVelocity(-(asNumber(actor.getLastCollidedActor().getValue("Stompable", "_PushPlayerJumpForce"))));
}

                        else
{
                            actor.setYVelocity(-(asNumber(actor.getLastCollidedActor().getValue("Stompable", "_PushPlayerForce"))));
}

}

}

}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}