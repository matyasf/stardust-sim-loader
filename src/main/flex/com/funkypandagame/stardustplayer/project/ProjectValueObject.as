package com.funkypandagame.stardustplayer.project
{

import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;

import flash.utils.Dictionary;

import idv.cjcat.stardustextended.common.emitters.Emitter;

import idv.cjcat.stardustextended.common.particles.Particle;

import idv.cjcat.stardustextended.twoD.starling.StardustStarlingRenderer;
import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;

public class ProjectValueObject
{
    public var version : Number;

    public const emitters : Dictionary = new Dictionary(); // EmitterValueObject

    public function ProjectValueObject( _version : Number )
    {
        version = _version;
    }

    public function get numberOfEmitters() : int
    {
        var numEmitters : uint = 0;
        for each (var emitter : Object in emitters)
        {
            numEmitters++;
        }
        return numEmitters;
    }

    public function get numberOfParticles() : uint
    {
        var numParticles : uint = 0;
        for each (var emVO : EmitterValueObject in emitters)
        {
            numParticles += emVO.emitter.numParticles;
        }
        return numParticles;
    }

    /** Convenience function to get all emitters */
    public function get emittersArr() : Vector.<Emitter>
    {
        const emitterVec : Vector.<Emitter> = new Vector.<Emitter>();
        for each (var emVO : EmitterValueObject in emitters)
        {
            emitterVec.push(emVO.emitter);
        }
        return emitterVec;
    }

    /** Removes all particles and puts the simulation back to its initial state. */
    public function resetSimulation() : void
    {
        for each (var emitterValueObject : EmitterValueObject in emitters)
        {
            emitterValueObject.emitter.reset();
        }
    }

    /**
     * The simulation will be unusable after calling this method.
     * Note that this does *NOT* dispose StarlingHandler's texture, since textures are shared by instances.
     * To dispose the texture call SimLoader.dispose if you dont want to create more simulations of this type.
     **/
    public function destroy() : void
    {
        for each (var emitterValueObject : EmitterValueObject in emitters)
        {
            emitterValueObject.emitter.clearParticles();
            emitterValueObject.emitter.clearActions();
            emitterValueObject.emitter.clearInitializers();
            emitterValueObject.emitterSnapshot = null;
            var renderer : StardustStarlingRenderer = StarlingHandler(emitterValueObject.emitter.particleHandler).renderer;
            // If this is not called, then Starling can call the render() function of the renderer,
            // which will try to render with disposed textures.
            renderer.advanceTime(new Vector.<Particle>());
            if (renderer.parent)
            {
                renderer.parent.removeChild(renderer);
            }
            delete emitters[emitterValueObject.id];
        }
    }

}
}
