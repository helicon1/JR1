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



class Design_234_234_FaceMouse extends ActorScript
{          	
	
public var x:Float;

public var y:Float;

public var angle:Float;

public var initAngle:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("x", "x");
x = 0.0;
nameMap.set("y", "y");
y = 0.0;
nameMap.set("angle", "angle");
angle = 0.0;
nameMap.set("Initial Angle", "initAngle");
initAngle = 90.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        x = asNumber((getMouseX() - actor.getXCenter()));
propertyChanged("x", x);
        y = asNumber((getMouseY() - actor.getYCenter()));
propertyChanged("y", y);
        angle = asNumber(Utils.DEG * (Math.atan2(y, x)));
propertyChanged("angle", angle);
        actor.setAngle(Utils.RAD * ((angle + initAngle)));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}