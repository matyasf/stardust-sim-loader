package
{
import com.funkypandagame.stardustplayer.SimLoader;
import com.funkypandagame.stardustplayer.SDEConstants;
import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;
import com.funkypandagame.stardustplayer.project.ProjectValueObject;

import flash.display.BlendMode;

import flash.events.Event;

import flash.utils.ByteArray;

import idv.cjcat.stardustextended.common.clocks.ImpulseClock;
import idv.cjcat.stardustextended.common.clocks.SteadyClock;
import idv.cjcat.stardustextended.common.emitters.Emitter;

import idv.cjcat.stardustextended.flashdisplay.handlers.DisplayObjectHandler;
import idv.cjcat.stardustextended.twoD.zones.Line;

import org.flexunit.assertThat;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

import org.flexunit.async.Async;

public class SimLoaderTest
{
    [Embed(source="../resources/simWithBurstAndNormalClock.sde", mimeType="application/octet-stream")]
    private var SimWithBurstAndNormalClock:Class;
    private const simWithBurstAndNormalClock : ByteArray = new SimWithBurstAndNormalClock() as ByteArray;

    [Test(async)]
    public function projectValues_areSet() : void
    {
        var loader : SimLoader = new SimLoader();
        Async.handleEvent(this, loader, Event.COMPLETE, projectValues_areSet_loaded, 500);
        loader.loadSim( simWithBurstAndNormalClock );
    }

    private function projectValues_areSet_loaded( event : Event, passThroughData : Object) : void
    {
        const sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();
        assertEquals( 2, sim.version );
        assertEquals( 2, sim.numberOfEmitters );
    }

    [Test(async)]
    public function emitterValues_areSet() : void
    {
        var loader : SimLoader = new SimLoader();
        Async.handleEvent(this, loader, Event.COMPLETE, emitterValues_areSet_loaded, 500);
        loader.loadSim( simWithBurstAndNormalClock );
    }

    private function emitterValues_areSet_loaded( event : Event, passThroughData : Object) : void
    {
        var sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();
        assertEquals( 2, sim.numberOfEmitters );
        assertEquals( 2, sim.initialPositions.length );
        assertThat( sim.initialPositions[0] is Line );
        assertThat( sim.initialPositions[1] is Line );

        const emitter0 : EmitterValueObject = sim.emitters[0];
        assertEquals( BlendMode.NORMAL, DisplayObjectHandler(emitter0.emitter.particleHandler).blendMode );
        assertEquals( 12, ImpulseClock(emitter0.emitter.clock).burstInterval );
        assertNotNull( emitter0.emitter );
        assertEquals( 0, emitter0.id );
        assertEquals( "stardustEmitter_0.xml", SDEConstants.getXMLName(emitter0.id) );
        assertEquals( "emitterImage_0.png", SDEConstants.getImageName(emitter0.id) );

        const emitter1 : EmitterValueObject = sim.emitters[1];
        assertEquals( BlendMode.NORMAL, DisplayObjectHandler(emitter1.emitter.particleHandler).blendMode );
	    assertTrue( emitter1.emitter.clock is SteadyClock );
        assertNotNull( emitter1.emitter );
        assertEquals( 1, emitter1.id );
        assertEquals( "stardustEmitter_1.xml", SDEConstants.getXMLName(emitter1.id) );
        assertEquals( "emitterImage_1.png", SDEConstants.getImageName(emitter1.id) );
    }

    [Test(async)]
    public function emitters_areParsedCorrectly() : void
    {
        var loader : SimLoader = new SimLoader();
        Async.handleEvent(this, loader, Event.COMPLETE, emitters_areParsedCorrectly_loaded, 500);
        loader.loadSim( simWithBurstAndNormalClock );
    }

    private function emitters_areParsedCorrectly_loaded( event : Event, passThroughData : Object) : void
    {
        var sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();
        const emitter0 : Emitter = EmitterValueObject(sim.emitters[0]).emitter;
        assertEquals( 3, emitter0.actions.length );
        assertEquals( 3, emitter0.initializers.length );
        assertEquals( 34, ImpulseClock(emitter0.clock ).impulseCount );
        assertEquals( 1, ImpulseClock(emitter0.clock ).repeatCount );
        assertTrue( (emitter0.particleHandler is DisplayObjectHandler) );
        assertEquals( BlendMode.NORMAL, DisplayObjectHandler(emitter0.particleHandler ).blendMode );

        const emitter1 : Emitter = EmitterValueObject(sim.emitters[1] ).emitter;
        assertEquals( 3, emitter1.actions.length );
        assertEquals( 3, emitter1.initializers.length );
        assertEquals( 1, SteadyClock(emitter1.clock ).ticksPerCall );
        assertTrue( (emitter1.particleHandler is DisplayObjectHandler) );
        assertEquals( BlendMode.NORMAL, DisplayObjectHandler(emitter1.particleHandler ).blendMode );
    }

    [Test(async)]
    public function initialPositions_areCorrect() : void
    {
        var loader : SimLoader = new SimLoader();
        Async.handleEvent(this, loader, Event.COMPLETE, initialPositions_areCorrectLoaded, 500);
        loader.loadSim( simWithBurstAndNormalClock );
    }

    private function initialPositions_areCorrectLoaded( event : Event, passThroughData : Object) : void
    {
        var sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();

        assertEquals( 2, sim.initialPositions.length);

        assertThat( sim.initialPositions[0] is Line);
        assertThat( sim.initialPositions[1] is Line);

        assertEquals( 100, Line(sim.initialPositions[0]).x2);
        assertEquals( 300, Line(sim.initialPositions[1]).x2);
    }


}
}
