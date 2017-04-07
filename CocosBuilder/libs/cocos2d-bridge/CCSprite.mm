//
// CCSprite
//
// author ke.huang

#import "CCSprite.h"
#import "2d/CCSprite.h"
#import "ccTypeConvert.h"

@implementation CCSprite

- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedSpriteDealloc_  = NO;
    }
    else
    {
        cocos2d::Sprite* sprite = cocos2d::Sprite()::Create();
        impl_ = sprite;
        impl_->retain();
        
        isNeedSpriteDealloc_  = YES;
    }
    
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedSpriteDealloc_  = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedSpriteDealloc_)
    {
        ((cocos2d::Sprite*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (BOOL) dirty
{
    return ((cocos2d::Sprite*)impl_)_->getDirty();
}

- (void) setDirty:_dirty
{
    ((cocos2d::Sprite*)impl_)->setDirty(_dirty);
}

- (ccV3F_C4B_T2F_Quad) quad
{
    //TODO ccV3F_C4B_T2F_Quad
    return ((cocos2d::Sprite*)impl_)->getQuad();
}

- (NSUInteger) atlasIndex
{
    return ((cocos2d::Sprite*)impl_)->getAtlasIndex();
}

- (void) setAlasIndex:_atlasIndex
{
    ((cocos2d::Sprite*)impl_)->setAtlasIndex(_atlasIndex);
}

- (CGRect) textureRect
{
    cocos2d::CCRect rect = ((cocos2d::Sprite*)impl_)->getTextureRect();
    return [ccTypeConvert RectToCGRect:rect];
}
- (BOOL) textureRectRotated
{
    return ((cocos2d::Sprite*)impl_)->isTextureRectRotated;
}
- (BOOL) flipX
{
    return ((cocos2d::Sprite*)impl_)->isFlipX();
}

- (void) setFlipX:_flipX
{
    ((cocos2d::Sprite*)impl_)->setFlipX(_flipX);
}
- (BOOL) flipY
{
    return ((cocos2d::Sprite*)impl_)->isFlipY();
}

- (void) setFlipY:_flipY
{
    ((cocos2d::Sprite*)impl_)->setFlipY(_flipY);
}

- (CCTextureAtlas*)textureAtlas
{
    return [[[CCTextureAtlas alloc]initWithObject:((cocos2d::Sprite*)impl_)->getTextureAtlas()] autorelease];
}

- (void)setTextureAtlas:_textureAtlas
{
    ((cocos2d::Sprite*)impl_)->setTextureAtlas(((CCTextureAtlas*)[_textureAtlas getImpl]));
}

- (CCSpriteBatchNode*)batchNode
{
    return [[[CCSpriteBatchNode alloc]initWithObject:((cocos2d::Sprite*)impl_)->getBatchNode()] autorelease];
}

- (void)setBatchNode:_batchNode
{
    ((cocos2d::Sprite*)impl_)->setTextureAtlas(((CCSpriteBatchNode*)[batchNode getImpl]));
}
- (CGPoint)offsetPosition
{
    cocos2d::Vec2 point = ((cocos2d::CGPoint*)impl_)->getOffsetPosition();
    return [ccTypeConvert PointToCGPoint:point];
}
- (ccBlendFunc)blendFunc
{
    return ((cocos2d::Sprite*)impl_)->getBlendFunc();
}
- (void)setBlendFunc:_blendFunc
{
    ((cocos2d::Sprite*)impl_)->setBlendFunc(_blendFunc);
}

+(id) spriteWithTexture:(CCTexture2D*)texture
{
    return [[[self alloc] initWithTexture:texture] autorelease];
}

+(id) spriteWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
    return [[[self alloc] initWithTexture:texture rect:rect] autorelease];
}

+(id)spriteWithFile:(NSString*)filename
{
    return [[[self alloc] initWithFile:filename] autorelease];
}

+(id)spriteWithFile:(NSString*)filename rect:(CGRect)rect
{
    return [[[self alloc] initWithFile:filename rect:rect] autorelease];
}

+(id)spriteWithSpriteFrame:(CCSpriteFrame*)spriteFrame
{
    return [[[self alloc] initWithSpriteFrame:spriteFrame] autorelease];
}

+(id)spriteWithSpriteFrameName:(NSString*)spriteFrameName
{
    CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:spriteFrameName];
    
    NSAssert1(frame!=nil, @"Invalid spriteFrameName: %@", spriteFrameName);
    return [self spriteWithSpriteFrame:frame];
}

+(id)spriteWithCGImage:(CGImageRef)image key:(NSString*)key
{
    return [[[self alloc] initWithCGImage:image key:key] autorelease];
}

-(id) init
{
    return [self initWithTexture:nil rect:CGRectZero];
}

-(id) initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect rotated:(BOOL)rotated
{
    if( (self = [super init]) )
    {
        cocos2d::Sprite* sprite = new class cocos2d::Sprite();
        sprite->initWithTexture((CCTexture2D*)[texture getImpl],CCRectMake(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height),rotated);
        impl_ = sprite;
        
        impl_->retain();
        isNeedSpriteDealloc_ = YES;
    }
    return self;
}

-(id) initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
    return [self initWithTexture:texture rect:rect rotated:NO];
}

