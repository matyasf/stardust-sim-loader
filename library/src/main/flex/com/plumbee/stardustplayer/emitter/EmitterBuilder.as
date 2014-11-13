package com.plumbee.stardustplayer.emitter
{


import idv.cjcat.stardustextended.common.CommonClassPackage;
import idv.cjcat.stardustextended.common.StardustElement;

import idv.cjcat.stardustextended.common.xml.XMLBuilder;
import idv.cjcat.stardustextended.twoD.TwoDClassPackage;

import idv.cjcat.stardustextended.twoD.emitters.Emitter2D;
import idv.cjcat.stardustextended.twoD.starling.StarlingDisplayObjectClass;
import idv.cjcat.stardustextended.twoD.starling.StarlingEmitter;
import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;
import idv.cjcat.stardustextended.twoD.starling.StarlingInitializer;

public class EmitterBuilder
{

    private static var builder : XMLBuilder;

    public static function buildEmitter(sourceXML : XML) : Emitter2D
    {
        if ( builder == null)
        {
            builder = new XMLBuilder();
            builder.registerClassesFromClassPackage( CommonClassPackage.getInstance() );
            builder.registerClassesFromClassPackage( TwoDClassPackage.getInstance() );
            builder.registerClass( StarlingDisplayObjectClass );
            builder.registerClass( StarlingHandler );
            builder.registerClass( StarlingInitializer );
            builder.registerClass( StarlingEmitter );
        }
        builder.buildFromXML( sourceXML );
        return (builder.getElementsByClass(Emitter2D) as Vector.<StardustElement>)[0] as Emitter2D;
    }
}
}
