package
{
	import mx.collections.ArrayList;

	[Bindable]
	public class SampleCategory extends SampleItem
	{
		public var samples:ArrayList;
		
		public function SampleCategory(uid:uint, name:String, resource:Class, icon:Class, samples:ArrayList)
		{
			super(uid, name, resource, icon);
			this.samples = samples;
		}
	}
}