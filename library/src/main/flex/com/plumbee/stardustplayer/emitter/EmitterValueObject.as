package com.plumbee.stardustplayer.emitter
{

import flash.display.BitmapData;

import idv.cjcat.stardustextended.sd;

import idv.cjcat.stardustextended.twoD.emitters.Emitter2D;
import idv.cjcat.stardustextended.twoD.handlers.ISpriteSheetHandler;

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

}
}
