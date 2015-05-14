package com.funkypandagame.stardustplayer
{

import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;
import com.funkypandagame.stardustplayer.project.ProjectValueObject;

import flash.display.BitmapData;

import flash.display.DisplayObjectContainer;

import idv.cjcat.stardustextended.common.clocks.ImpulseClock;

import idv.cjcat.stardustextended.common.handlers.ParticleHandler;
import idv.cjcat.stardustextended.flashdisplay.handlers.BitmapHandler;
import idv.cjcat.stardustextended.flashdisplay.handlers.DisplayObjectHandler;
import idv.cjcat.stardustextended.flashdisplay.handlers.DisplayObjectSpriteSheetHandler;
import idv.cjcat.stardustextended.twoD.handlers.PixelHandler;
import idv.cjcat.stardustextended.flashdisplay.handlers.SingularBitmapHandler;
import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;

import starling.display.QuadBatch;

/** Simple class to play back simulations. */
public class SimPlayer
{
    protected var _project : ProjectValueObject;
    protected var _renderTarget : Object;

    [Deprecated(message="Use setProject() and setRenderTarget() instead")]
    public function setSimulation( sim : ProjectValueObject, renderTarget : Object ) : void
    {
        setProject(sim);
        setRenderTarget(renderTarget);
    }

    public function setProject(sim : ProjectValueObject) : void
    {
        if (sim == null)
        {
            trace("WARNING: A simulation can not be null");
        }
        _project = sim;
        setupSimulation();
    }

    public function setRenderTarget(renderTarget : Object) : void
    {
        if (renderTarget == null)
        {
            trace("renderTarget cannot be null");
        }
        _renderTarget = renderTarget;
        setupSimulation();
    }

    protected function setupSimulation() : void
    {
        if (_renderTarget == null || _project == null)
        {
            return;
        }
        for each (var emitter : EmitterValueObject in _project.emitters)
        {
            const handler : ParticleHandler = emitter.emitter.particleHandler;
            if (handler is DisplayObjectHandler)
            {
                DisplayObjectHandler(handler).container = _renderTarget as DisplayObjectContainer;
            }
            if (handler is DisplayObjectSpriteSheetHandler)
            {
                DisplayObjectSpriteSheetHandler(handler).container = _renderTarget as DisplayObjectContainer;
            }
            else if (handler is BitmapHandler)
            {
                BitmapHandler(handler).targetBitmapData = BitmapData(_renderTarget);
            }
            else if (handler is SingularBitmapHandler)
            {
                SingularBitmapHandler(handler).targetBitmapData = BitmapData(_renderTarget);
            }
            else if (handler is PixelHandler)
            {
                PixelHandler(handler).targetBitmapData = BitmapData(_renderTarget);
            }
            else if (handler is StarlingHandler)
            {
                StarlingHandler(handler).container = _renderTarget as starling.display.DisplayObjectContainer;
            }
            else
            {
                throw new Error("Unknown particle handler " + handler);
            }
        }
    }

    public function getProject() : ProjectValueObject
    {
        return _project;
    }

    public function stepSimulation( numSteps : uint = 1) : void
    {
        if (_project == null || _renderTarget == null)
        {
            throw new Error("The simulation and its render target must be set.");
        }
        for each (var emVO : EmitterValueObject in _project.emitters)
        {
            emVO.emitter.step( numSteps );
	        if (emVO.emitter.clock is ImpulseClock)
	        {
		        const impulseClock : ImpulseClock = ImpulseClock(emVO.emitter.clock);
		        if (emVO.emitter.currentTime % impulseClock.burstInterval == 1)
		        {
                    impulseClock.impulse();
		        }
	        }
        }
    }

}
}
