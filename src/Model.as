package
{
	public class Model
	{
		private static var instance:Model;
		public static function getInstance():Model
		{
			if (instance == null)
			{
				instance = new Model();
			}
			
			return instance;
		}
		
		[Bindable] public var samples:SampleCategory;
		[Bindable] public var currentItem:SampleItem;
		
		public function Model()
		{
			samples = new Samples();
			currentItem = samples;
		}
		
		public function findParent(item:SampleItem):SampleCategory
		{
			return getParentOf(item, samples);
		}
		
		protected function getParentOf(item:SampleItem, searchNode:SampleCategory):SampleCategory
		{
			for each(var si:SampleItem in searchNode.samples)
			{
				if (si == item)
				{
					return searchNode;
				}
				else if (si is SampleCategory)
				{
					var i:SampleCategory = getParentOf(item, si as SampleCategory);
					if (i != null)
					{
						return i;
					}
				}
			}
			
			return null;
		}
	}
}