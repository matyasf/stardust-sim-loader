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
import flash.utils.ByteArray;

import idv.cjcat.stardustextended.Stardust;
import idv.cjcat.stardustextended.actions.Action;
import idv.cjcat.stardustextended.actions.Spawn;
import idv.cjcat.stardustextended.emitters.Emitter;
import idv.cjcat.stardustextended.handlers.starling.StarlingHandler;

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
            throw new Error(DESCRIPTOR_FILENAME + " not found.");
        }
        if (parseFloat(descriptorJSON.version) < Stardust.VERSION)
        {
            trace("Stardust Sim Loader: WARNING loaded simulation is created with an old version of the editor, it might not run.");
        }

        var atlasFound : Boolean = false;
        for (var i:int = 0; i < loadedZip.getFileCount(); i++)
        {
            var loadedFileName : String = loadedZip.getFileAt(i).filename;
            if (loadedFileName == SDEConstants.ATLAS_IMAGE_NAME)
            {
                var loadAtlasJob : LoadByteArrayJob = new LoadByteArrayJob(
                        loadedFileName,
                        loadedFileName,
                        loadedZip.getFileAt(i).content );
                sequenceLoader.addJob( loadAtlasJob );
                sequenceLoader.addEventListener( Event.COMPLETE, onProjectAtlasLoaded );
                sequenceLoader.loadSequence();
                atlasFound = true;
                break;
            }
        }
        if (!atlasFound)
        {
            throw new Error(SDEConstants.ATLAS_IMAGE_NAME + " not found, cannot load this file");
        }
    }

    private function onProjectAtlasLoaded( event : Event ) : void
    {
        sequenceLoader.removeEventListener( Event.COMPLETE, onProjectAtlasLoaded );

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
        var job : LoadByteArrayJob = sequenceLoader.getCompletedJobs().pop();
        var atlasXMLBA : ByteArray = loadedZip.getFileByName(SDEConstants.ATLAS_XML_NAME).content;
        var atlasXML : XML = new XML(atlasXMLBA.readUTFBytes(atlasXMLBA.length));
        var atlasBD : BitmapData = Bitmap(job.content).bitmapData;
        atlas = new TextureAtlas(Texture.fromBitmapData(atlasBD, false), atlasXML);

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
            var allTextures : Vector.<SubTexture> = new Vector.<SubTexture>();
            var textures : Vector.<Texture> = atlas.getTextures(SDEConstants.getSubTexturePrefix(emitterVO.id));
            var len : uint = textures.length;
            for ( var k : int = 0; k < len; k++ )
            {
                allTextures.push(textures[k]);
            }
            StarlingHandler(emitterVO.emitter.particleHandler).setTextures(allTextures);
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

    /**
     * Call this if you don't want to create more instances of this project to free up its memory and
     * there are no simulations from this loader running.
     * Note that this disposes the underlying texture atlas!
     * After calling it createProjectInstance() will not work.
     */
    public function dispose() : void
    {
        sequenceLoader.clearAllJobs();
        projectLoaded = false;
        descriptorJSON = null;
        if (atlas)
        {
            atlas.dispose();
            atlas = null;
        }
        for each (var rawEmitterData : RawEmitterData in rawEmitterDatas)
        {
            if (rawEmitterData.snapshot)
            {
                rawEmitterData.snapshot.clear();
            }
        }
        rawEmitterDatas = new Vector.<RawEmitterData>();
    }

}
}

import flash.utils.ByteArray;

class RawEmitterData
{
    public var emitterID : String;
    public var emitterXML : XML;
    public var snapshot : ByteArray;
}