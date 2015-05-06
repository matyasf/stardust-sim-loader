package com.funkypandagame.stardustplayer
{

import com.funkypandagame.stardustplayer.emitter.EmitterBuilder;
import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;
import com.funkypandagame.stardustplayer.project.ProjectValueObject;
import com.funkypandagame.stardustplayer.sequenceLoader.ISequenceLoader;
import com.funkypandagame.stardustplayer.sequenceLoader.LoadByteArrayJob;
import com.funkypandagame.stardustplayer.sequenceLoader.SequenceLoader;

import flash.display.Bitmap;
import flash.display.BitmapData;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

import idv.cjcat.stardustextended.Stardust;
import idv.cjcat.stardustextended.common.actions.Action;
import idv.cjcat.stardustextended.common.emitters.Emitter;
import idv.cjcat.stardustextended.twoD.actions.Spawn;
import idv.cjcat.stardustextended.twoD.starling.StarlingHandler;

import org.as3commons.zip.IZipFile;

import org.as3commons.zip.Zip;

import starling.textures.SubTexture;

import starling.textures.Texture;

import starling.textures.TextureAtlas;

public class SimLoader extends EventDispatcher implements ISimLoader
{
    public static const DESCRIPTOR_FILENAME : String = "descriptor.json";
    public static const BACKGROUND_FILENAME : String = "background.png";

    private const sequenceLoader : ISequenceLoader = new SequenceLoader();
    protected var projectLoaded : Boolean = false;
    protected var loadedZip : Zip;
    protected var descriptorJSON : Object;
    protected var rawEmitterDatas : Vector.<RawEmitterData> = new Vector.<RawEmitterData>();
    protected var atlas : TextureAtlas;

    /** Loads an .sde file (that is in a byteArray). */
    public function loadSim(data : ByteArray) : void
    {
        projectLoaded = false;
        sequenceLoader.clearAllJobs();

        loadedZip = new Zip();
        loadedZip.loadBytes( data );
        descriptorJSON = JSON.parse( loadedZip.getFileByName(DESCRIPTOR_FILENAME).getContentAsString() );
        if (descriptorJSON == null)
        {
            throw new Error("Descriptor JSON not found in the simulation ByteArray.");
        }
        if (parseFloat(descriptorJSON.version) < Stardust.VERSION)
        {
            trace("Stardust Sim Loader: WARNING loaded simulation is created with an old version of the editor, it might not run.");
        }

        var hasAtlas : Boolean = loadAtlas();
        if (!hasAtlas)
        {
            loadOldFormatImages();
        }
    }

    private function loadOldFormatImages() : void
    {
        trace("Stardust: Deprecated sde file. Load and save in the editor to convert it to the new format.");
        for (var i:int = 0; i < loadedZip.getFileCount(); i++)
        {
            var loadedFileName : String = loadedZip.getFileAt(i).filename;
            if (SDEConstants.isEmitterXMLName(loadedFileName))
            {
                var emitterId : String = SDEConstants.getEmitterID(loadedFileName);
                const loadImageJob : LoadByteArrayJob = new LoadByteArrayJob(
                        emitterId.toString(),
                        SDEConstants.getImageName(emitterId),
                        loadedZip.getFileByName(SDEConstants.getImageName(emitterId)).content );
                sequenceLoader.addJob( loadImageJob );
            }
        }
        sequenceLoader.addEventListener( Event.COMPLETE, onOldFormatProjectImagesLoaded );
        sequenceLoader.loadSequence();
    }

    private function loadAtlas() : Boolean
    {
        var hasAtlas : Boolean = false;
        for (var i:int = 0; i < loadedZip.getFileCount(); i++)
        {
            var loadedFileName : String = loadedZip.getFileAt(i).filename;
            if (SDEConstants.isAtlasImageName(loadedFileName))
            {
                hasAtlas = true;
                var loadAtlasJob : LoadByteArrayJob = new LoadByteArrayJob(
                        loadedFileName,
                        loadedFileName,
                        loadedZip.getFileAt(i).content );
                sequenceLoader.addJob( loadAtlasJob );
                sequenceLoader.addEventListener( Event.COMPLETE, onProjectAtlasLoaded );
                sequenceLoader.loadSequence();
                break;
            }
        }
        return hasAtlas;
    }

    private function onProjectAtlasLoaded( event : Event ) : void
    {
        sequenceLoader.removeEventListener( Event.COMPLETE, onProjectAtlasLoaded );

        var job : LoadByteArrayJob = sequenceLoader.getCompletedJobs().pop();
        var atlasXMLName : String = job.fileName.substr(0, job.fileName.length - 3) + "xml";
        var atlasXMLBA : ByteArray = loadedZip.getFileByName(atlasXMLName).content;
        var atlasXML : XML = new XML(atlasXMLBA.readUTFBytes(atlasXMLBA.length));
        var atlasBD : BitmapData = Bitmap(job.content).bitmapData;
        atlas = new TextureAtlas(Texture.fromBitmapData(atlasBD), atlasXML);

        for (var i : int = 0; i < loadedZip.getFileCount(); i++)
        {
            var loadedFileName : String = loadedZip.getFileAt(i).filename;
            if (SDEConstants.isEmitterXMLName(loadedFileName))
            {
                const emitterId : String = SDEConstants.getEmitterID(loadedFileName);
                const stardustBA : ByteArray = loadedZip.getFileByName(loadedFileName).content;
                var snapshot : IZipFile = loadedZip.getFileByName(SDEConstants.getParticleSnapshotName(emitterId));

                var rawData : RawEmitterData = new RawEmitterData();
                rawData.emitterID = emitterId;
                rawData.emitterXML = new XML(stardustBA.readUTFBytes(stardustBA.length));

                rawData.snapshot = snapshot ? snapshot.content : null;
                rawEmitterDatas.push(rawData);
            }
        }
        loadedZip = null;
        sequenceLoader.clearAllJobs();
        projectLoaded = true;
        dispatchEvent( new Event(Event.COMPLETE) );
    }

    private function onOldFormatProjectImagesLoaded( event : Event ) : void
    {
        sequenceLoader.removeEventListener( Event.COMPLETE, onOldFormatProjectImagesLoaded );

        for (var i:int = 0; i < loadedZip.getFileCount(); i++)
        {
            var loadedFileName : String = loadedZip.getFileAt(i).filename;
            if (SDEConstants.isEmitterXMLName(loadedFileName))
            {
                const emitterId : String = SDEConstants.getEmitterID(loadedFileName);
                const stardustBA : ByteArray = loadedZip.getFileByName(loadedFileName).content;
                const job : LoadByteArrayJob = sequenceLoader.getJobByName( emitterId.toString() );
                var snapshot : IZipFile = loadedZip.getFileByName(SDEConstants.getParticleSnapshotName(emitterId));

                var rawData : RawEmitterData = new RawEmitterData();
                rawData.emitterID = emitterId;
                rawData.emitterXML = new XML(stardustBA.readUTFBytes(stardustBA.length));
                rawData.image = Bitmap(job.content).bitmapData;
                rawData.snapshot = snapshot ? snapshot.content : null;
                rawEmitterDatas.push(rawData);
            }
        }
        loadedZip = null;
        sequenceLoader.clearAllJobs();
        projectLoaded = true;
        dispatchEvent( new Event(Event.COMPLETE) );
    }

    public function createProjectInstance() : ProjectValueObject
    {
        if (!projectLoaded)
        {
            throw new Error("ERROR: Project is not loaded, call loadSim(), and then wait for the Event.COMPLETE event.");
        }
        var project : ProjectValueObject = new ProjectValueObject(parseFloat(descriptorJSON.version));
        for each(var rawData : RawEmitterData in rawEmitterDatas)
        {
            var emitter : Emitter = EmitterBuilder.buildEmitter(rawData.emitterXML, rawData.emitterID);
            emitter.name = rawData.emitterID;
            var emitterVO : EmitterValueObject = new EmitterValueObject(emitter);
            project.emitters[rawData.emitterID] = emitterVO;
            if (rawData.snapshot)
            {
                emitterVO.emitterSnapshot = rawData.snapshot;
                emitterVO.addParticlesFromSnapshot();
            }
            if (emitterVO.emitter.particleHandler is StarlingHandler)
            {
                var allTextures : Vector.<SubTexture> = new Vector.<SubTexture>();
                if (rawData.image)
                {
                    var handler : StarlingHandler = StarlingHandler(emitterVO.emitter.particleHandler);
                    var spWidth : uint = handler.spriteSheetSliceWidth;
                    var spHeight : uint = handler.spriteSheetSliceHeight;
                    var isSpriteSheet : Boolean = (spWidth > 0 && spHeight > 0) &&
                            (rawData.image.width >= spWidth * 2 || rawData.image.height >= spHeight * 2);
                    if (isSpriteSheet)
                    {
                        var rootTexture : Texture = Texture.fromBitmapData(rawData.image.clone(), false);
                        var xIter : int = Math.floor( rawData.image.width / spWidth );
                        var yIter : int = Math.floor( rawData.image.height / spHeight );
                        for ( var j : int = 0; j < yIter; j ++ )
                        {
                            for ( var i : int = 0; i < xIter; i ++ )
                            {
                                allTextures.push(new SubTexture(rootTexture, new Rectangle( i * spWidth, j * spHeight, spWidth, spHeight )));
                            }
                        }
                    }
                    else
                    {
                        var subTex : SubTexture = new SubTexture(Texture.fromBitmapData(rawData.image.clone(), false), null);
                        allTextures.push(subTex);
                    }
                }
                else if (atlas)
                {
                    var textures : Vector.<Texture> = atlas.getTextures(SDEConstants.getSubTexturePrefix(emitterVO.id));
                    var len : uint = textures.length;
                    for ( var k : int = 0; k < len; k++ )
                    {
                        allTextures.push(textures[k]);
                    }
                }
                else
                {
                    trace("WARNING: Could not load image for emitter", emitterVO.id, "You need to set it manually in its handler");
                }
                StarlingHandler(emitterVO.emitter.particleHandler).setTextures(allTextures);
            }
            else
            {
                trace("Non starling renderers are currently not supported!");
            }
        }

        for each (var em : Emitter in project.emittersArr)
        {
            for each (var action : Action in em.actions)
            {
                if (action is Spawn && Spawn(action).spawnerEmitterId)
                {
                    var spawnAction : Spawn = Spawn(action);
                    for each (var emVO : EmitterValueObject in project.emitters)
                    {
                        if (spawnAction.spawnerEmitterId == emVO.id)
                        {
                            spawnAction.spawnerEmitter = emVO.emitter;
                        }
                    }
                }
            }
        }
        return project;
    }

    // Call this if you don't want to create more instances of this project to free up its memory.
    // After calling it createProjectInstance will not work.
    public function dispose() : void
    {
        projectLoaded = false;
        descriptorJSON = null;
        if (atlas)
        {
            atlas.dispose();
            atlas = null;
        }
        for each (var rawEmitterData : RawEmitterData in rawEmitterDatas)
        {
            if (rawEmitterData.image)
            {
                rawEmitterData.image.dispose();
            }
            if (rawEmitterData.snapshot)
            {
                rawEmitterData.snapshot.clear();
            }
        }
        rawEmitterDatas = new Vector.<RawEmitterData>();
    }

}
}

import flash.display.BitmapData;
import flash.utils.ByteArray;

class RawEmitterData
{
    public var emitterID : String;
    public var emitterXML : XML;
    public var image : BitmapData;
    public var snapshot : ByteArray;
}