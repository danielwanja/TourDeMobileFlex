package
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sampler.sampleInternalAllocs;
	import flash.system.Capabilities;
	
	import mx.core.mx_internal;
	
	import spark.components.Button;
	import spark.components.View;
	import spark.components.ViewMenuItem;
	import spark.components.ViewNavigator;
	import spark.transitions.SlideViewTransition;
	import spark.transitions.SlideViewTransitionMode;
	import spark.transitions.ViewTransitionBase;
	import spark.transitions.ViewTransitionDirection;
	
	import views.SampleCodeView;
	import events.ViewNavigatorEvent;
	
	use namespace mx_internal;

	[Event(name="viewChanged", type="events.ViewNavigatorEvent")]
	public class SampleViewNavigator extends ViewNavigator
	{
		public function SampleViewNavigator()
		{
			super();
			addEventListener("viewChangeComplete", viewChangeComplete, false, 0, true);
		}
		
		protected function viewChangeComplete(event:Event):void
		{
			var viewActivateEvent:ViewNavigatorEvent = new ViewNavigatorEvent(ViewNavigatorEvent.VIEW_CHANGED, activeView);
			dispatchEvent(viewActivateEvent);
		}

		override public function validateNow():void
		{
			super.validateNow();
			
			updateActionBar();
		}
		
		protected function updateActionBar():void
		{
			// do we need a back button?
			if (navigationStack.length == 2)
			{
				// there are 2 views, so add the back button to the main navigationContent
				
				// this devices doesn't have a back hardware key
				if (Capabilities.version.indexOf("AND") != 0)
				{
					var backButton:Button = new Button();
					backButton.label = "back";
					backButton.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
						if (activeView is SampleCodeView)
						{
							var transition:SlideViewTransition = new SlideViewTransition();
							transition.mode = SlideViewTransitionMode.UNCOVER;
							transition.direction = ViewTransitionDirection.DOWN;
							popView(transition);
						}
						else
						{
							popView();
						}
					}, false, 0, true);
					
					navigationContent = [backButton];
				}
			}
			else if (navigationStack.length == 1)
			{
				// top of the stack so we don't need a back button
				navigationContent = [];
			}
			
			
			// do we need a details button?
			// check the view that is becoming active if it is rendering a SampleItem
			if ((navigationStack.source[navigationStack.length - 1].data is SampleItem) &&
				(!(navigationStack.source[navigationStack.length - 1].data is SampleCategory)) &&
			    (navigationStack.source[navigationStack.length - 1].viewClass != SampleCodeView))
			{
				if (Capabilities.version.indexOf("AND") == 0)
				{
					// assume we have back and menu buttons on the device
					var detailsViewMenuItem:ViewMenuItem = new ViewMenuItem()
					detailsViewMenuItem.label = "View Details";
					detailsViewMenuItem.addEventListener(MouseEvent.CLICK, viewDetails, false, 0, true);
					navigationStack.source[navigationStack.length - 1].instance.viewMenuItems = new Vector.<ViewMenuItem>();
					navigationStack.source[navigationStack.length - 1].instance.viewMenuItems.push(detailsViewMenuItem);
				}
				else
				{
					var detailsButton:Button = new Button();
					detailsButton.label = "details";
					detailsButton.addEventListener(MouseEvent.CLICK, viewDetails, false, 0, true);
					navigationStack.source[navigationStack.length - 1].instance.actionContent = [detailsButton];
				}
			}
			else
			{
				actionContent = [];
			}
		}
		
		protected function viewDetails(event:MouseEvent):void
		{
			var transition:SlideViewTransition = new SlideViewTransition();
			transition.mode = SlideViewTransitionMode.COVER;
			transition.direction = ViewTransitionDirection.UP;
			pushView(views.SampleCodeView, activeView.data, null, transition);
		}
	}
}