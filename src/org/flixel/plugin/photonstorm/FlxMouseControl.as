/**
 * FlxMouseControl
 * -- Part of the Flixel Power Tools set
 * 
 * v1.2 Added Mouse Zone, Mouse Speed and refactored addToStack process
 * v1.1 Moved to a native plugin
 * v1.0 First release
 * 
 * @version 1.2 - July 28th 2011
 * @link http://www.photonstorm.com
 * @author Richard Davey / Photon Storm
*/

package org.flixel.plugin.photonstorm 
{
	import org.flixel.*;
	
	public class FlxMouseControl extends FlxBasic
	{
		/**
		 * Use with <code>sort()</code> to sort in ascending order.
		 */
		public static const ASCENDING:int = -1;
		
		/**
		 * Use with <code>sort()</code> to sort in descending order.
		 */
		public static const DESCENDING:int = 1;
		
		/**
		 * The value that the FlxExtendedSprites are sorted by before deciding which is "on-top" for click select
		 */
		public static var sortIndex:String = "y";
		
		/**
		 * The sorting order. If the sortIndex is "y" and the order is ASCENDING then a sprite with a Y value of 200 would be "on-top" of one with a Y value of 100.
		 */
		public static var sortOrder:int = ASCENDING;
		
		/**
		 * Is the mouse currently dragging a sprite? If you have just clicked but NOT yet moved the mouse then this might return false.
		 */
		public static var isDragging:Boolean = false;
		
		/**
		 * The FlxExtendedSprite that is currently being dragged, if any.
		 */
		public static var dragTarget:FlxExtendedSprite;
		
		/**
		 * The FlxExtendedSprite that currently has the mouse button pressed on it
		 */
		public static var clickTarget:FlxExtendedSprite;
		private static var clickStack:Array;
		private static var clickCoords:FlxPoint;
		private static var hasClickTarget:Boolean = false;
		
		private static var oldX:int;
		private static var oldY:int;
		
		/**
		 * The speed the mouse is moving on the X axis in pixels per frame
		 */
		public static var speedX:int;
		
		/**
		 * The speed the mouse is moving on the Y axis in pixels per frame
		 */
		public static var speedY:int;
		
		/**
		 * The mouse can be set to only be active within a specific FlxRect region of the game world.
		 * If outside this FlxRect no clicks, drags or throws will be processed.
		 * If the mouse leaves this region while still dragging then the sprite is automatically dropped and its release handler is called.
		 * Set the FlxRect to null to disable the zone.
		 */
		public static var mouseZone:FlxRect;
		
		public function FlxMouseControl() 
		{
		}
		
		/**
		 * Adds the given FlxExtendedSprite to the stack of potential sprites that were clicked, the stack is then sorted and the final sprite is selected from that
		 * 
		 * @param	item	The FlxExtendedSprite that was clicked by the mouse
		 */
		public static function addToStack(item:FlxExtendedSprite):void
		{
			if (mouseZone is FlxRect)
			{
				if (FlxMath.pointInFlxRect(FlxG.mouse.x, FlxG.mouse.y, mouseZone) == true)
				{
					clickStack.push(item);
				}
			}
			else
			{
				clickStack.push(item);
			}
		}
		
		/**
		 * Main Update Loop - checks mouse status and updates FlxExtendedSprites accordingly
		 */
		override public function update():void
		{
			//	Update mouse speed
			speedX = FlxG.mouse.x - oldX;
			speedY = FlxG.mouse.y - oldY;
			
			oldX = FlxG.mouse.x;
			oldY = FlxG.mouse.y;
			
			//	Is the mouse currently pressed down on a target?
			if (hasClickTarget)
			{
				if (FlxG.mouse.pressed())
				{
					//	Has the mouse moved? If so then we're candidate for a drag
					if (isDragging == false && clickTarget.draggable && (clickCoords.x != FlxG.mouse.x || clickCoords.y != FlxG.mouse.y))
					{
						//	Drag on
						isDragging = true;
						
						dragTarget = clickTarget;
						
						dragTarget.startDrag();
					}
				}
				else
				{
					releaseMouse();
				}
				
				//	Is a mouse zone enabled? In which case check if we're still in it
				if (mouseZone is FlxRect && FlxMath.pointInFlxRect(FlxG.mouse.x, FlxG.mouse.y, mouseZone) == false)
				{
					releaseMouse();
				}
			}
			else
			{
				//	No target, but is the mouse down?
				
				if (FlxG.mouse.justPressed())
				{
					clickStack = new Array;
				}
				
				//	If you are wondering how the brand new array can have anything in it by now, it's because FlxExtendedSprite
				//	adds itself to the clickStack
				
				if (FlxG.mouse.pressed() && clickStack.length > 0)
				{
					assignClickedSprite();
				}
			}
		}
		
		/**
		 * Internal function used to release the click / drag targets and reset the mouse state
		 */
		private function releaseMouse():void
		{
			//	Mouse is no longer down, so tell the click target it's free - this will also stop dragging if happening
			clickTarget.mouseReleasedHandler();
			
			hasClickTarget = false;
			clickTarget = null;
			
			isDragging = false;
			dragTarget = null;
		}
		
		/**
		 * Once the clickStack is created this sorts it and then picks the sprite with the highest priority (based on sortIndex and sortOrder)
		 */
		private function assignClickedSprite():void
		{
			//	If there is more than one potential target then sort them
			if (clickStack.length > 1)
			{
				clickStack.sort(sortHandler);
			}
			
			clickTarget = clickStack.pop();
			
			clickCoords = clickTarget.point;
			
			hasClickTarget = true;
			
			clickTarget.mousePressedHandler();
			
			clickStack = [];
		}
		
		/**
		 * Helper function for the sort process.
		 * 
		 * @param 	item1	The first object being sorted.
		 * @param	item2	The second object being sorted.
		 * 
		 * @return	An integer value: -1 (item1 before item2), 0 (same), or 1 (item1 after item2)
		 */
		private function sortHandler(item1:FlxExtendedSprite, item2:FlxExtendedSprite):int
		{
			if (item1[sortIndex] < item2[sortIndex])
			{
				return sortOrder;
			}
			else if (item1[sortIndex] > item2[sortIndex])
			{
				return -sortOrder;
			}
			
			return 0;
		}
		
		/**
		 * Removes all references to any click / drag targets and resets this class
		 */
		public static function clear():void
		{
			hasClickTarget = false;
			
			if (clickTarget)
			{
				clickTarget.mouseReleasedHandler();
			}
			
			clickTarget = null;
			
			isDragging = false;
			
			if (dragTarget)
			{
				dragTarget.stopDrag();
			}
			
			dragTarget = null;
		}
		
		/**
		 * Runs when this plugin is destroyed
		 */
		override public function destroy():void
		{
			clear();
		}
		
	}

}