package
{
	import mx.collections.ArrayList;
	
	import views.SampleListView;

	public class Categories
	{
		public static const lists:SampleCategory = new SampleCategory(2000000, "Lists", SampleListView, Icons.viewSortAscending, new ArrayList([Samples.simpleList, Samples.simpleLongList, Samples.customLabelItemRenderer, Samples.simpleIconItemRenderer, Samples.longListWithIcons]));
		
		public static const dataEntry:SampleCategory = new SampleCategory(2000001, "Data Entry Controls", SampleListView, Icons.viewForm, new ArrayList([Samples.textInput, Samples.textArea, Samples.radioButtons, Samples.checkbox, Samples.slider]));
		
		public static const multitouchGestures:SampleCategory = new SampleCategory(2000002, "Multitouch/Gestures", SampleListView, Icons.inputTouchpad, new ArrayList([Samples.multipleTouchPoints, Samples.gesturePan, Samples.gestureRotate, Samples.gestureSwipe, Samples.gestureZoom]));
		
		public static const camera:SampleCategory = new SampleCategory(2000003, "Camera", SampleListView, Icons.camera, new ArrayList([Samples.rawCamera, Samples.nativeCameraUI, Samples.nativeCameraRoll]));

		public static const screenManagement:SampleCategory = new SampleCategory(2000003, "Screen Management", SampleListView, Icons.gtkFullscreen, new ArrayList([Samples.fullScreen, Samples.actionBarVisibility, Samples.rotateScreen]));

		public static const remoteData:SampleCategory = new SampleCategory(2000004, "Remote Data", SampleListView, Icons.networkWireless, new ArrayList([Samples.censusRemoting]));
		
		public static const featured:SampleCategory = new SampleCategory(2100000, "", SampleListView, Icons.headerLogo, new ArrayList([Samples.multipleTouchPoints, Samples.rawCamera]));
		
		public static const topLevel:SampleCategory = new SampleCategory(2200000, "", SampleListView, Icons.headerLogo, new ArrayList([Samples.mobileAppAnatomy, Categories.lists, Categories.dataEntry, Categories.multitouchGestures, Categories.camera, Samples.stageWebView, Categories.screenManagement, Categories.remoteData]));
		
		public static const allSamples:SampleCategory = new SampleCategory(2300000, "All Samples", SampleListView, Icons.headerLogo, 
			new ArrayList([Samples.mobileAppAnatomy, Samples.scrollableView, Samples.busyIndicator,
				Samples.simpleList, Samples.customLabelItemRenderer, Samples.simpleIconItemRenderer, Samples.simpleLongList, Samples.longListWithIcons,
				Samples.textInput, Samples.textArea, Samples.radioButtons, Samples.checkbox, Samples.slider,
				Samples.stageWebView,
				Samples.multipleTouchPoints, Samples.gesturePan, Samples.gestureRotate, Samples.gestureSwipe, Samples.gestureZoom,
				Samples.rawCamera, Samples.nativeCameraUI, Samples.nativeCameraRoll,
				Samples.fullScreen, Samples.actionBarVisibility, Samples.rotateScreen,
				Samples.simpleAccelerometer,
				Samples.simpleDB,
				Samples.simpleGPS,
				Samples.nativeAppIntegration,
				Samples.censusRemoting
			]));
	}
}