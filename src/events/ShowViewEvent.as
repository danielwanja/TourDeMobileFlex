package events
{
	import flash.events.Event;
	
	public class ShowViewEvent extends Event
	{
		public static const SHOW_VIEW:String = "showView";
		
		public var view:Class;
		public var data:Object;		
		public function ShowViewEvent(type:String, view:Class, data:Object)
		{
			super(type, true, cancelable);
			this.view = view;
			this.data = data;			
		}
	}
}