-(id) initWithTexture:(CCTexture2D*)texture
{
    NSAssert(texture!=nil, @"Invalid texture for sprite");
    
    CGRect rect = CGRectZero;
    rect.size = texture.contentSize;
    return [self initWithTexture:texture rect:rect];
}

-(id) initWithFile:(NSString*)filename
{
    NSAssert(filename != nil, @"Invalid filename for sprite");
    
    CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage: filename];
    if( texture ) {
        CGRect rect = CGRectZero;
        rect.size = texture.contentSize;
        return [self initWithTexture:texture rect:rect];
    }
    
    [self release];
    return nil;
}

-(id) initWithFile:(NSString*)filename rect:(CGRect)rect
{
    NSAssert(filename!=nil, @"Invalid filename for sprite");
    
    CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage: filename];
    if( texture )
        return [self initWithTexture:texture rect:rect];
    
    [self release];
    return nil;
}

- (id) initWithSpriteFrame:(CCSpriteFrame*)spriteFrame
{
    NSAssert(spriteFrame!=nil, @"Invalid spriteFrame for sprite");
    
    id ret = [self initWithTexture:spriteFrame.texture rect:spriteFrame.rect];
    [self setDisplayFrame:spriteFrame];
    return ret;
}

-(id)initWithSpriteFrameName:(NSString*)spriteFrameName
{
    NSAssert(spriteFrameName!=nil, @"Invalid spriteFrameName for sprite");
    
    CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:spriteFrameName];
    return [self initWithSpriteFrame:frame];
}

- (id) initWithCGImage:(CGImageRef)image key:(NSString*)key
{
    NSAssert(image!=nil, @"Invalid CGImageRef for sprite");
    
    // XXX: possible bug. See issue #349. New API should be added
    CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addCGImage:image forKey:key];
    
    CGRect rect = CGRectZero;
    rect.size = texture.contentSize;
    
    return [self initWithTexture:texture rect:rect];
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | Rect = (%.2f,%.2f,%.2f,%.2f) | tag = %ld | atlasIndex = %ld>", [self class], self,
            [self rect].origin.x,
            [self rect].origin.y,
            [self rect].size.width,
            [self rect].size.height,
            (long)[self tag],
            (unsigned long)[self atlasIndex]
            ];
}

-(void) setTextureRect:(CGRect)rect
{
    [self setTextureRect:rect rotated:NO untrimmedSize:rect.size];
}
-(void) setTextureRect:(CGRect)rect rotated:(BOOL)rotated untrimmedSize:(CGSize)untrimmedSize
{
    ((cocos2d::Sprite*)impl_)->setTextureRect([ccTypeConvert CGRectToRect:rect],rotated,untrimmedSize);
}
/*-(void) setVertexRect:(CGRect)rect
 {
	_rect = rect;
 }
 -(void) setTextureCoords:(CGRect)rect
 {
	
 }*/
-(void)updateTransform
{
    (cocos2d::Sprite*)impl_)->updateTransform();
}
-(void) draw
{
    NSAssert( false, @"Invalid function draw()");
    (cocos2d::Sprite*)impl_)->draw();
}
-(void) addChild:(CCSprite*)child z:(NSInteger)z tag:(NSInteger) aTag
{
    cocos2d::Node* node = (cocos2d::Node*)[child getImpl];
    (cocos2d::Sprite*)impl_)->addChild(node,z,aTag);
}
-(void) reorderChild:(CCSprite*)child z:(NSInteger)z
{
    cocos2d::Node* node = (cocos2d::Node*)[child getImpl];
    (cocos2d::Sprite*)impl_)->reorderChild(node,z);
}
-(void)removeChild: (CCSprite *)sprite cleanup:(BOOL)doCleanup
{
    cocos2d::Node* node = (cocos2d::Node*)[sprite getImpl];
    (cocos2d::Sprite*)impl_)->removeChild(node,doCleanup);
}
-(void)removeAllChildrenWithCleanup:(BOOL)doCleanup
{
    (cocos2d::Sprite*)impl_)->removeAllChildrenWithCleanup(doCleanup);
}
- (void) sortAllChildren
{
    (cocos2d::Sprite*)impl_)->sortAllChildren();
}
-(void) setReorderChildDirtyRecursively
{
    (cocos2d::Sprite*)impl_)->setReorderChildDirtyRecursively();
}
-(void) setDirtyRecursively:(BOOL)b
{
    (cocos2d::Sprite*)impl_)->setDirtyRecursively(b);
}
-(void)setPosition:(CGPoint)pos
{
    (cocos2d::Sprite*)impl_)->setPosition([ccTypeConvert CGPointToPoint:pos]);
}
-(void)setRotation:(float)rot
{
    (cocos2d::Sprite*)impl_)->setRotation(rot);
}
-(void)setRotationX:(float)rot
{
    (cocos2d::Sprite*)impl_)->setRotationX(rot);
}

