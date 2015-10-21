package com.funkypandagame.stardustplayer.emitter
{

import idv.cjcat.stardustextended.CommonClassPackage;
import idv.cjcat.stardustextended.emitters.Emitter;

import idv.cjcat.stardustextended.xml.XMLBuilder;

import idv.cjcat.stardustextended.handlers.starling.StarlingHandler;

public class EmitterBuilder
{

    private static var _builder : XMLBuilder;

    public static function buildEmitter(sourceXML : XML, uniqueEmitterId : String) : Emitter
    {
        createBuilderIfNeeded();
        _builder.buildFromXML( sourceXML );
        var emitter : Emitter = (_builder.getElementsByClass(Emitter))[0] as Emitter;
        emitter.name = uniqueEmitterId;
        return emitter;
    }

    /**
     * Returns the builder that is used to parse the XML descriptor.
     * You can use it to register new custom classes from your XML.
     */
    public static function get builder() : XMLBuilder
    {
        createBuilderIfNeeded();
        return _builder;
    }

    private static function createBuilderIfNeeded() : void
    {
        if ( _builder == null)
        {
            _builder = new XMLBuilder();
            _builder.registerClassesFromClassPackage( CommonClassPackage.getInstance() );
            _builder.registerClass( StarlingHandler );
        }
    }
}
}
