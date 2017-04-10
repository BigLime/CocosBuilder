//
// CCAtlasNode Wrapper
//
// author xiaobo.wang
//
// 2017-04-10 14:38:49
//

#import "CCTextureAtlas.h"
#import "CCNode.h"
#import "CCProtocols.h"

@class CCTexture2D;

/** CCAtlasNode is a subclass of CCNode that implements the CCRGBAProtocol and
 CCTextureProtocol protocol
 
 It knows how to render a TextureAtlas object.
 If you are going to render a TextureAtlas consider sub-classing CCAtlasNode (or a subclass of CCAtlasNode)
 
 All features from CCNode are valid, plus the following features:
 - opacity and RGB colors
 */
@interface CCAtlasNode : CCNodeRGBA <CCTextureProtocol>
{
    BOOL isNeedCCAtlasNodeDealloc_; 
}

/** conforms to CCTextureProtocol protocol */
@property (nonatomic,readwrite,retain) CCTextureAtlas *textureAtlas;

/** conforms to CCTextureProtocol protocol */
@property (nonatomic,readwrite) ccBlendFunc blendFunc;

/** conforms to CCRGBAProtocol protocol */
@property (nonatomic,readwrite) ccColor3B color;

/** how many quads to draw */
@property (nonatomic,readwrite) NSUInteger quadsToDraw;

/** creates a CCAtlasNode  with an Atlas file the width and height of each item measured in points and the quantity of items to render*/
+(id) atlasWithTileFile:(NSString*)tile tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c;

/** initializes an CCAtlasNode  with an Atlas file the width and height of each item measured in points and the quantity of items to render*/
-(id) initWithTileFile:(NSString*)tile tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c;

/** initializes an CCAtlasNode  with a texture the width and height of each item measured in points and the quantity of items to render*/
-(id) initWithTexture:(CCTexture2D*)texture tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c;


/** updates the Atlas (indexed vertex array).
 * Shall be overridden in subclasses
 */
-(void) updateAtlasValues;
@end
