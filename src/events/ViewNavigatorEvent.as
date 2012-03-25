package events
{
	import flash.events.Event;
	
	import spark.components.View;
	
	public class ViewNavigatorEvent extends Event
	{
		public static const VIEW_CHANGED:String = "viewChanged";
		
		public var view:View;
		
		public function ViewNavigatorEvent(type:String, view:View)
		{
			super(type, true, cancelable);
			this.view = view;
		}
	}
}