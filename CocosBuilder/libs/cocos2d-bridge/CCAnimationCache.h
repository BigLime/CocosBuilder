//
//  CCAnimationCache.h
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import <Foundation/Foundation.h>

@class CCAnimation;

/** Singleton that manages the CCAnimation objects.
 It saves in a cache the animations. You should use this class if you want to save your animations in a cache.
 
 @since v0.99.5
 */
@interface CCAnimationCache : NSObject
{
	
}

/** Returns the shared instance of the Animation cache */
+ (CCAnimationCache *) sharedAnimationCache;

/** Purges the cache. It releases all the CCAnimation objects and the shared instance.
 */
+(void)purgeSharedAnimationCache;

/** Adds a CCAnimation with a name.
 */
-(void) addAnimation:(CCAnimation*)animation name:(NSString*)name;

/** Deletes a CCAnimation from the cache.
 */
-(void) removeAnimationByName:(NSString*)name;

/** Returns a CCAnimation that was previously added.
 If the name is not found it will return nil.
 You should retain the returned copy if you are going to use it.
 */
-(CCAnimation*) animationByName:(NSString*)name;

/** Adds an animation from an NSDictionary
 Make sure that the frames were previously loaded in the CCSpriteFrameCache.
 @since v1.1
 */
-(void)addAnimationsWithDictionary:(NSDictionary *)dictionary;

/** Adds an animation from a plist file.
 Make sure that the frames were previously loaded in the CCSpriteFrameCache.
 @since v1.1
 */
-(void)addAnimationsWithFile:(NSString *)plist;

@end
