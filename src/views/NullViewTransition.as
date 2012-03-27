package views
{
	import spark.transitions.ViewTransitionBase;
	
	public class NullViewTransition extends ViewTransitionBase
	{
		override public function play():void {
			transitionComplete();
		}

	}
}