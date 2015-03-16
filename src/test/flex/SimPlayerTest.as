package
{
import com.funkypandagame.stardustplayer.SimLoader;
import com.funkypandagame.stardustplayer.SimPlayer;
import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;
import com.funkypandagame.stardustplayer.project.ProjectValueObject;

import flash.display.Sprite;

import flash.events.Event;

import flash.utils.ByteArray;

import idv.cjcat.stardustextended.twoD.handlers.DisplayObjectHandler;

import org.flexunit.asserts.assertEquals;
import org.flexunit.async.Async;

public class SimPlayerTest
{

    [Embed(source="../resources/simWithBurstAndNormalClock.sde", mimeType="application/octet-stream")]
    private var SimWithBurstAndNormalClock:Class;
    private const simWithBurstAndNormalClock : ByteArray = new SimWithBurstAndNormalClock() as ByteArray;

    [Test(async)]
    public function simWithBurstClock_bursts() : void
    {
        var loader : SimLoader = new SimLoader();
        Async.handleEvent(this, loader, Event.COMPLETE, simWithBurstClock_bursts_loaded, 500);
        loader.loadSim( simWithBurstAndNormalClock );
    }

    private function simWithBurstClock_bursts_loaded( event : Event, passThroughData : Object) : void
    {
        const sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();

        const player : SimPlayer = new SimPlayer();

        player.setProject( sim );
        player.setRenderTarget( new Sprite());

        player.stepSimulation();
        player.stepSimulation();

        for (var i : int = 0; i < 12; i++)
        {
            assertEquals( 34, EmitterValueObject(sim.emitters[0]).emitter.numParticles);
            player.stepSimulation();
        }
        assertEquals( 14, EmitterValueObject(sim.emitters[0]).emitter.currentTime );
        for (var k : int = 0; k < 12; k++)
        {
            assertEquals( 68, EmitterValueObject(sim.emitters[0]).emitter.numParticles);
            player.stepSimulation();
        }
        assertEquals( 102, EmitterValueObject(sim.emitters[0]).emitter.numParticles);
        assertEquals( 26, EmitterValueObject(sim.emitters[0]).emitter.currentTime );
    }

    [Test(async)]
    public function simTime_stepsCorrectTime() : void
    {
        var loader : SimLoader = new SimLoader();
        Async.handleEvent(this, loader, Event.COMPLETE, simTime_stepsCorrectTime_loaded, 500);
        loader.loadSim( simWithBurstAndNormalClock );
    }

    private function simTime_stepsCorrectTime_loaded( event : Event, passThroughData : Object) : void
    {
        const sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();

        const player : SimPlayer = new SimPlayer();

        player.setProject( sim );
        player.setRenderTarget( new Sprite());

        player.stepSimulation();
        assertEquals( 1, EmitterValueObject(sim.emitters[0]).emitter.currentTime );
        assertEquals( 1, EmitterValueObject(sim.emitters[1]).emitter.currentTime );

        player.stepSimulation(10);
        assertEquals( 11, EmitterValueObject(sim.emitters[0]).emitter.currentTime );
        assertEquals( 11, EmitterValueObject(sim.emitters[1]).emitter.currentTime );

        player.stepSimulation(3);
        assertEquals( 14, EmitterValueObject(sim.emitters[0]).emitter.currentTime );
        assertEquals( 14, EmitterValueObject(sim.emitters[1]).emitter.currentTime );
    }

    [Test(async)]
    public function player_setsCorrectDisplayHandler() : void
    {
        var loader : SimLoader = new SimLoader();
        Async.handleEvent(this, loader, Event.COMPLETE, player_setsCorrectDisplayHandler_loaded, 500);
        loader.loadSim( simWithBurstAndNormalClock );
    }

    private function player_setsCorrectDisplayHandler_loaded( event : Event, passThroughData : Object) : void
    {
        const sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();

        const player : SimPlayer = new SimPlayer();

        const canvas : Sprite = new Sprite();

        player.setSimulation( sim, canvas);

        assertEquals( canvas, DisplayObjectHandler(EmitterValueObject(sim.emitters[0]).emitter.particleHandler).container );
        assertEquals( canvas, DisplayObjectHandler(EmitterValueObject(sim.emitters[1]).emitter.particleHandler).container );
    }

}
}
