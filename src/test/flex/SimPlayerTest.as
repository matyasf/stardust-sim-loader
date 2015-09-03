package
{
import com.funkypandagame.stardustplayer.SimLoader;
import com.funkypandagame.stardustplayer.SimPlayer;
import com.funkypandagame.stardustplayer.emitter.EmitterValueObject;
import com.funkypandagame.stardustplayer.project.ProjectValueObject;

import flash.events.Event;

import flash.utils.ByteArray;

import idv.cjcat.stardustextended.clocks.ImpulseClock;

import idv.cjcat.stardustextended.handlers.starling.StarlingHandler;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertTrue;
import org.flexunit.async.Async;

import starling.display.Sprite;

// NOTE: tests will work only if the template is used to run them!
public class SimPlayerTest
{

    [Embed(source="../resources/simWithBurstAndNormalClock.sde", mimeType="application/octet-stream")]
    private var SimWithBurstAndNormalClock:Class;
    private const simWithBurstAndNormalClock : ByteArray = new SimWithBurstAndNormalClock() as ByteArray;

    [Before(async, timeout=15500)]
    public function setUp():void
    {
        Async.proceedOnEvent(this, FlexUnitStarlingIntegration.nativeStage, FlexUnitStarlingIntegrationEvent.CONTEXT_CREATED, 15500);
        FlexUnitStarlingIntegration.createStarlingContext();
    }

    [After]
    public function tearDown():void
    {
        FlexUnitStarlingIntegration.destroyStarlingContext();
    }

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

        var emVO : EmitterValueObject = sim.emitters[0];

        assertTrue( emVO.emitter.clock is ImpulseClock );

        player.stepSimulation();
        for (var i : int = 0; i < 12; i++)
        {
            assertEquals("time:" + emVO.emitter.currentTime + " i:" + i, 34, emVO.emitter.numParticles);
            player.stepSimulation();
        }

        for (var k : int = 0; k < 12; k++)
        {
            assertEquals("time:" + emVO.emitter.currentTime + " k:" + k, 68, emVO.emitter.numParticles);
            player.stepSimulation();
        }

        assertEquals( 102, emVO.emitter.numParticles);
        assertEquals( 25, emVO.emitter.currentTime );
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
        var sim : ProjectValueObject = SimLoader(event.target).createProjectInstance();
        var player : SimPlayer = new SimPlayer();

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

        player.setProject( sim );
        player.setRenderTarget( canvas );

        assertEquals( canvas, StarlingHandler(EmitterValueObject(sim.emitters[0]).emitter.particleHandler).renderer.parent );
        assertEquals( canvas, StarlingHandler(EmitterValueObject(sim.emitters[1]).emitter.particleHandler).renderer.parent );
    }

}
}
