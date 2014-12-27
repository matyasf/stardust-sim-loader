package main
{
import com.funkypandagame.stardustplayer.SimLoader;
import com.funkypandagame.stardustplayer.SimPlayer;
import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;

import feathers.controls.Button;
import feathers.themes.MetalWorksMobileTheme;
import idv.cjcat.stardustextended.common.clocks.*
import flash.events.Event;

import flash.utils.ByteArray;

import starling.core.Starling;

import starling.display.Sprite;
import starling.events.EnterFrameEvent;

import starling.events.Event;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TestApp extends Sprite
{

    [Embed(source="/../assets/stardustProjectDEFAULT.sde", mimeType = 'application/octet-stream')]
    private static var Asset:Class;
    private static var assetInstance:ByteArray = new Asset();

    private var simContainer : Sprite;
    private var player : SimPlayer;
    private var loader : SimLoader;
    private var infoTF : TextField;
    private var cnt : uint = 0;

    public function TestApp()
    {
        Starling.current.showStatsAt(HAlign.LEFT, VAlign.BOTTOM);
        new MetalWorksMobileTheme();

        simContainer = new Sprite();
        simContainer.touchable = false;
        addChild(simContainer);

        var addParticlesButton : Button = new Button();
        addParticlesButton.addEventListener(starling.events.Event.TRIGGERED, function (evt : starling.events.Event) : void
        {
            for each (var emitterVO:EmitterValueObject in loader.project.emitters)
            {
                // this emitter's particles live on average for 200 frames, thus adding 0.5 particles/frame
                // will raise the total particles on screen by 100
                SteadyClock(emitterVO.emitter.clock).ticksPerCall += 0.5;
            }

        });
        addParticlesButton.y = 25;
        addParticlesButton.label = "+100 particles";
        addParticlesButton.validate();
        addChild(addParticlesButton);

        var lowerParticlesButton : Button = new Button();
        lowerParticlesButton.addEventListener(starling.events.Event.TRIGGERED, function (evt : starling.events.Event) : void
        {
            for each (var emitterVO:EmitterValueObject in loader.project.emitters)
            {
                SteadyClock(emitterVO.emitter.clock).ticksPerCall -= 0.25;
            }
        });
        lowerParticlesButton.label = "-50 particles";
        lowerParticlesButton.validate();
        lowerParticlesButton.y = 100;
        addChild(lowerParticlesButton);

        infoTF = new TextField(250, 25, "", "Verdana", 20, 0xFFFFFF);
        infoTF.hAlign = HAlign.LEFT;
        addChild(infoTF);

        player = new SimPlayer();
        loader = new SimLoader();
        loader.addEventListener(flash.events.Event.COMPLETE, onSimLoaded);
        loader.loadSim(assetInstance);
    }

    private function onSimLoaded(event : flash.events.Event) : void
    {
        player.setSimulation(loader.project, simContainer);
        // step the simulation on every frame
        addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event : starling.events.Event) : void
    {
        player.stepSimulation();
        cnt++;
        if (cnt%30 == 0)
        {
            infoTF.text = "particles: " + loader.project.numberOfParticles;
        }
    }



}
}