-(void)setRotationY:(float)rot
{
    (cocos2d::Sprite*)impl_)->setRotationY(rot);
}
-(void)setSkewX:(float)sx
{
    (cocos2d::Sprite*)impl_)->setSkewX(sx);
}

-(void)setSkewY:(float)sy
{
    (cocos2d::Sprite*)impl_)->setSkewY(sy);
}
-(void)setScaleX:(float) sx
{
    (cocos2d::Sprite*)impl_)->setScaleX(sy);
}

-(void)setScaleY:(float) sy
{
    (cocos2d::Sprite*)impl_)->setScaleY(sy);
}

-(void)setScale:(float) s
{
    (cocos2d::Sprite*)impl_)->setScale(s);
}
-(void) setVertexZ:(float)z
{
    (cocos2d::Sprite*)impl_)->setVertexZ(z);
}

-(void)setAnchorPoint:(CGPoint)anchor
{
    (cocos2d::Sprite*)impl_)->setAnchorPoint([ccTypeConvert CGPointToPoint:anchor]);
}
-(void) setIgnoreAnchorPointForPosition:(BOOL)value
{
    (cocos2d::Sprite*)impl_)->setIgnoreAnchorPointForPosition(value);
}
-(void)setVisible:(BOOL)v
{
    (cocos2d::Sprite*)impl_)->setVisible(v);
}
-(void) updateColor
{
    (cocos2d::Sprite*)impl_)->updateColor();
}
-(void) setColor:(ccColor3B)color3
{
    //TODO ccColor3B
    (cocos2d::Sprite*)impl_)->setColor(color3);
}

-(void)updateDisplayedColor:(ccColor3B)parentColor
{
    //TODO ccColor3B
    (cocos2d::Sprite*)impl_)->updateDisplayedColor(parentColor);
}
-(void) setOpacity:(GLubyte)opacity
{
    (cocos2d::Sprite*)impl_)->setOpacity(opacity);
}
-(void) setOpacityModifyRGB:(BOOL)modify
{
    (cocos2d::Sprite*)impl_)->setOpacityModifyRGB(modify);
}
-(BOOL) doesOpacityModifyRGB
{
    return (cocos2d::Sprite*)impl_)->doesOpacityModifyRGB();
}
-(void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    (cocos2d::Sprite*)impl_)->updateDisplayedOpacity(parentOpacity);
}
-(void) setDisplayFrame:(CCSpriteFrame*)frame
{
    (cocos2d::Sprite*)impl_)->setDisplayFrame(frame);
}
-(void) setDisplayFrameWithAnimationName: (NSString*) animationName index:(int) frameIndex
{
    (cocos2d::Sprite*)impl_)->setDisplayFrameWithAnimationName([ccTypeConvert NSStringTostring:animationName],frameIndex);
}
-(BOOL) isFrameDisplayed:(CCSpriteFrame*)frame
{
    return (cocos2d::Sprite*)impl_)->isFrameDisplayed(frame);
}
-(CCSpriteFrame*) displayFrame
{
    return (cocos2d::Sprite*)impl_)->displayFrame();
}
-(void) updateBlendFunc
{
    (cocos2d::Sprite*)impl_)->updateBlendFunc();
}
-(void) setTexture:(CCTexture2D*)texture
{
    (cocos2d::Sprite*)impl_)->setTexture(((cocos2d::Texture2D*)[texture getImpl]));
}
-(CCTexture2D*) texture
{	
    return [[[CCTexture2D alloc ]initWithObject: ((cocos2d::Sprite*)impl_)->getTexture()] autorelease];
}
@end
