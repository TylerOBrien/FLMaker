FLMaker
---------
General-purpose library for AS3/Flash. Simplifies development of Flash applications without assuming the purpose of the end product. Some inspiration from the Flixel and FlashPunk libraries.

How to Use
----------
_Code does not necessarily reflect actual functionality of the library in its current state (i.e. don't expect it to work because it probably won't right now)._

```as3
package {
	import com.flmaker.FLMaker;
	import com.flmaker.display.Colour;
	import com.flmaker.display.Graphic;
	
	public class Main extends FLMaker {
	  //Anything that is visual in FLMaker is a Graphic.
		public var box:Graphic;
		
		public override function prepare():void {
		  // Create a red box that is 100x100 in size.
			box = Graphic.makeBox(100, 100, Colour.RED);
			// Add it to FLMaker's display list.
			addChild(box);
		}
		
		public override function update():void {
		  // Move the box 1 unit to the right.
			box.translate(1,0);
		}
	}
}
```
