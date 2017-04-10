//
// CCGrid Wrapper.mm
//
// author xiaobo.wang
//
// 2017-04-05 20:55:54
//

#import "CCGrid.h"
#import "2d/CCGrid.h"

#import "ccTypeConvert.h"

#pragma mark -
#pragma mark CCGridBase

@implementation CCGridBase

// @synthesize reuseGrid = _reuseGrid;
-(void)setReuseGrid:(int)reuseGrid
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->setReuseGrid(reuseGrid);
}

-(int)reuseGrid
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    return grid->getReuseGrid();
}

// @synthesize texture = _texture;
-(void)setTexture:(CCTexture2D *)texture
{
    cocos2d::Texture2D* tex = static_cast<cocos2d::Texture2D*>([texture getImpl]);
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    
    // TODO: NO METHOD setTexture now.
    NSAssert(NO, @"NO METHOD setTexture now.");
    (void) tex;
    (void) grid;
    
    // grid->setTexture(tex);
}

// @synthesize grabber = _grabber;
- (void)setGrabber:(CCGrabber *)grabber
{
    NSAssert(NO, @"No Setter.");
}

-(CCGrabber *)grabber
{
    NSAssert(NO, @"No Getter.");
    return nil;
}

// @synthesize gridSize = _gridSize;
-(void)setGridSize:(CGSize)gridSize
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->setGridSize([ccTypeConvert CGSizeToSize:gridSize]);
}

-(CGSize)gridSize
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    return [ccTypeConvert SizeToCGSize:grid->getGridSize()];
}

// @synthesize step = _step;
-(void)setStep:(CGPoint)step
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->setStep([ccTypeConvert CGPointToPoint:step]);
}

-(CGPoint)step
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    return [ccTypeConvert PointToCGPoint:grid->getStep()];
}

// @synthesize shaderProgram = _shaderProgram;
-(void)setShaderProgram:(CCGLProgram *)shaderProgram
{
    NSAssert(NO, @"No Setter.");
}

-(CCGLProgram *)shaderProgram
{
    NSAssert(NO, @"No Getter.");
    return nil;
}

+(id) gridWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped
{
    return [[[self alloc] initWithSize:gridSize texture:texture flippedTexture:flipped] autorelease];
}

+(id) gridWithSize:(CGSize)gridSize
{
    return [[(CCGridBase*)[self alloc] initWithSize:gridSize] autorelease];
}

-(id) initWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped
{
    cocos2d::Size cppGridSize = [ccTypeConvert CGSizeToSize:gridSize];
    cocos2d::Texture2D* cppTexture =static_cast<cocos2d::Texture2D*>([texture getImpl]);
    
    cocos2d::GridBase* grid = cocos2d::GridBase::create(cppGridSize, cppTexture, flipped);
    grid->retain();
    
    isNeedCCGridBaseDealloc_ = YES;
    impl_ = grid;
    
    // no super class
    // self = [super init:impl_];
    return self;
}

-(id)initWithSize:(CGSize)gridSize
{
    cocos2d::Size cppGridSize = [ccTypeConvert CGSizeToSize:gridSize];
    
    cocos2d::GridBase* grid = cocos2d::GridBase::create(cppGridSize);
    grid->retain();
    
    isNeedCCGridBaseDealloc_ = YES;
    impl_ = grid;
    
    // no super class
    // self = [super init:impl_];
    return self;
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                       = pThis;
        isNeedCCGridBaseDealloc_    = NO;
    }
    else
    {
        cocos2d::GridBase* grid = cocos2d::GridBase::create(cocos2d::Size());
        grid->retain();
        
        isNeedCCGridBaseDealloc_ = YES;
        impl_ = grid;
    }
    
    self = [super init:impl_];
    return self;
}

-(id)initWithObject:(void *)object
{
    impl_                    = object;
    isNeedCCGridBaseDealloc_ = NO;
    
    self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCGridBaseDealloc_)
    {
        cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
        grid->release();
    }
    
    [super dealloc];
}


- (NSString*) description
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    (void)grid;
    return [[NSString alloc]init];
    // return [NSString stringWithCString:grid->getDescription().c_str() encoding:NSUTF8StringEncoding];
}

// properties
-(BOOL) active
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    return grid->isActive();
}

-(void) setActive:(BOOL)active
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->setActive(active);
}

-(BOOL) isTextureFlipped
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    return grid->isTextureFlipped();
}

-(void) setIsTextureFlipped:(BOOL)flipped
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->setTextureFlipped(flipped);
}

-(void)set2DProjection
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->set2DProjection();
}

-(void)beforeDraw
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->beforeDraw();
}


-(void)afterDraw:(CCNode *)target
{
    cocos2d::Node* ccTarget = static_cast<cocos2d::Node*>(target);
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->afterDraw(ccTarget);
}


-(void)blit
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->blit();
}

-(void)reuse
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->reuse();
}

