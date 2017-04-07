//
// CCSpriteFrameCache
//
// author ke.huang 17/4/7


#import "CCSpriteFrame.h"

@class CCSpriteFrame

@interface CCSpriteFrameCache : NSObject
{
    
}

/** Retruns ths shared instance of the Sprite Frame cache */
+ (CCSpriteFrameCache *) sharedSpriteFrameCache;

/** Purges the cache. It releases all the Sprite Frames and the retained instance.
 */
+(void)purgeSharedSpriteFrameCache;


/** Adds multiple Sprite Frames from a plist file.
 * A texture will be loaded automatically. The texture name will composed by replacing the .plist suffix with .png .
 * If you want to use another texture, you should use the addSpriteFramesWithFile:texture method.
 */
-(void) addSpriteFramesWithFile:(NSString*)plist;

/** Adds multiple Sprite Frames from a plist file. The texture filename will be associated with the created sprite frames.
 */
-(void) addSpriteFramesWithFile:(NSString*)plist textureFilename:(NSString*)filename;

/** Adds multiple Sprite Frames from a plist file. The texture will be associated with the created sprite frames.
 */
-(void) addSpriteFramesWithFile:(NSString*)plist texture:(CCTexture2D*)texture;

/** Adds an sprite frame with a given name.
 If the name already exists, then the contents of the old name will be replaced with the new one.
 */
-(void) addSpriteFrame:(CCSpriteFrame*)frame name:(NSString*)frameName;


/** Purges the dictionary of loaded sprite frames.
 * Call this method if you receive the "Memory Warning".
 * In the short term: it will free some resources preventing your app from being killed.
 * In the medium term: it will allocate more resources.
 * In the long term: it will be the same.
 */
-(void) removeSpriteFrames;

/** Removes unused sprite frames.
 * Sprite Frames that have a retain count of 1 will be deleted.
 * It is convenient to call this method after when starting a new Scene.
 */
-(void) removeUnusedSpriteFrames;

/** Deletes an sprite frame from the sprite frame cache.
 */
-(void) removeSpriteFrameByName:(NSString*)name;

/** Removes multiple Sprite Frames from a plist file.
 * Sprite Frames stored in this file will be removed.
 * It is convenient to call this method when a specific texture needs to be removed.
 * @since v0.99.5
 */
- (void) removeSpriteFramesFromFile:(NSString*) plist;

/** Removes all Sprite Frames associated with the specified textures.
 * It is convenient to call this method when a specific texture needs to be removed.
 * @since v0.995.
 */
- (void) removeSpriteFramesFromTexture:(CCTexture2D*) texture;

/** Returns an Sprite Frame that was previously added.
 If the name is not found it will return nil.
 You should retain the returned copy if you are going to use it.
 */
-(CCSpriteFrame*) spriteFrameByName:(NSString*)name;
@end
