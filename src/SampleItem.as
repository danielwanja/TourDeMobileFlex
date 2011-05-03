package
{
	
	[Bindable]
	public class SampleItem
	{
		public var uid:uint;
		public var name:String;
		public var resource:Class;
		public var icon:Class;
		
		public function SampleItem(uid:uint, name:String, resource:Class, icon:Class)
		{
			this.uid = uid;
			this.name = name;
			this.resource = resource;
			this.icon = icon;
		}
	}
}