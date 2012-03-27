package
{
	import samples.ActionBarVisibility;
	import samples.CensusRemoting;
	import samples.FullScreen;
	import samples.GesturePan;
	import samples.GestureRotate;
	import samples.GestureSwipe;
	import samples.GestureZoom;
	import samples.MobileAppAnatomy;
	import samples.MultipleTouchPoints;
	import samples.NativeAppIntegration;
	import samples.NativeCameraRoll;
	import samples.NativeCameraUI;
	import samples.RawCamera;
	import samples.RotateScreen;
	import samples.ScrollableView;
	import samples.SimpleAccelerometer;
	import samples.SimpleBusyIndicator;
	import samples.SimpleCheckbox;
	import samples.SimpleDB;
	import samples.SimpleGPS;
	import samples.SimpleIconItemRenderer;
	import samples.SimpleLabelItemRenderer;
	import samples.SimpleList;
	import samples.SimpleLongList;
	import samples.SimpleLongListWithIcons;
	import samples.SimpleRadioButton;
	import samples.SimpleSlider;
	import samples.SimpleSpinnerList;
	import samples.SimpleStageWebView;
	import samples.SimpleTextArea;
	import samples.SimpleTextInput;
	import samples.SimpleToggleSwitch;
	
	import views.AboutView;
	
	public class Samples
	{
		
		public static const mobileAppAnatomy:SampleItem = new SampleItem(1000000, "Mobile App Anatomy", MobileAppAnatomy, Icons.codeContext);
		
		public static const scrollableView:SampleItem = new SampleItem(1000002, "Scrollable View", ScrollableView, Icons.codeContext);
		
		public static const busyIndicator:SampleItem = new SampleItem(1000003, "Busy Indicator", SimpleBusyIndicator, Icons.codeContext);
		
		public static const simpleList:SampleItem = new SampleItem(1000100, "Simple List", SimpleList, Icons.viewSortAscending);
		public static const customLabelItemRenderer:SampleItem = new SampleItem(1000101, "Custom Item Renderer", SimpleLabelItemRenderer, Icons.viewSortAscending);
		public static const simpleIconItemRenderer:SampleItem = new SampleItem(1000102, "Icon Item Renderer", SimpleIconItemRenderer, Icons.viewSortAscending);
		public static const simpleLongList:SampleItem = new SampleItem(1000103, "List with 100,000 Text Items", SimpleLongList, Icons.viewSortAscending);
		public static const longListWithIcons:SampleItem = new SampleItem(1000104, "List with 100,000 Complex Items", SimpleLongListWithIcons, Icons.viewSortAscending);
		
		public static const textInput:SampleItem = new SampleItem(1000200, "Text Input", SimpleTextInput, Icons.textInput);
		public static const textArea:SampleItem = new SampleItem(1000201, "Text Area", SimpleTextArea, Icons.insertText);
		public static const radioButtons:SampleItem = new SampleItem(1000202, "Radio Buttons", SimpleRadioButton, Icons.radioButtons);
		public static const checkbox:SampleItem = new SampleItem(1000203, "Checkbox", SimpleCheckbox, Icons.checkBox);
		public static const toggleSwitch:SampleItem = new SampleItem(0, "Toggle Switch", SimpleToggleSwitch, Icons.toggleSwitch);
		public static const slider:SampleItem = new SampleItem(1000204, "Slider", SimpleSlider, Icons.slider);
		public static const spinnerList:SampleItem = new SampleItem(0, "Spinner List", SimpleSpinnerList, Icons.spinnerList);
		
		public static const stageWebView:SampleItem = new SampleItem(1000300, "Stage Web View", SimpleStageWebView, Icons.webBrowser);
		
		public static const multipleTouchPoints:SampleItem = new SampleItem(1000400, "Multiple Touch Points", MultipleTouchPoints, Icons.inputTouchpad);
		public static const gestureZoom:SampleItem = new SampleItem(1000401, "Gesture Zoom", GestureZoom, Icons.inputTouchpad);
		public static const gestureSwipe:SampleItem = new SampleItem(1000402, "Gesture Swipe", GestureSwipe, Icons.inputTouchpad);
		public static const gesturePan:SampleItem = new SampleItem(1000403, "Gesture Pan", GesturePan, Icons.inputTouchpad);
		public static const gestureRotate:SampleItem = new SampleItem(1000404, "Gesture Rotate", GestureRotate, Icons.inputTouchpad);
		
		public static const rawCamera:SampleItem = new SampleItem(1000500, "Direct Camera Access", RawCamera, Icons.camera);
		public static const nativeCameraUI:SampleItem = new SampleItem(1000501, "Native Camera UI", NativeCameraUI, Icons.camera);
		public static const nativeCameraRoll:SampleItem = new SampleItem(1000501, "Native Camera Roll", NativeCameraRoll, Icons.emblemPhotos);
		
		public static const fullScreen:SampleItem = new SampleItem(1000600, "Toggle Fullscreen", FullScreen, Icons.gtkFullscreen);
		public static const actionBarVisibility:SampleItem = new SampleItem(1000601, "Toggle ActionBar Visibility", ActionBarVisibility, Icons.gtkLeaveFullScreen);
		public static const rotateScreen:SampleItem = new SampleItem(1000602, "Rotate Screen", RotateScreen, Icons.transformRotate);
		
		public static const simpleAccelerometer:SampleItem = new SampleItem(1000700, "Accelerometer", SimpleAccelerometer, Icons.ac);
		
		public static const simpleDB:SampleItem = new SampleItem(1000800, "Local SQL Database", SimpleDB, Icons.serverDatabase);
		
		public static const simpleGPS:SampleItem = new SampleItem(1000900, "Geolocation", SimpleGPS, Icons.networkWireless);
		
		
		public static const nativeAppIntegration:SampleItem = new SampleItem(1001000, "Native App Integration", NativeAppIntegration, Icons.runBuild);
		
		public static const censusRemoting:SampleItem = new SampleItem(1001100, "AMF Remoting", CensusRemoting, Icons.binary);
		
		public static const aboutView:SampleItem = new SampleItem(0, "About", AboutView, Icons.about);
		
	}
}