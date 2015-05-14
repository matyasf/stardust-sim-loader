package com.funkypandagame.stardustplayer.emitter
{

import idv.cjcat.stardustextended.common.CommonClassPackage;
import idv.cjcat.stardustextended.common.StardustElement;
import idv.cjcat.stardustextended.common.emitters.Emitter;

import idv.cjcat.stardustextended.common.xml.XMLBuilder;
import idv.cjcat.stardustextended.flashdisplay.FlashDisplayClassPackage;
import idv.cjcat.stardustextended.twoD.TwoDClassPackage;

import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;

public class EmitterBuilder
{

    private static var builder : XMLBuilder;

    public static function buildEmitter(sourceXML : XML, uniqueEmitterId : String) : Emitter
    {
        if ( builder == null)
        {
            builder = new XMLBuilder();
            builder.registerClassesFromClassPackage( CommonClassPackage.getInstance() );
            builder.registerClassesFromClassPackage( TwoDClassPackage.getInstance() );
            builder.registerClass( StarlingHandler );
        }
        builder.buildFromXML( sourceXML );
        var emitter : Emitter = (builder.getElementsByClass(Emitter) as Vector.<StardustElement>)[0] as Emitter;
        emitter.name = uniqueEmitterId;
        return emitter;
    }
}
}
