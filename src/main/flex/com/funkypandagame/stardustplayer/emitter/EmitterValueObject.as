package com.funkypandagame.stardustplayer.emitter
{

import com.funkypandagame.stardustplayer.Particle2DSnapshot;

import flash.net.registerClassAlias;
import flash.utils.ByteArray;
import flash.utils.getQualifiedClassName;

import idv.cjcat.stardustextended.common.emitters.Emitter;

import idv.cjcat.stardustextended.common.particles.Particle;
import idv.cjcat.stardustextended.common.particles.PooledParticleFactory;

import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;

import starling.textures.SubTexture;

public class EmitterValueObject
{
    public var emitter : Emitter;
    /** Snapshot of the particles. If its not null then the emitter will have the particles stored here upon creation. */
    public var emitterSnapshot : ByteArray;

    public function EmitterValueObject( _emitter : Emitter )
    {
        emitter = _emitter;
    }

    public function get id() : String
    {
        return emitter.name;
    }

    public function get textures() : Vector.<SubTexture>
    {
        return StarlingHandler(emitter.particleHandler).textures;
    }

    public function addParticlesFromSnapshot() : void
    {
        registerClassAlias(getQualifiedClassName(Particle2DSnapshot), Particle2DSnapshot);
        emitterSnapshot.position = 0;
        var particlesData : Array = emitterSnapshot.readObject();
        var factory : PooledParticleFactory = new PooledParticleFactory();
        var particles:Vector.<Particle> = factory.createParticles(particlesData.length, 0);
        for (var j:int = 0; j < particlesData.length; j++) {
            Particle2DSnapshot(particlesData[j]).writeDataTo(particles[j]);
        }
        emitter.addParticles(particles);
    }

}
}
