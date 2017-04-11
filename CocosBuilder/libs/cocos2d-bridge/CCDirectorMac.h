//
// CCDirectorMac
//
// author ke.huang
#import "CCDirector.h"

@interface CCDirectorMac : CCDirector
{
    BOOL isNeedDirectorMacDealloc_;
}

// resize mode: with or without scaling
@property (nonatomic, readwrite) int resizeMode;

/** Converts window size coordinates to logical coordinates.
 Useful only if resizeMode is kCCDirectorResize_Scale.
 If resizeMode is kCCDirectorResize_NoScale, then no conversion will be done.
 */
- (CGPoint) convertToLogicalCoordinates:(CGPoint)coordinates;
@end

/** DisplayLinkDirector is a Director that synchronizes timers with the refresh rate of the display.
 *
 * Features and Limitations:
 * - Only available on 3.1+
 * - Scheduled timers & drawing are synchronizes with the refresh rate of the display
 * - Only supports animation intervals of 1/60 1/30 & 1/15
 *
 * It is the recommended Director if the SDK is 3.1 or newer
 *
 * @since v0.8.2
 */
@interface CCDirectorDisplayLink : CCDirectorMac
{
    
}
@end
