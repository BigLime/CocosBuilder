//
// CCSprite
//
// author ke.huang

#import "CCSprite.h"

@implementation CCSprite

- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedNodeDealloc_  = NO;
    }
    else
    {
        cocos2dx::CCSprite* sprite = cocos2dx::CCSprite()::Create();
        impl_ = sprite;
        impl_->retain();
        
        isNeedNodeDealloc_  = YES;
    }
    
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedNodeDealloc_  = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedNodeDealloc_)
    {
        delete (cocos2dx::CCSprite*)impl_;
    }
    [super dealloc];
}

- (BOOL) dirty
{
    return ((cocos2dx::CCSprite*)impl_)_->getDirty();
}

- (void) setDirty:_dirty
{
    ((cocos2dx::CCSprite*)impl_)->setDirty(_dirty);
}

- (ccV3F_C4B_T2F_Quad) quad
{
    return ((cocos2dx::CCSprite*)impl_)->getQuad();
}

- (NSUInteger) atlasIndex
{
    return ((cocos2dx::CCSprite*)impl_)->getAtlasIndex();
}

- (void) setAlasIndex:_atlasIndex
{
    ((cocos2dx::CCSprite*)impl_)->setAtlasIndex(_atlasIndex);
}

- (CGRect) textureRect
{
    cocos2dx::CCRect = ((cocos2dx::CCSprite*)impl_)->getTextureRect();
    //TODO by hk
    return CGRectMake();
}
- (BOOL) textureRectRotated
{
    return ((cocos2dx::CCSprite*)impl_)->isTextureRectRotated;
}
- (BOOL) flipX
{
    return ((cocos2dx::CCSprite*)impl_)->isFlipX();
}

- (void) setFlipX:_flipX
{
    ((cocos2dx::CCSprite*)impl_)->setFlipX(_flipX);
}
- (BOOL) flipY
{
    return ((cocos2dx::CCSprite*)impl_)->isFlipY();
}

- (void) setFlipY:_flipY
{
    ((cocos2dx::CCSprite*)impl_)->setFlipY(_flipY);
}

- (CCTextureAtlas*)textureAtlas
{
    return [[[CCTextureAtlas alloc]initWithObject:((cocos2dx::CCSprite*)impl_)->getTextureAtlas()] autorelease];
}

- (void)setTextureAtlas:_textureAtlas
{
    ((cocos2dx::CCSprite*)impl_)->setTextureAtlas((CCTextureAtlas*)[_textureAtlas getImpl]);
}

- (CCSpriteBatchNode*)batchNode
{
    return [[[CCSpriteBatchNode alloc]initWithObject:((cocos2dx::CCSprite*)impl_)->getBatchNode()] autorelease];
}

- (void)setBatchNode:_batchNode
{
    ((cocos2dx::CCSprite*)impl_)->setTextureAtlas((CCSpriteBatchNode*)[batchNode getImpl]);
}
- (CGPoint)offsetPosition
{
    //TODO by hk
    return [[[CGPoint alloc]initWithObject:((cocos2dx::CGPoint*)impl_)->getOffsetPosition()] autorelease];
}
- (ccBlendFunc)blendFunc
{
    return ((cocos2dx::CCSprite*)impl_)->getBlendFunc();
}
- (void)setBlendFunc:_blendFunc
{
    ((cocos2dx::CCSprite*)impl_)->setBlendFunc(_blendFunc);
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
        cocos2dx::CCSprite* sprite = new class cocos2dx::CCSprite();
        sprite->initWithTexture((CCTexture2D*)[texture getImpl],CCRectMake(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height),rotated);
        impl_ = sprite;
        
        impl_->retain();
        isNeedLayerDealloc_ = YES;
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
    return @"CCSprite";/*[NSString stringWithFormat:@"<%@ = %p | Rect = (%.2f,%.2f,%.2f,%.2f) | tag = %ld | atlasIndex = %ld>", [self class], self,
                        _rect.origin.x, _rect.origin.y, _rect.size.width, _rect.size.height,
                        (long)_tag,
                        (unsigned long)_atlasIndex
                        ];*/
}

- (void) dealloc
{
    if(isNeedLayerDealloc_)
    {
        impl->release();
    }
    [super dealloc];
}

