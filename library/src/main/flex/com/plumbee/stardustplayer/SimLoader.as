package com.plumbee.stardustplayer
{

import com.plumbee.stardustplayer.emitter.EmitterBuilder;
import com.plumbee.stardustplayer.emitter.EmitterValueObject;
import com.plumbee.stardustplayer.project.ProjectValueObject;
import com.plumbee.stardustplayer.sequenceLoader.ISequenceLoader;
import com.plumbee.stardustplayer.sequenceLoader.LoadByteArrayJob;
import com.plumbee.stardustplayer.sequenceLoader.SequenceLoader;

import flash.display.Bitmap;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.ByteArray;
import idv.cjcat.stardustextended.sd;

import org.as3commons.zip.Zip;

use namespace sd;

public class SimLoader extends EventDispatcher implements ISimLoader
{
    public static const DESCRIPTOR_FILENAME : String = "descriptor.json";
    private static const BACKGROUND_JOB_ID : String = "backgroundID";
    private const sequenceLoader : ISequenceLoader = new SequenceLoader();
    private var _project : ProjectValueObject;
    private var projectLoaded : Boolean = false;

    /** Loads an .sde file (that is in a byteArray). */
    public function loadSim(data : ByteArray) : void
    {
        projectLoaded = false;
        sequenceLoader.clearAllJobs();

        const loadedZip : Zip = new Zip();
        loadedZip.loadBytes( data );
        const descriptorJSON : Object = JSON.parse( loadedZip.getFileByName(DESCRIPTOR_FILENAME).getContentAsString() );
        if (uint(descriptorJSON.version) < 2)
        {
            trace("Stardust Sim Loader: WARNING This is a simulation created with a old version of the editor, it might not run.");
        }
        _project = new ProjectValueObject( descriptorJSON );

        for (var i:int = 0; i < loadedZip.getFileCount(); i++)
        {
            var loadedFileName : String = loadedZip.getFileAt(i).filename;
            if (ZipFileNames.isEmitterXMLName(loadedFileName))
            {
                var emitterId : uint = ZipFileNames.getEmitterID(loadedFileName);

                const stardustBA : ByteArray = loadedZip.getFileByName( loadedFileName ).content;
                const emitterXml : XML = new XML( stardustBA.readUTFBytes( stardustBA.length ) );

                _project.emitters[emitterId] = new EmitterValueObject(emitterId, EmitterBuilder.buildEmitter(emitterXml));

                const loadImageJob : LoadByteArrayJob = new LoadByteArrayJob(
                        emitterId.toString(),
                        ZipFileNames.getImageName(emitterId),
                        loadedZip.getFileByName(ZipFileNames.getImageName(emitterId)).content );
                sequenceLoader.addJob( loadImageJob );
            }
        }

        if ( loadedZip.getFileByName(_project.backgroundFileName) != null )
        {
            const backgroundJob : LoadByteArrayJob = new LoadByteArrayJob( BACKGROUND_JOB_ID,
                                                         _project.backgroundFileName,
                                                         loadedZip.getFileByName(_project.backgroundFileName).content );
            sequenceLoader.addJob( backgroundJob );
        }

        sequenceLoader.addEventListener( Event.COMPLETE, onProjectAssetsLoaded );
        sequenceLoader.loadSequence();
    }

    private function onProjectAssetsLoaded( event : Event ) : void
    {
        sequenceLoader.removeEventListener( Event.COMPLETE, onProjectAssetsLoaded );

        for each (var emitterVO : EmitterValueObject in _project.emitters)
        {
            const job : LoadByteArrayJob = sequenceLoader.getJobByName( emitterVO.id.toString() );
            emitterVO.image = Bitmap(job.content).bitmapData;
        }
        if ( sequenceLoader.getJobByName(BACKGROUND_JOB_ID) )
        {
            _project.backgroundImage = sequenceLoader.getJobByName(BACKGROUND_JOB_ID).content;
            _project.backgroundRawData = sequenceLoader.getJobByName(BACKGROUND_JOB_ID).byteArray;
        }
        sequenceLoader.clearAllJobs();
        projectLoaded = true;
        dispatchEvent( new Event(Event.COMPLETE) );
    }

    public function get project() : ProjectValueObject
    {
        if (projectLoaded)
        {
            return _project;
        }
        return null;
    }
}
}
