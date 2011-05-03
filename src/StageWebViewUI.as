package
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import mx.core.UIComponent;
	
	public class StageWebViewUI extends UIComponent
	{
		protected var stageWebView:StageWebView;
		
		private var _url:String;
		
		public function StageWebViewUI()
		{
			super();
			
			stageWebView = new StageWebView();
			
			addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);
			addEventListener(Event.REMOVED_FROM_STAGE, removed, false, 0, true);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			updateStageWebView();
		}
		
		public function set url(url:String):void
		{
			_url = url;
			
			if (stageWebView != null)
			{
				stageWebView.loadURL(url);
			}
		}
		
		public function get url():String
		{
			return _url;
		}
		
		protected function updateStageWebView():void
		{
			if (stageWebView != null)
			{
				var topLeft:Point = localToGlobal(new Point(0, 0));
				stageWebView.viewPort = new Rectangle(topLeft.x, topLeft.y, width, height);
			}
		}
		
		protected function added(event:Event):void
		{
			stageWebView.stage = stage;
		}
		
		protected function removed(event:Event):void
		{
			stageWebView.dispose();
		}
		
	}
}