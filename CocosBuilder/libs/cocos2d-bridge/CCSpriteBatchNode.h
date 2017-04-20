//
// CCSpriteBatchNode
//
// author ke.huang 17/4/7


#import "CCNode.h"
#import "CCProtocols.h"
#import "CCTextureAtlas.h"
@class CCSprite;
@interface CCSpriteBatchNode : CCNode
{
	BOOL isNeedBatchNodeDealloc_;
}

/** returns the TextureAtlas that is used */
@property (nonatomic,readwrite,retain) CCTextureAtlas * textureAtlas;

/** conforms to CCTextureProtocol protocol */
@property (nonatomic,readwrite) ccBlendFunc blendFunc;

/** descendants (children, grandchildren, etc) */
@property (nonatomic,readonly) CCArray *descendants;

/** creates a CCSpriteBatchNode with a texture2d and a default capacity of 29 children.
 The capacity will be increased in 33% in runtime if it run out of space.
 */
+(id)batchNodeWithTexture:(CCTexture2D *)tex;

/** creates a CCSpriteBatchNode with a texture2d and capacity of children.
 The capacity will be increased in 33% in runtime if it run out of space.
 */
+(id)batchNodeWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity;

/** creates a CCSpriteBatchNode with a file image (.png, .jpeg, .pvr, etc) with a default capacity of 29 children.
 The capacity will be increased in 33% in runtime if it run out of space.
 The file will be loaded using the TextureMgr.
 */
+(id)batchNodeWithFile:(NSString*) fileImage;

/** creates a CCSpriteBatchNode with a file image (.png, .jpeg, .pvr, etc) and capacity of children.
 The capacity will be increased in 33% in runtime if it run out of space.
 The file will be loaded using the TextureMgr.
 */
+(id)batchNodeWithFile:(NSString*)fileImage capacity:(NSUInteger)capacity;

/** initializes a CCSpriteBatchNode with a texture2d and capacity of children.
 The capacity will be increased in 33% in runtime if it run out of space.
 */
-(id)initWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity;
/** initializes a CCSpriteBatchNode with a file image (.png, .jpeg, .pvr, etc) and a capacity of children.
 The capacity will be increased in 33% in runtime if it run out of space.
 The file will be loaded using the TextureMgr.
 */
-(id)initWithFile:(NSString*)fileImage capacity:(NSUInteger)capacity;

-(void) increaseAtlasCapacity;

/** removes a child given a certain index. It will also cleanup the running actions depending on the cleanup parameter.
 @warning Removing a child from a CCSpriteBatchNode is very slow
 */
-(void)removeChildAtIndex:(NSUInteger)index cleanup:(BOOL)doCleanup;

/** removes a child given a reference. It will also cleanup the running actions depending on the cleanup parameter.
 @warning Removing a child from a CCSpriteBatchNode is very slow
 */
-(void) removeChild: (CCNode *)sprite cleanup:(BOOL)doCleanup;
-(void) addChild: (CCNode*) child z:(NSInteger)z tag:(NSInteger)aTag;

-(void) insertChild:(CCSprite*)child inAtlasAtIndex:(NSUInteger)index;
-(void) appendChild:(CCSprite*)sprite;
-(void) removeSpriteFromAtlas:(CCSprite*)sprite;

-(NSUInteger) rebuildIndexInOrder:(CCSprite*)parent atlasIndex:(NSUInteger)index;
-(NSUInteger) atlasIndexForChild:(CCSprite*)sprite atZ:(NSInteger)z;
/* Sprites use this to start sortChildren, don't call this manually */
- (void) reorderBatch:(BOOL) reorder;

@end

@interface CCSpriteBatchNode (QuadExtensions)
/** Inserts a quad at a certain index into the texture atlas. The CCSprite won't be added into the children array.
 This method should be called only when you are dealing with very big AtlasSrite and when most of the CCSprite won't be updated.
 For example: a tile map (CCTMXMap) or a label with lots of characters (CCLabelBMFont)
 */
-(void) insertQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index;

/** Updates a quad at a certain index into the texture atlas. The CCSprite won't be added into the children array.
 This method should be called only when you are dealing with very big AtlasSrite and when most of the CCSprite won't be updated.
 For example: a tile map (CCTMXMap) or a label with lots of characters (CCLabelBMFont)
 */
-(void) updateQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index;

/* This is the opposite of "addQuadFromSprite".
 It adds the sprite to the children and descendants array, but it doesn't add it to the texture atlas.
 */
-(id) addSpriteWithoutQuad:(CCSprite*)child z:(NSUInteger)z tag:(NSInteger)aTag;

@end
