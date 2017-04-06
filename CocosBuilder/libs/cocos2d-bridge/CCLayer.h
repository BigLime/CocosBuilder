//
// CCLayer Wrapper
//
// Author: xiaobo.wang
//
// 2017-04-01 15:43:23
//

#import "CCNode.h"

#pragma mark - CCLayer

typedef enum
{
    kCCTouchAllAtOnce,
    kCCTouchOneByOne,
} ccTouchesMode;

@interface CCLayer : CCNode
{
    BOOL isNeedCCLayerDealloc_;
}

/** whether or not it will receive touche events. */
@property (nonatomic, readwrite, getter=isTouchEnabled) BOOL touchEnabled;

/** priority of the touch events. Default is 0 */
@property(nonatomic, assign) NSInteger touchPriority;

/** whether or not it will receive gesture events. */
@property (nonatomic, readwrite, getter=isGestureEnabled) BOOL gestureEnabled;

/** priority of the gesture events. Default is 0 */
@property(nonatomic, assign) NSInteger gesturePriority;


/** whether or not it will receive mouse events.
 
 Valid only on OS X. Not valid on iOS
 */
@property (nonatomic, readwrite, getter=isMouseEnabled) BOOL mouseEnabled;

/** priority of the mouse events. Default is 0 */
@property (nonatomic, assign) NSInteger mousePriority;

/** whether or not it will receive keyboard events.
 
 Valid only on OS X. Not valid on iOS
 */
@property (nonatomic, readwrite, getter = isKeyboardEnabled) BOOL keyboardEnabled;

/** Priority of keyboard events. Default is 0 */
@property (nonatomic, assign) NSInteger keyboardPriority;

@end

#pragma mark -
#pragma mark CCLayerRGBA

@interface CCLayerRGBA : CCLayer <CCRGBAProtocol>
{
    BOOL isNeedCCLayerRGBADealloc_;
}

// XXX: To make BridgeSupport happy
-(GLubyte) opacity;
@end

#pragma mark -
#pragma mark CCLayerColor

@interface CCLayerColor : CCLayerRGBA <CCBlendProtocol>
{
    BOOL isNeedCCLayerColorDealloc_;
}

/** creates a CCLayer with color, width and height in Points*/
+ (id) layerWithColor: (ccColor4B)color width:(GLfloat)w height:(GLfloat)h;

/** creates a CCLayer with color. Width and height are the window size. */
+ (id) layerWithColor: (ccColor4B)color;

/** initializes a CCLayer with color, width and height in Points.
 This is the designated initializer.
 */
- (id) initWithColor:(ccColor4B)color width:(GLfloat)w height:(GLfloat)h;

/** initializes a CCLayer with color. Width and height are the window size. */
- (id) initWithColor:(ccColor4B)color;

/** change width in Points */
-(void) changeWidth: (GLfloat)w;

/** change height in Points */
-(void) changeHeight: (GLfloat)h;

/** change width and height in Points
 @since v0.8
 */
-(void) changeWidth:(GLfloat)w height:(GLfloat)h;

/** BlendFunction. Conforms to CCBlendProtocol protocol */
@property (nonatomic,readwrite) ccBlendFunc blendFunc;
@end

#pragma mark -
#pragma mark CCLayerGradient

@interface CCLayerGradient : CCLayerColor
{
    BOOL isNeedCCLayerGradientDealloc_;
}

/** Creates a full-screen CCLayer with a gradient between start and end. */
+ (id) layerWithColor: (ccColor4B) start fadingTo: (ccColor4B) end;

/** Creates a full-screen CCLayer with a gradient between start and end in the direction of v. */
+ (id) layerWithColor: (ccColor4B) start fadingTo: (ccColor4B) end alongVector: (CGPoint) v;

/** Initializes the CCLayer with a gradient between start and end. */

- (id) initWithColor: (ccColor4B) start fadingTo: (ccColor4B) end;

/** Initializes the CCLayer with a gradient between start and end in the direction of v. */
- (id) initWithColor: (ccColor4B) start fadingTo: (ccColor4B) end alongVector: (CGPoint) v;

/** The starting color. */
@property (nonatomic, readwrite) ccColor3B startColor;

/** The ending color. */
@property (nonatomic, readwrite) ccColor3B endColor;

/** The starting opacity. */
@property (nonatomic, readwrite) GLubyte startOpacity;

/** The ending color. */
@property (nonatomic, readwrite) GLubyte endOpacity;

/** The vector along which to fade color. */
@property (nonatomic, readwrite) CGPoint vector;

/** Whether or not the interpolation will be compressed in order to display all the colors of the gradient both in canonical and non canonical vectors
 Default: YES
 */
@property (nonatomic, readwrite) BOOL compressedInterpolation;
@end

#pragma mark -
#pragma mark CCLayerMultiplex

@interface CCLayerMultiplex : CCLayer
{
    BOOL isNeedCCLayerMultiplexDealloc_;
}

/** creates a CCMultiplexLayer with an array of layers.
 @since v2.1
 */
+(id) layerWithArray:(NSArray*)arrayOfLayers;

/** creates a CCMultiplexLayer with one or more layers using a variable argument list. */
+(id) layerWithLayers: (CCLayer*) layer, ... NS_REQUIRES_NIL_TERMINATION;

/** initializes a CCMultiplexLayer with an array of layers
 @since v2.1
 */
-(id) initWithArray:(NSArray*)arrayOfLayers;

/** initializes a MultiplexLayer with one or more layers using a variable argument list. */
-(id) initWithLayers: (CCLayer*) layer vaList:(va_list) params;

/** switches to a certain layer indexed by n.
 The current (old) layer will be removed from its parent with 'cleanup:YES'.
 */
-(void) switchTo: (unsigned int) n;

/** release the current layer and switches to another layer indexed by n.
 The current (old) layer will be removed from its parent with 'cleanup:YES'.
 */
-(void) switchToAndReleaseMe: (unsigned int) n;
@end







































