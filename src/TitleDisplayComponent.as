/*
Copied from the ActionBarSkin to make it reusable
*/
package
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	
	import spark.components.ActionBar;
	import spark.components.supportClasses.StyleableTextField;
	import spark.core.IDisplayText;
	import spark.skins.mobile.ActionBarSkin;
	
	use namespace mx_internal;
	
	/**
	 *  @private
	 *  Component that holds StyleableTextFields to produce a drop shadow effect.
	 *  Combines label and shadow into a single component to allow transitions to
	 *  target them both.
	 */
	public class TitleDisplayComponent extends UIComponent implements IDisplayText
	{
		private var titleDisplay:StyleableTextField;
		private var titleDisplayShadow:StyleableTextField;
		private var title:String;
		private var titleChanged:Boolean;
		
		public function TitleDisplayComponent()
		{
			super();
			title = "";
		}
		
		override public function get baselinePosition():Number
		{
			return titleDisplay.baselinePosition;
		}
		
		/**
		 *  @private
		 */
		override protected function createChildren():void
		{
			super.createChildren();
			
			titleDisplay = StyleableTextField(createInFontContext(StyleableTextField));
			//titleDisplay.styleName = this;
			//really nasty way to get the default styles to apply to this thing
			titleDisplay.styleName = (parent.parent as ActionBarSkin).titleDisplay;
			titleDisplay.editable = false;
			titleDisplay.selectable = false;
			titleDisplay.multiline = false;
			titleDisplay.wordWrap = false;
			titleDisplay.addEventListener(FlexEvent.VALUE_COMMIT,
				titleDisplay_valueCommitHandler);
			
			titleDisplayShadow =
				StyleableTextField(createInFontContext(StyleableTextField));
			//titleDisplayShadow.styleName = this;
			//really nasty way to get the default styles to apply to this thing
			titleDisplayShadow.styleName = (parent.parent as ActionBarSkin).titleDisplay;
			titleDisplayShadow.colorName = "textShadowColor";
			titleDisplayShadow.editable = false;
			titleDisplayShadow.selectable = false;
			titleDisplayShadow.multiline = false;
			titleDisplayShadow.wordWrap = false;
			
			addChild(titleDisplayShadow);
			addChild(titleDisplay);
		}
		
		/**
		 *  @private
		 */
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (titleChanged)
			{
				titleDisplay.text = title;
				
				invalidateSize();
				invalidateDisplayList();
				
				titleChanged = false;
			}
		}
		
		/**
		 *  @private
		 */
		override protected function measure():void
		{
			// reset text if it was truncated before.
			if (titleDisplay.isTruncated)
				titleDisplay.text = title;
			
			measuredWidth = titleDisplay.getPreferredBoundsWidth();
			
			// tightTextHeight
			measuredHeight = titleDisplay.getPreferredBoundsHeight();
		}
		
		/**
		 *  @private
		 */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			// reset text if it was truncated before.
			if (titleDisplay.isTruncated)
				titleDisplay.text = title;
			titleDisplay.commitStyles();
			
			// use preferred height, setLayoutBoundsSize will accommodate for tight
			// text adjustment
			var tightHeight:Number = titleDisplay.getPreferredBoundsHeight();
			var tightY:Number = (unscaledHeight - tightHeight) / 2;
			
			titleDisplay.setLayoutBoundsSize(unscaledWidth, tightHeight);
			titleDisplay.setLayoutBoundsPosition(0, (unscaledHeight - tightHeight) / 2);
			
			// now truncate the text
			titleDisplay.truncateToFit();
			
			titleDisplayShadow.commitStyles();
			titleDisplayShadow.setLayoutBoundsSize(unscaledWidth, tightHeight);
			titleDisplayShadow.setLayoutBoundsPosition(0, tightY + 1);
			
			titleDisplayShadow.alpha = getStyle("textShadowAlpha");
			
			// if labelDisplay is truncated, then push it down here as well.
			// otherwise, it would have gotten pushed in the labelDisplay_valueCommitHandler()
			if (titleDisplay.isTruncated)
				titleDisplayShadow.text = titleDisplay.text;
		}
		
		/**
		 *  @private 
		 */ 
		private function titleDisplay_valueCommitHandler(event:Event):void 
		{
			titleDisplayShadow.text = titleDisplay.text;
		}
		
		public function get text():String
		{
			return title;
		}
		
		public function set text(value:String):void
		{
			title = value;
			titleChanged = true;
			
			invalidateProperties();
		}
		
		public function get isTruncated():Boolean
		{
			return titleDisplay.isTruncated;
		}
	}
}