Flixel Power Tools v2.56-01
===========================

[Flixel](http://flixel.org) is a well known open source and free game engine created by [Adam “Atomic” Saltsman](http://twitter.com/AdamAtomic). Flixel has been used in hundreds of games, including IGF nominees, Adult Swim games, and avant-garde experiments. Many Flixel users make their first game ever in Flixel.

The [Flixel Power Tools](http://www.photonstorm.com/flixel-power-tools) are a package
of classes designed to provide extra functionality to your Flixel games. Originally created by Richard Davey ([Photon Storm](http://www.photonstorm.com)), this is the [**Flixel Community**](http://flixelcommunity.org/) fork of the library, striving to keep the library living and up to date with the latest version of Flixel.

The current version of Flixel Power Tools uses the [**Flixel Community** version of Flixel](https://github.com/FlixelCommunity/flixel), now at [**Flixel v2.56**](https://github.com/FlixelCommunity/flixel/releases/tag/v2.56), a version which fixes many of Flixel's older bugs, while staying reverse compatible with projects that already use [Flixel v2.55](https://github.com/FlixelCommunity/flixel/releases/tag/v2.55) (the current version in [AdamAtomic/flixel](https://github.com/AdamAtomic/flixel)).


Quick Install Guide
-------------------

Copy the `src` and `lib` folders into your ActionScript project. All the classes for Flixel Power Tools should be contained in

	src/org/flixel/plugin/photonstorm

Alternatively, you can download the SWC (found either in the `bin` folder if you have one, or in [the "releases" section on GitHub](https://github.com/FlixelCommunity/Flixel-Power-Tools/releases)) into your `lib` folder, and your IDE should help you to properly import it into your project.

Now read the "Getting Started Guide" in the `docs` branch; it contains important information that will 
help you compile!


Getting Started Guide
---------------------

There is a comprehensive Getting Started Guide in both Word and PDF format in the `docs` branch:

 * https://github.com/FlixelCommunity/Flixel-Power-Tools/tree/docs

Documentation is also provided built-in to the classes. AS3 IDEs such as FlashDevelop will
provide context-sensitive help for all classes and functions in the Flixel Power Tools.

Finally check out the home page at http://www.photonstorm.com/flixel-power-tools for more information.


Test Suite
----------

The Flixel Power Tools comes with a comprehensive Test Suite. Use it to visually see the 
tools in action, and then learn from the source code and comments within. Get the full Test Suite 
by checking out the `test-suite` branch, or view the souce online from here:

* [GitHub: FlixelCommunity/Flixel-Power-Tools/test-suite](https://github.com/FlixelCommunity/Flixel-Power-Tools/tree/test-suite)

To run the Test Suite, launch the following SWF:

    bin/FlixelPowerTools.swf

Or you can view the result from the test suite online:

 * http://flixelcommunity.org/Flixel-Power-Tools/


Classes
-------

The following classes are currently in the Flixel Power Tools:

* FlxBar
* FlxBitmapFont
* FlxButtonPlus
* FlxCollision
* FlxColor
* FlxControl (includes FlxControlHandler)
* FlxCoreUtils
* FlxDelay
* FlxDisplay
* FlxExtendedSprite
* FlxFlod (includes FlxFlectrum)
* FlxGradient
* FlxGridOverlay
* FlxLinkedGroup
* FlxMath
* FlxMouseControl
* FlxScreenGrab
* FlxScrollingText
* FlxScrollZone
* FlxSpecialFX
* FlxVelocity
* FlxWeapon

APIs Include

* FlxKongregate

Special FX Includes

* BlurFX
* CenterSlideFX
* FloodFillFX
* GlitchFX
* PlasmaFX
* RainbowLineFX
* RevealFX
* SineWaveFX
* StarfieldFX

Contributing
------------

If you want to contribute with Flixel Community, be welcome! You can help us with code, testing, tutorials and much more. Take a look at the [CONTRIBUTING](https://github.com/FlixelCommunity/flixel/blob/master/CONTRIBUTING.md) file for more.

License
------------

The Flixel Community version (as well as PhotonStorm's version) of Flixel Power Tools is licensed under the [MIT](http://opensource.org/licenses/MIT) license.

[fpt]: https://github.com/photonstorm/Flixel-Power-Tools
[ff]: http://flixel.org/forums/
