//
// CCTextureAtlas
//
// author ke.huang

#import "CCTexture2D.h"
#import "ccTypes.h"

@interface CCTextureAtlas : NSObject
{
	void* impl_;
	BOOL isNeedTextureAtlasDealloc_;
}

/** quantity of quads that are going to be drawn */
@property (nonatomic,readonly) NSUInteger totalQuads;
/** quantity of quads that can be stored with the current texture atlas size */
@property (nonatomic,readonly) NSUInteger capacity;
/** Texture of the texture atlas */
@property (nonatomic,retain) CCTexture2D *texture;
/** Quads that are going to be rendered */
@property (nonatomic,readwrite) ccV3F_C4B_T2F_Quad *quads;

/** creates a TextureAtlas with an filename and with an initial capacity for Quads.
 * The TextureAtlas capacity can be increased in runtime.
 */
+(id) textureAtlasWithFile:(NSString*)file capacity:(NSUInteger)capacity;

/** initializes a TextureAtlas with a filename and with a certain capacity for Quads.
 * The TextureAtlas capacity can be increased in runtime.
 *
 * WARNING: Do not reinitialize the TextureAtlas because it will leak memory (issue #706)
 */
-(id) initWithFile: (NSString*) file capacity:(NSUInteger)capacity;

/** creates a TextureAtlas with a previously initialized Texture2D object, and
 * with an initial capacity for n Quads.
 * The TextureAtlas capacity can be increased in runtime.
 */
+(id) textureAtlasWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity;

/** initializes a TextureAtlas with a previously initialized Texture2D object, and
 * with an initial capacity for Quads.
 * The TextureAtlas capacity can be increased in runtime.
 *
 * WARNING: Do not reinitialize the TextureAtlas because it will leak memory (issue #706)
 */
-(id) initWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity;

/** updates a Quad (texture, vertex and color) at a certain index
 * index must be between 0 and the atlas capacity - 1
 @since v0.8
 */
-(void) updateQuad:(ccV3F_C4B_T2F_Quad*)quad atIndex:(NSUInteger)index;

/** Inserts a Quad (texture, vertex and color) at a certain index
 index must be between 0 and the atlas capacity - 1
 @since v0.8
 */
-(void) insertQuad:(ccV3F_C4B_T2F_Quad*)quad atIndex:(NSUInteger)index;

/** Inserts a c array of quads at a given index
 index must be between 0 and the atlas capacity - 1
 this method doesn't enlarge the array when amount + index > totalQuads
 @since v1.1
 */
-(void) insertQuads:(ccV3F_C4B_T2F_Quad*)quads atIndex:(NSUInteger)index amount:(NSUInteger)amount;

/** Removes the quad that is located at a certain index and inserts it at a new index
 This operation is faster than removing and inserting in a quad in 2 different steps
 @since v0.7.2
 */
-(void) insertQuadFromIndex:(NSUInteger)fromIndex atIndex:(NSUInteger)newIndex;

/** removes a quad at a given index number.
 The capacity remains the same, but the total number of quads to be drawn is reduced in 1
 @since v0.7.2
 */
-(void) removeQuadAtIndex:(NSUInteger) index;

/** removes a amount of quads starting from index
	@since 1.1
 */
- (void) removeQuadsAtIndex:(NSUInteger) index amount:(NSUInteger) amount;

/** removes all Quads.
 The TextureAtlas capacity remains untouched. No memory is freed.
 The total number of quads to be drawn will be 0
 @since v0.7.2
 */
-(void) removeAllQuads;

/** resize the capacity of the CCTextureAtlas.
 * The new capacity can be lower or higher than the current one
 * It returns YES if the resize was successful.
 * If it fails to resize the capacity it will return NO with a new capacity of 0.
 */
-(BOOL) resizeCapacity: (NSUInteger) n;

/**
 Used internally by CCParticleBatchNode
 don't use this unless you know what you're doing
 @since 1.1
 */
- (void) increaseTotalQuadsWith:(NSUInteger) amount;

/** Moves an amount of quads from oldIndex at newIndex
 @since v1.1
 */
-(void) moveQuadsFromIndex:(NSUInteger)oldIndex amount:(NSUInteger) amount atIndex:(NSUInteger)newIndex;

/**
 Moves quads from index till totalQuads to the newIndex
 Used internally by CCParticleBatchNode
 This method doesn't enlarge the array if newIndex + quads to be moved > capacity
 @since 1.1
 */
- (void) moveQuadsFromIndex:(NSUInteger) index to:(NSUInteger) newIndex;

/**
 Ensures that after a realloc quads are still empty
 Used internally by CCParticleBatchNode
 @since 1.1
 */
- (void) fillWithEmptyQuadsFromIndex:(NSUInteger) index amount:(NSUInteger) amount;

/** draws n quads
 * n can't be greater than the capacity of the Atlas
 */

-(void) drawNumberOfQuads: (NSUInteger) n;

/** draws n quads from an index (offset).
 n + start can't be greater than the capacity of the atlas
 
 @since v1.0
 */
-(void) drawNumberOfQuads: (NSUInteger) n fromIndex: (NSUInteger) start;

/** draws all the Atlas's Quads
 */
-(void) drawQuads;


@end
