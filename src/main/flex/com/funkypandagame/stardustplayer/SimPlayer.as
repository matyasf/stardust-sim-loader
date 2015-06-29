package com.funkypandagame.stardustplayer
{

import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;
import com.funkypandagame.stardustplayer.project.ProjectValueObject;

import idv.cjcat.stardustextended.common.clocks.ImpulseClock;

import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;

import starling.display.DisplayObjectContainer;

/** Simple class to play back simulations. */
public class SimPlayer
{
    protected var _project : ProjectValueObject;
    protected var _renderTarget : DisplayObjectContainer;

    public function setProject(sim : ProjectValueObject) : void
    {
        if (sim == null)
        {
            trace("WARNING: A simulation can not be null");
        }
        _project = sim;
        setupSimulation();
    }

    public function setRenderTarget(renderTarget : DisplayObjectContainer) : void
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
            StarlingHandler(emitter.emitter.particleHandler).container = _renderTarget as DisplayObjectContainer;
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
