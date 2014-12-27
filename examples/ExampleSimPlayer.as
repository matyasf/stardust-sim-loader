package
{

import com.funkypandagame.stardustplayer.SimLoader;
import com.funkypandagame.stardustplayer.SimPlayer;

import flash.display.Sprite;

import flash.events.Event;

import flash.utils.ByteArray;

public class ExampleSimPlayer extends Sprite
{

	private var loader : SimLoader;
	private var player : SimPlayer;

	public function ExampleSimPlayer()
	{
		player = new SimPlayer();
		loader = new SimLoader();
	}

	public function loadSim(sim : ByteArray) : void
	{
		loader.addEventListener(Event.COMPLETE, onSimLoaded);
		// this function parses the simulation
		loader.loadSim(sim);
	}

	private function onSimLoaded(event : Event) : void
	{
		player.setSimulation(loader.project, this);
		// step the simulation on every frame
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event : Event) : void
	{
		player.stepSimulation();
	}

}
}
