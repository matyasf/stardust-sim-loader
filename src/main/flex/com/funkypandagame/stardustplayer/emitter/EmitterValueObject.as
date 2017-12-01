package com.funkypandagame.stardustplayer.emitter
{

import flash.utils.ByteArray;
import idv.cjcat.stardustextended.emitters.Emitter;

import idv.cjcat.stardustextended.particles.Particle;
import idv.cjcat.stardustextended.particles.PooledParticleFactory;

import idv.cjcat.stardustextended.handlers.starling.StarlingHandler;

import stardustProtos.ParticleSnapshot;

import stardustProtos.ParticleSnapshots;

import starling.textures.SubTexture;

public class EmitterValueObject
{
    public var emitter : Emitter;
    /**
     * Snapshot of the particles. If its not null then the emitter will have the particles stored here upon creation.
     **/
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
        emitterSnapshot.position = 0;
        var snap : ParticleSnapshots = new ParticleSnapshots();
        snap.mergeFrom(emitterSnapshot);

        var factory : PooledParticleFactory = new PooledParticleFactory();
        var particles : Vector.<Particle> = factory.createParticles(snap.particles.length, 0);
        for (var j : int = 0; j < snap.particles.length; j++) {
            var p2d : Particle = particles[j];
            var deSerialized : ParticleSnapshot = snap.particles[j];
            p2d.x = deSerialized.x;
            p2d.y = deSerialized.y;
            p2d.vx = deSerialized.vx;
            p2d.vy = deSerialized.vy;
            p2d.rotation = deSerialized.rotation;
            p2d.omega = deSerialized.omega;
            p2d.initLife = deSerialized.initLife;
            p2d.initScale = deSerialized.initScale;
            p2d.initAlpha = deSerialized.initAlpha;
            p2d.life = deSerialized.life;
            p2d.scale = deSerialized.scale;
            p2d.alpha = deSerialized.alpha;
            p2d.mass = deSerialized.mass;
            p2d.isDead = deSerialized.isDead;
            p2d.colorR = deSerialized.colorR;
            p2d.colorG = deSerialized.colorG;
            p2d.colorB = deSerialized.colorB;
            p2d.currentAnimationFrame = deSerialized.currentAnimationFrame;
        }
        emitter.addParticles(particles);

    }

}
}
