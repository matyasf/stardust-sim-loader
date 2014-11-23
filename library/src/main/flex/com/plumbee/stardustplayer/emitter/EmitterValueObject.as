package com.plumbee.stardustplayer.emitter
{

import flash.display.BitmapData;

import idv.cjcat.stardustextended.sd;

import idv.cjcat.stardustextended.twoD.emitters.Emitter2D;
import idv.cjcat.stardustextended.twoD.handlers.ISpriteSheetHandler;
import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;

import starling.textures.Texture;

use namespace sd;

public class EmitterValueObject
{
    public var emitter : Emitter2D;
    private var _id : uint;
    private var _image : BitmapData;

    public function EmitterValueObject( emitterId : uint, _emitter : Emitter2D )
    {
        emitter = _emitter;
        _id = emitterId;
    }

    public function get id() : uint
    {
        return _id;
    }

    public function get image() : BitmapData
    {
        return _image;
    }

    public function set image(imageBD : BitmapData) : void
    {
        _image = imageBD;
        if (emitter.particleHandler is ISpriteSheetHandler)
        {
            ISpriteSheetHandler(emitter.particleHandler).bitmapData = imageBD;
        }
    }

    /** Returns the texture used by the simulation. Only has value if image has been set and its rendering via Starling.
     *  Note, that this texture does *not* get disposed automatically, you need to do it manually if you are no longer
     *  using it. */
    public function get texture():Texture
    {
        if (emitter.particleHandler is StarlingHandler)
        {
            return StarlingHandler(emitter.particleHandler).texture;
        }
        return null;
    }

}
}