-(void)calculateVertexPoints
{
    cocos2d::GridBase* grid = static_cast<cocos2d::GridBase*>(impl_);
    grid->calculateVertexPoints();
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCGrid3D
@implementation CCGrid3D

+(id) gridWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped
{
    return [[[self alloc] initWithSize:gridSize texture:texture flippedTexture:flipped] autorelease];
}

+(id) gridWithSize:(CGSize)gridSize
{
    return [[(CCGridBase*)[self alloc] initWithSize:gridSize] autorelease];
}

-(id) initWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped
{
    cocos2d::Size cppGridSize = [ccTypeConvert CGSizeToSize:gridSize];
    cocos2d::Texture2D* cppTexture =static_cast<cocos2d::Texture2D*>([texture getImpl]);
    
    cocos2d::GridBase* grid = cocos2d::Grid3D::create(cppGridSize, cppTexture, flipped);
    grid->retain();
    
    isNeedCCGridBaseDealloc_ = YES;
    impl_ = grid;
    
    // no super class
    // self = [super init:impl_];
    return self;
}

-(id)initWithSize:(CGSize)gridSize
{
    cocos2d::Size cppGridSize = [ccTypeConvert CGSizeToSize:gridSize];
    
    cocos2d::GridBase* grid = cocos2d::Grid3D::create(cppGridSize);
    grid->retain();
    
    isNeedCCGridBaseDealloc_ = YES;
    impl_ = grid;
    
    // no super class
    // self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCGrid3DDealloc_)
    {
        cocos2d::Grid3D* grid = static_cast<cocos2d::Grid3D*>(impl_);
        grid->release();
    }
    
    [super dealloc];
}

-(void)blit
{
    cocos2d::Grid3D* grid = static_cast<cocos2d::Grid3D*>(impl_);
    grid->blit();
}

-(void)calculateVertexPoints
{
    cocos2d::Grid3D* grid = static_cast<cocos2d::Grid3D*>(impl_);
    grid->calculateVertexPoints();
}

-(ccVertex3F)vertex:(CGPoint)pos
{
    cocos2d::Grid3D* grid = static_cast<cocos2d::Grid3D*>(impl_);
    return [ccTypeConvert Vec3ToccVertex3F: grid->getVertex([ccTypeConvert CGPointToPoint:pos])];
}

-(ccVertex3F)originalVertex:(CGPoint)pos
{
    cocos2d::Grid3D* grid = static_cast<cocos2d::Grid3D*>(impl_);
    return [ccTypeConvert Vec3ToccVertex3F: grid->getOriginalVertex([ccTypeConvert CGPointToPoint:pos])];
}

-(void)setVertex:(CGPoint)pos vertex:(ccVertex3F)vertex
{
    cocos2d::Grid3D* grid = static_cast<cocos2d::Grid3D*>(impl_);
    grid->setVertex([ccTypeConvert CGPointToPoint:pos], [ccTypeConvert ccVertex3FToVec3:vertex]);
}

-(void)reuse
{
    cocos2d::Grid3D* grid = static_cast<cocos2d::Grid3D*>(impl_);
    grid->reuse();
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCTiledGrid3D

@implementation CCTiledGrid3D

+(id) gridWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped
{
    return [[[self alloc] initWithSize:gridSize texture:texture flippedTexture:flipped] autorelease];
}

+(id) gridWithSize:(CGSize)gridSize
{
    return [[(CCGridBase*)[self alloc] initWithSize:gridSize] autorelease];
}

-(id) initWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped
{
    cocos2d::Size cppGridSize = [ccTypeConvert CGSizeToSize:gridSize];
    cocos2d::Texture2D* cppTexture =static_cast<cocos2d::Texture2D*>([texture getImpl]);
    
    cocos2d::GridBase* grid = cocos2d::TiledGrid3D::create(cppGridSize, cppTexture, flipped);
    grid->retain();
    
    isNeedCCGridBaseDealloc_ = YES;
    impl_ = grid;
    
    // no super class
    // self = [super init:impl_];
    return self;
}

-(id)initWithSize:(CGSize)gridSize
{
    cocos2d::Size cppGridSize = [ccTypeConvert CGSizeToSize:gridSize];
    
    cocos2d::GridBase* grid = cocos2d::TiledGrid3D::create(cppGridSize);
    grid->retain();
    
    isNeedCCGridBaseDealloc_ = YES;
    impl_ = grid;
    
    // no super class
    // self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCTiledGrid3DDealloc_)
    {
        cocos2d::TiledGrid3D* grid = static_cast<cocos2d::TiledGrid3D*>(impl_);
        grid->release();
    }
    
    [super dealloc];
}

-(void)blit
{
    cocos2d::TiledGrid3D* grid = static_cast<cocos2d::TiledGrid3D*>(impl_);
    grid->blit();
}

-(void)calculateVertexPoints
{
    cocos2d::TiledGrid3D* grid = static_cast<cocos2d::TiledGrid3D*>(impl_);
    grid->calculateVertexPoints();
}

-(void)setTile:(CGPoint)pos coords:(ccQuad3)coords
{
    cocos2d::TiledGrid3D* grid = static_cast<cocos2d::TiledGrid3D*>(impl_);
    grid->setTile([ccTypeConvert CGPointToPoint:pos], [ccTypeConvert ccQuad3ToQuad3:coords]);
}

-(ccQuad3)originalTile:(CGPoint)pos
{
    cocos2d::TiledGrid3D* grid = static_cast<cocos2d::TiledGrid3D*>(impl_);
    return [ccTypeConvert Quad3ToccQuad3: grid->getOriginalTile([ccTypeConvert CGPointToPoint:pos])];
}

-(ccQuad3)tile:(CGPoint)pos
{
    cocos2d::TiledGrid3D* grid = static_cast<cocos2d::TiledGrid3D*>(impl_);
    return [ccTypeConvert Quad3ToccQuad3: grid->getTile([ccTypeConvert CGPointToPoint:pos])];
}

-(void)reuse
{
    cocos2d::TiledGrid3D* grid = static_cast<cocos2d::TiledGrid3D*>(impl_);
    grid->reuse();
}

@end































