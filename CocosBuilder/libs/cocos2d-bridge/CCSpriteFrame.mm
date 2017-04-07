//
// CCSpriteFrame
//
// author ke.huang

#import "CCSpriteFrame.h"
#import "ccTypeConvert.h"

@implementation CCSpriteFrame

- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedSpriteFrameDealloc_  = NO;
    }
    else
    {
        cocos2dx::SpriteFrame* spriteFrame = cocos2dx::SpriteFrame()::Create();
        impl_ = spriteFrame;
        impl_->retain();
        
        isNeedSpriteFrameDealloc_  = YES;
    }
    
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedSpriteFrameDealloc_  = NO;
    
    self = [super init];
    return self;
}

-(void) dealloc
{
    if (isNeedSpriteFrameDealloc_)
    {
        ((cocos2dx::SpriteFrame*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (CGRect)rect
{
    return [ccTypeConvert RectToCGRect:((cocos2dx::SpriteFrame*)impl_)->getRect()];
}

- (void)setRect:_rect
{
    ((cocos2dx::SpriteFrame*)impl_)->setRect([ccTypeConvert CGRectToRect:_rect]);
}
-(CGRect)rectInPixels
{
    return [ccTypeConvert RectToCGRect:((cocos2dx::SpriteFrame*)impl_)->getRectInPixels()];
}
-(void)setRectInPixels:_rectInPixels
{
    ((cocos2dx::SpriteFrame*)impl_)->setRectInPixels([ccTypeConvert CGRectToRect:_rectInPixels]);
}
-(BOOL)rotated
{
    return ((cocos2dx::SpriteFrame*)impl_)->isRotated();
}
-(void)setRotated:_rotated
{
    ((cocos2dx::SpriteFrame*)impl_)->setRotated(_rotated);
}
-(CGPoint)offset
{
    return [ccTypeConvert PointToCGPoint:((cocos2dx::SpriteFrame*)impl_)->getOffset()];
}
-(void)setOffset:_offset
{
    ((cocos2dx::SpriteFrame*)impl_)->setOffset([ccTypeConvert CGPointToPoint:_offset]);
}
-(CGPoint)offsetInPixels
{
    return [ccTypeConvert PointToCGPoint:((cocos2dx::SpriteFrame*)impl_)->getOffsetInPixels()];
}
-(void)setOffsetInPixels:_offsetInPixels
{
    ((cocos2dx::SpriteFrame*)impl_)->setOffsetInPixels([ccTypeConvert CGPointToPoint:_offsetInPixels]);
}
-(CGSize)originalSize
{
    return [ccTypeConvert SizeToCGSize:((cocos2dx::SpriteFrame*)impl_)->getOriginalSize()];
}
-(void)setOriginalSize:_originalSize
{
    ((cocos2dx::SpriteFrame*)impl_)->setOriginalSize([ccTypeConvert CGSizeToSize:_originalSize]);
}
-(CGSize)originalSizeInPixels
{
    return [ccTypeConvert SizeToCGSize:((cocos2dx::SpriteFrame*)impl_)->getOriginalSizeInPixels()];
}
-(void)setOriginalSizeInPixels:_originalSizeInPixels
{
    ((cocos2dx::SpriteFrame*)impl_)->setOriginalSizeInPixels([ccTypeConvert CGSizeToSize:_originalSizeInPixels]);
}
-(CCTexture2D*)texture
{
    return [[[CCTexture2D alloc ]initWithObject: ((cocos2dx::SpriteFrame*)impl_)->getTexture()] autorelease];
}
-(void)setTexture:_texture
{
    ((cocos2dx::SpriteFrame*)impl_)->setTexture(_texture);
}
-(NSString*)textureFilename
{
    return @"no textureFilename in C++";//TODO by hk no this function
}
+(id) frameWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
    return [[[self alloc] initWithTexture:texture rect:rect] autorelease];
}

+(id) frameWithTextureFilename:(NSString*)filename rect:(CGRect)rect
{
    return [[[self alloc] initWithTextureFilename:filename rect:rect] autorelease];
}

+(id) frameWithTexture:(CCTexture2D*)texture rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize
{
    return [[[self alloc] initWithTexture:texture rectInPixels:rect rotated:rotated offset:offset originalSize:originalSize] autorelease];
}

+(id) frameWithTextureFilename:(NSString*)filename rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize
{
    return [[[self alloc] initWithTextureFilename:filename rectInPixels:rect rotated:rotated offset:offset originalSize:originalSize] autorelease];
}

-(id) initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
    CGRect rectInPixels = CC_RECT_POINTS_TO_PIXELS( rect );
    return [self initWithTexture:texture rectInPixels:rectInPixels rotated:NO offset:CGPointZero originalSize:rectInPixels.size];
}

-(id) initWithTextureFilename:(NSString*)filename rect:(CGRect)rect
{
    CGRect rectInPixels = CC_RECT_POINTS_TO_PIXELS( rect );
    return [self initWithTextureFilename:filename rectInPixels:rectInPixels rotated:NO offset:CGPointZero originalSize:rectInPixels.size];
}
-(id) initWithTexture:(CCTexture2D*)texture rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize
{
    if( (self=[super init]) )
    {
        //TODO CGSize
        cocos2dx::SpriteFrame* spriteFrame = cocos2dx::CCSprite():create((CCTexture2D*)[texture getImpl],CCRectMake(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height),rotated,offset,originalSize);
        impl_ = spriteFrame;
        
        impl_->retain();
        isNeedSpriteFrameDealloc_ = YES;
    }
    return self;
}
-(id) initWithTextureFilename:(NSString *)filename rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize
{
    if( (self=[super init]) )
    {
        //TODO ny hk
        //ocos2dx::CCSpriteFrame* spriteFrame = cocos2dx::CCSprite():create((CCTexture2D*)[texture getImpl],CCRectMake(//rect.origin.x,rect.origin.y,rect.size.width,rect.size.height),rotated,offset,originalSize);
    }
    return self;
}
- (NSString*) description
{
    return @"CCSpriteFrame";//TODO by hk description
}

-(id) copyWithZone: (NSZone*) zone
{
    cocos2d::SpriteFrame* spriteFrame = (cocos2d::SpriteFrame*)impl_;
    return [[[CCSpriteFrame alloc] initWithObject: spriteFrame.clone()] autorelease];
}
@end
