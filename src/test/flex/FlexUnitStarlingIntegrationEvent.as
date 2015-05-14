package
{
	import flash.events.Event;

	public class FlexUnitStarlingIntegrationEvent extends Event
	{
		public static const CONTEXT_CREATED:String = "flexUnitStarlingIntegrationContextCreated";

		public function FlexUnitStarlingIntegrationEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