-(void) setTextureRect:(CGRect)rect
{
    [self setTextureRect:rect rotated:NO untrimmedSize:rect.size];
}
-(void) setTextureRect:(CGRect)rect rotated:(BOOL)rotated untrimmedSize:(CGSize)untrimmedSize
{
    ((cocos2dx::CCSprite*)impl_)->setTextureRect();//TODO bu hk
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
    (cocos2dx::CCSprite*)impl_)->updateTransform();
}
-(void) draw
{
    (cocos2dx::CCSprite*)impl_)->draw();
}
-(void) addChild:(CCSprite*)child z:(NSInteger)z tag:(NSInteger) aTag
{
    (cocos2dx::CCSprite*)impl_)->addChild((cocos2dx::CCSprite*)[child getImpl]]),z,aTag);
}
-(void) reorderChild:(CCSprite*)child z:(NSInteger)z
{
    (cocos2dx::CCSprite*)impl_)->reorderChild((cocos2dx::CCSprite*)[child getImpl]]),z);
}
-(void)removeChild: (CCSprite *)sprite cleanup:(BOOL)doCleanup
{
    (cocos2dx::CCSprite*)impl_)->removeChild((cocos2dx::CCSprite*)[child getImpl]]),doCleanup);
}
-(void)removeAllChildrenWithCleanup:(BOOL)doCleanup
{
    (cocos2dx::CCSprite*)impl_)->removeAllChildrenWithCleanup(doCleanup);
}
- (void) sortAllChildren
{
    (cocos2dx::CCSprite*)impl_)->sortAllChildren();
}
-(void) setReorderChildDirtyRecursively
{
    (cocos2dx::CCSprite*)impl_)->setReorderChildDirtyRecursively();
}
-(void) setDirtyRecursively:(BOOL)b
{
    (cocos2dx::CCSprite*)impl_)->setDirtyRecursively(b);
}
-(void)setPosition:(CGPoint)pos
{
    (cocos2dx::CCSprite*)impl_)->setPosition(pos);
}
-(void)setRotation:(float)rot
{
    (cocos2dx::CCSprite*)impl_)->setRotation(rot);
}
-(void)setRotationX:(float)rot
{
    (cocos2dx::CCSprite*)impl_)->setRotationX(rot);
}

-(void)setRotationY:(float)rot
{
    (cocos2dx::CCSprite*)impl_)->setRotationY(rot);
}
-(void)setSkewX:(float)sx
{
    (cocos2dx::CCSprite*)impl_)->setSkewX(sx);
}

-(void)setSkewY:(float)sy
{
    (cocos2dx::CCSprite*)impl_)->setSkewY(sy);
}
-(void)setScaleX:(float) sx
{
    (cocos2dx::CCSprite*)impl_)->setScaleX(sy);
}

-(void)setScaleY:(float) sy
{
    (cocos2dx::CCSprite*)impl_)->setScaleY(sy);
}

-(void)setScale:(float) s
{
    (cocos2dx::CCSprite*)impl_)->setScale(s);
}
-(void) setVertexZ:(float)z
{
    (cocos2dx::CCSprite*)impl_)->setVertexZ(z);
}

-(void)setAnchorPoint:(CGPoint)anchor
{
    (cocos2dx::CCSprite*)impl_)->setVertexZ(anchor);
}
-(void) setIgnoreAnchorPointForPosition:(BOOL)value
{
    (cocos2dx::CCSprite*)impl_)->setIgnoreAnchorPointForPosition(value);
}
-(void)setVisible:(BOOL)v
{
    (cocos2dx::CCSprite*)impl_)->setVisible(v);
}
-(void) updateColor
{
    (cocos2dx::CCSprite*)impl_)->updateColor();
}
-(void) setColor:(ccColor3B)color3
{
    (cocos2dx::CCSprite*)impl_)->setColor(color3);
}

-(void)updateDisplayedColor:(ccColor3B)parentColor
{
    (cocos2dx::CCSprite*)impl_)->updateDisplayedColor(parentColor);
}
-(void) setOpacity:(GLubyte)opacity
{
    (cocos2dx::CCSprite*)impl_)->setOpacity(opacity);
}
-(void) setOpacityModifyRGB:(BOOL)modify
{
    (cocos2dx::CCSprite*)impl_)->setOpacityModifyRGB(modify);
}
-(BOOL) doesOpacityModifyRGB
{
    return (cocos2dx::CCSprite*)impl_)->doesOpacityModifyRGB();
}
-(void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    (cocos2dx::CCSprite*)impl_)->updateDisplayedOpacity(parentOpacity);
}
-(void) setDisplayFrame:(CCSpriteFrame*)frame
{
    (cocos2dx::CCSprite*)impl_)->setDisplayFrame(frame);
}
-(void) setDisplayFrameWithAnimationName: (NSString*) animationName index:(int) frameIndex
{
    (cocos2dx::CCSprite*)impl_)->setDisplayFrameWithAnimationName(animationName,frameIndex);
}
-(BOOL) isFrameDisplayed:(CCSpriteFrame*)frame
{
    return (cocos2dx::CCSprite*)impl_)->isFrameDisplayed(frame);
}
-(CCSpriteFrame*) displayFrame
{
    return (cocos2dx::CCSprite*)impl_)->displayFrame();
}
-(void) updateBlendFunc
{
    (cocos2dx::CCSprite*)impl_)->updateBlendFunc();
}
-(void) setTexture:(CCTexture2D*)texture
{
    (cocos2dx::CCSprite*)impl_)->setTexture(texture);
}
-(CCTexture2D*) texture
{	
    return [[[CCTexture2D alloc ]initWithObject: (cocos2dx::CCSprite*)impl_)->getTexture()] autorelease];
}
@end
