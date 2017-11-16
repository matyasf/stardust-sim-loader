package com.funkypandagame.stardustplayer.emitter
{

import idv.cjcat.stardustextended.CommonClassPackage;
import idv.cjcat.stardustextended.emitters.Emitter;
import idv.cjcat.stardustextended.json.JsonBuilder;

import idv.cjcat.stardustextended.handlers.starling.StarlingHandler;

public class EmitterBuilder
{

    private static var _builder : JsonBuilder;

    public static function buildEmitter(sourceJson : String, uniqueEmitterId : String) : Emitter
    {
        createBuilderIfNeeded();

        var emitter : Emitter = _builder.buildFromJson(sourceJson);

        emitter.name = uniqueEmitterId;
        return emitter;
    }

    /**
     * Returns the builder that is used to parse the JSON descriptor.
     * You can use it to register new custom classes from your JSON.
     */
    public static function get builder() : JsonBuilder
    {
        createBuilderIfNeeded();
        return _builder;
    }

    private static function createBuilderIfNeeded() : void
    {
        if ( _builder == null)
        {
            _builder = new JsonBuilder();
            _builder.registerClassesFromClassPackage( CommonClassPackage.getInstance() );
            _builder.registerClass( StarlingHandler );
        }
    }
}
}
