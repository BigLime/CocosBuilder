//
// CCSpriteFrame
//
// author ke.huang

#import "CCSpriteFrame.h"

@implementation CCSpriteFrame

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
        cocos2dx::CCSpriteFrame* spriteFrame = cocos2dx::CCSpriteFrame()::Create();
        impl_ = spriteFrame;
        impl_->retain();
        
        isNeedNodeDealloc_  = YES;
    }
    
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedNodeDealloc_  = NO;
    
    self = [super init];
    return self;
}

-(void) dealloc
{
    if (isNeedNodeDealloc_)
    {
        delete (Node*)impl_;
    }
    [super dealloc];
}

- (CGRect)rect
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getRect();
}

- (void)setRect:_rect
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setRect(_rect);
}
-(CGRect)rectInPixels
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getRectInPixels();
}
-(void)setRectInPixels:_rectInPixels
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setRectInPixels(_rectInPixels);
}
-(BOOL)rotated
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->isRotated();
}
-(void)setRotated:_rotated
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setRotated(_rotated);
}
-(CGPoint)offset
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getOffset();
}
-(void)setOffset:_offset
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setOffset(_offset);
}
-(CGPoint)offsetInPixels
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getOffsetInPixels();
}
-(void)setOffsetInPixels:_offsetInPixels
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setOffsetInPixels(_offsetInPixels);
}
-(CGSize)originalSize
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getOriginalSize();
}
-(void)setOriginalSize:_originalSize
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setOriginalSize(_originalSize);
}
-(CGSize)originalSizeInPixels
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getOriginalSizeInPixels();
}
-(void)setOriginalSizeInPixels:_originalSizeInPixels
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setOriginalSizeInPixels(_originalSizeInPixels);
}
-(CCTexture2D*)texture
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getTexture();
}
-(void)setTexture:_texture
{
    ((cocos2dx::CCSpriteFrame*)impl_)->setTexture(_texture);
}
-(NSString*)textureFilename
{
    return ((cocos2dx::CCSpriteFrame*)impl_)->getTexture();//TODO by hk no this function
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
        cocos2dx::CCSpriteFrame* spriteFrame = cocos2dx::CCSprite():create((CCTexture2D*)[texture getImpl],CCRectMake(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height),rotated,offset,originalSize);
        impl_ = spriteFrame;
        
        impl_->retain();
        isNeedLayerDealloc_ = YES;
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
    return @"CCSpriteFrame";
}
- (void) dealloc
{
    if(isNeedLayerDealloc_)
    {
        impl->release();
    }
    [super dealloc];
}
-(id) copyWithZone: (NSZone*) zone
{
    CCSpriteFrame *copy = [[[self class] allocWithZone: zone]initWithTextureFilename:_textureFilename rectInPixels:_rectInPixels rotated:_rotated offset:_offsetInPixels originalSize:_originalSizeInPixels];
    [copy setTexture:[self getTexture]];
    return copy;
}
@end
