//
// CCGrid wrapper
//
// author xiaobo.wang
//
// 2017-04-10 18:25:37
//

#import "CCNode.h"
#import "ccTypes.h"
#import "CCDirector.h"

@class CCTexture2D;
@class CCGrabber;
@class CCGLProgram;

/** Base class for other
 */
@interface CCGridBase : NSObject
{
    void* impl_;
    BOOL isNeedCCGridBaseDealloc_;
}

/** whether or not the grid is active */
@property (nonatomic,readwrite) BOOL active;

/** number of times that the grid will be reused */
@property (nonatomic,readwrite) int reuseGrid;

/** size of the grid */
@property (nonatomic,readonly) CGSize gridSize;

/** pixels between the grids */
@property (nonatomic,readwrite) CGPoint step;

/** texture used */
@property (nonatomic, retain) CCTexture2D *texture;

/** grabber used */
@property (nonatomic, retain) CCGrabber *grabber;

/** is texture flipped */
@property (nonatomic, readwrite) BOOL isTextureFlipped;

/** shader program */
@property (nonatomic, readwrite, assign) CCGLProgram *shaderProgram;

+(id) gridWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
+(id) gridWithSize:(CGSize)gridSize;

-(id) initWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
-(id)initWithSize:(CGSize)gridSize;
-(id) init: (void*) pThis;
-(id) initWithObject:(void*) object;

-(void)beforeDraw;
-(void)afterDraw:(CCNode*)target;
-(void)blit;
-(void)reuse;

-(void)calculateVertexPoints;

@end

////////////////////////////////////////////////////////////

/**
 CCGrid3D is a 3D grid implementation. Each vertex has 3 dimensions: x,y,z
 */
@interface CCGrid3D : CCGridBase
{
    BOOL isNeedCCGrid3DDealloc_;
}

+(id) gridWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
+(id) gridWithSize:(CGSize)gridSize;

-(id) initWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
-(id)initWithSize:(CGSize)gridSize;

/** returns the vertex at a given position */
-(ccVertex3F)vertex:(CGPoint)pos;

/** returns the original (non-transformed) vertex at a given position */
-(ccVertex3F)originalVertex:(CGPoint)pos;

/** sets a new vertex at a given position */
-(void)setVertex:(CGPoint)pos vertex:(ccVertex3F)vertex;

@end

////////////////////////////////////////////////////////////

/**
 CCTiledGrid3D is a 3D grid implementation. It differs from Grid3D in that
 the tiles can be separated from the grid.
 */
@interface CCTiledGrid3D : CCGridBase
{
    BOOL isNeedCCTiledGrid3DDealloc_;
}

+(id) gridWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
+(id) gridWithSize:(CGSize)gridSize;

-(id) initWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
-(id)initWithSize:(CGSize)gridSize;

/** returns the tile at the given position */
-(ccQuad3)tile:(CGPoint)pos;

/** returns the original tile (untransformed) at the given position */
-(ccQuad3)originalTile:(CGPoint)pos;

/** sets a new tile */
-(void)setTile:(CGPoint)pos coords:(ccQuad3)coords;

@end
