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



class Design_233_233_FireCannon extends ActorScript
{          	
	
public var type:ActorType;

public var xPos:Float;

public var yPos:Float;

public var angle:Float;

public var power:Float;

public var maxPower:Float;

public var FiringSound:Sound;
    public function _customEvent_fire():Void
{
        playSound(FiringSound);
        xPos = asNumber((getMouseY() - actor.getYCenter()));
propertyChanged("xPos", xPos);
        yPos = asNumber((getMouseX() - actor.getXCenter()));
propertyChanged("yPos", yPos);
        angle = asNumber(Utils.DEG * (Math.atan2(yPos, xPos)));
propertyChanged("angle", angle);
        power = asNumber(Math.min(maxPower, Math.sqrt((Math.pow(xPos, 2) + Math.pow(yPos, 2)))));
propertyChanged("power", power);
        createRecycledActor(type, actor.getXCenter(), actor.getYCenter(), Script.BACK);
        getLastCreatedActor().sendToBack();
        getLastCreatedActor().setX(((getLastCreatedActor().getX() - 10) + (Math.sin(Utils.RAD * (angle)) * 60)));
        getLastCreatedActor().setY(((getLastCreatedActor().getY() - 0) + (Math.cos(Utils.RAD * (angle)) * 60)));
        getLastCreatedActor().setXVelocity((Math.sin(Utils.RAD * (angle)) * (power / 7.8)));
        getLastCreatedActor().setYVelocity((Math.cos(Utils.RAD * (angle)) * (power / 5.2)));
}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Actor to Create", "type");
type = getActorType(2);
nameMap.set("xPos", "xPos");
xPos = 0.0;
nameMap.set("yPos", "yPos");
yPos = 0.0;
nameMap.set("angle", "angle");
angle = 0.0;
nameMap.set("power", "power");
power = 0.0;
nameMap.set("Max Power", "maxPower");
maxPower = 0.0;
nameMap.set("Firing Sound", "FiringSound");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		
	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}