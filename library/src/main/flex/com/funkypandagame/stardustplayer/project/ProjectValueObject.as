package com.funkypandagame.stardustplayer.project
{

import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;

import flash.display.DisplayObject;
import flash.utils.ByteArray;

import flash.utils.Dictionary;

public class ProjectValueObject
{
    public var version : Number;
    public const emitters : Dictionary = new Dictionary(); // EmitterValueObject
    public var backgroundColor : uint;
    public var hasBackground : Boolean;
    public var backgroundFileName : String;
    public var backgroundImage : DisplayObject;
    public var backgroundRawData : ByteArray;
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

    /** The simulation will be unusable after calling this method. Note that this disposes StarlingHandler's texture. */
    public function destroy() : void
    {
        for each (var emitterValueObject : EmitterValueObject in emitters)
        {
            emitterValueObject.emitter.clearParticles();
            emitterValueObject.emitter.clearActions();
            emitterValueObject.emitter.clearInitializers();
            emitterValueObject.image = null;
            if (emitterValueObject.texture)
            {
                emitterValueObject.texture.dispose();
            }
            delete emitters[emitterValueObject.id];
        }
        backgroundImage = null;
    }

}
}
