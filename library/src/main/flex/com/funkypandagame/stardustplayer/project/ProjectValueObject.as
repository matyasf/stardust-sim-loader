package com.funkypandagame.stardustplayer.project
{

import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;

import flash.display.DisplayObject;
import flash.utils.ByteArray;

import flash.utils.Dictionary;

import idv.cjcat.stardustextended.twoD.emitters.Emitter2D;

public class ProjectValueObject
{
    public var version : Number;
    public const emitters : Dictionary = new Dictionary(); // EmitterValueObject
    public var backgroundColor : uint;
    public var hasBackground : Boolean;
    public var backgroundFileName : String;
    public var backgroundImage : DisplayObject;
    /** The background image as ByteArray. */
    public var backgroundRawData : ByteArray;
    /** The target FPS of the simulation. */
    public var fps : Number;

    public function ProjectValueObject( projectJSON : Object )
    {
        version = projectJSON.version;

        hasBackground = (projectJSON.hasBackground == "true");

        fps = projectJSON.fps;

        if ( projectJSON.backgroundFileName )
        {
            backgroundFileName = projectJSON.backgroundFileName;
        }
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
    public function get emittersArr() : Vector.<Emitter2D>
    {
        const emitterVec : Vector.<Emitter2D> = new Vector.<Emitter2D>();
        for each (var emVO : EmitterValueObject in emitters)
        {
            emitterVec.push(emVO.emitter);
        }
        return emitterVec;
    }
    /** The simulation will be unusable after calling this method. Note that this disposes StarlingHandler's texture. */
    public function destroy() : void
    {
        for each (var emitterValueObject : EmitterValueObject in emitters)
        {
            emitterValueObject.emitter.clearParticles();
            emitterValueObject.emitter.clearActions();
            emitterValueObject.emitter.clearInitializers();
            emitterValueObject.image = null;
            emitterValueObject.emitterSnapshot = null;
            if (emitterValueObject.texture)
            {
                emitterValueObject.texture.dispose();
            }
            delete emitters[emitterValueObject.id];
        }
        backgroundImage = null;
        backgroundRawData = null;
    }

}
}
