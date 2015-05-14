package
{

import flash.display.Stage;
import starling.core.Starling;
import starling.display.Sprite;
import starling.events.Event;

	public class FlexUnitStarlingIntegration extends Sprite
	{
        public static var stageRef : Stage;

        private static var _starling:Starling;

		public function FlexUnitStarlingIntegration()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}

		public static function createStarlingContext():void
		{
			_starling = new Starling(FlexUnitStarlingIntegration, stageRef);
			_starling.start();
		}

		public static function destroyStarlingContext():void
		{
			if(_starling)
			{
				_starling.stop();
				_starling.dispose();
				_starling = null;
			}
		}

		public static function get nativeStage():Stage
		{
			return stageRef;
		}

		private function onAddedToStage(event:starling.events.Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			nativeStage.dispatchEvent(new FlexUnitStarlingIntegrationEvent(FlexUnitStarlingIntegrationEvent.CONTEXT_CREATED));
		}
	}
}
