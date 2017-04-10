//
//  CCAnimation.h
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import <Foundation/Foundation.h>

@class CCSpriteFrame;
@class CCTexture2D;

@interface CCAnimationFrame : NSObject <NSCopying>
{
    void* impl_;
    BOOL isNeedAnimationFrameDealloc_;
}

/** CCSpriteFrameName to be used */
@property (nonatomic, readwrite, retain) CCSpriteFrame* spriteFrame;

/**  how many units of time the frame takes */
@property (nonatomic, readwrite) float delayUnits;

/**  A CCAnimationFrameDisplayedNotification notification will be broadcasted when the frame is displayed with this dictionary as UserInfo. If UserInfo is nil, then no notification will be broadcasted. */
@property (nonatomic, readwrite, retain) NSDictionary *userInfo;

-(id)initWithObject: (void*)object;

-(void*) getImpl;

@end

@interface CCAnimation : NSObject <NSCopying>
{
    void* impl_;
    BOOL isNeedAnimationDealloc_;
}

/** total Delay units of the CCAnimation. */
@property (nonatomic, readonly) float totalDelayUnits;
/** Delay in seconds of the "delay unit" */
@property (nonatomic, readwrite) float delayPerUnit;
/** duration in seconds of the whole animation. It is the result of totalDelayUnits * delayPerUnit */
@property (nonatomic,readonly) float duration;
/** array of CCAnimationFrames */
@property (nonatomic,readwrite,retain) NSMutableArray *frames;
/** whether or not it shall restore the original frame when the animation finishes */
@property (nonatomic,readwrite) BOOL restoreOriginalFrame;
/** how many times the animation is going to loop. 0 means animation is not animated. 1, animation is executed one time, ... */
@property (nonatomic, readwrite) NSUInteger loops;

/** Creates an animation
 @since v0.99.5
 */
+(id) animation;

/** Creates an animation with an array of CCSpriteFrame.
 The frames will be created with one "delay unit".
 @since v0.99.5
 */
+(id) animationWithSpriteFrames:(NSArray*)arrayOfSpriteFrameNames;

/* Creates an animation with an array of CCSpriteFrame and a delay between frames in seconds.
 The frames will be added with one "delay unit".
 @since v0.99.5
 */
+(id) animationWithSpriteFrames:(NSArray*)arrayOfSpriteFrameNames delay:(float)delay;

/* Creates an animation with an array of CCAnimationFrame, the delay per units in seconds and and how many times it should be executed.
 @since v2.0
 */
+(id) animationWithAnimationFrames:(NSArray*)arrayOfAnimationFrames delayPerUnit:(float)delayPerUnit loops:(NSUInteger)loops;

/** Adds a CCSpriteFrame to a CCAnimation.
 The frame will be added with one "delay unit".
 */
-(void) addSpriteFrame:(CCSpriteFrame*)frame;

/** Adds a frame with an image filename. Internally it will create a CCSpriteFrame and it will add it.
 The frame will be added with one "delay unit".
 Added to facilitate the migration from v0.8 to v0.9.
 */
-(void) addSpriteFrameWithFilename:(NSString*)filename;

/** Adds a frame with a texture and a rect. Internally it will create a CCSpriteFrame and it will add it.
 The frame will be added with one "delay unit".
 Added to facilitate the migration from v0.8 to v0.9.
 */
-(void) addSpriteFrameWithTexture:(CCTexture2D*)texture rect:(CGRect)rect;

-(id)initWithObject: (void*)object;

-(void*) getImpl;

@end
