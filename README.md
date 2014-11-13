FLMaker
---------
General-purpose library for AS3/Flash. Simplifies development of Flash applications without assuming the purpose of the end product. Some inspiration from the Flixel and FlashPunk libraries.

How to Use
----------
...

Example
----------
```as3
package {
    import com.flmaker.FLMaker;
    import com.flmaker.display.Colour;
    import com.flmaker.display.Graphic;

    public class Main extends FLMaker {
        public var box:Graphic;

        public override function prepare():void {
            box = Graphic.makeBox(100, 100, Colour.RED);
            addChild(box);
        }

        public override function update():void {
            box.translate(1,0);
        }
    }
}
```

Documentation
----------
...
