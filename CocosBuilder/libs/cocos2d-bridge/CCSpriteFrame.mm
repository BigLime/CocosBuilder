//
// CCSpriteFrame
//
// author ke.huang

#import "CCSpriteFrame.h"
#import "2d/CCSpriteFrame.h"
#import "ccTypeConvert.h"
#import "CCTexture2D.h"

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
        cocos2d::SpriteFrame* spriteFrame = new cocos2d::SpriteFrame();
        spriteFrame->retain();
        spriteFrame->autorelease();
        impl_ = spriteFrame;
        
        isNeedSpriteFrameDealloc_  = YES;
    }
    return self;
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
        ((cocos2d::SpriteFrame*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (CGRect)rect
{
    return [ccTypeConvert RectToCGRect:((cocos2d::SpriteFrame*)impl_)->getRect()];
}

- (void)setRect:(CGRect)_rect
{
    cocos2d::SpriteFrame* spriteFrame = ((cocos2d::SpriteFrame*)impl_);
    spriteFrame->setRect([ccTypeConvert CGRectToRect:_rect]);
}
-(CGRect)rectInPixels
{
    return [ccTypeConvert RectToCGRect:((cocos2d::SpriteFrame*)impl_)->getRectInPixels()];
}
-(void)setRectInPixels:(CGRect)_rectInPixels
{
    ((cocos2d::SpriteFrame*)impl_)->setRectInPixels([ccTypeConvert CGRectToRect:_rectInPixels]);
}
-(BOOL)rotated
{
    return ((cocos2d::SpriteFrame*)impl_)->isRotated();
}
-(void)setRotated:(BOOL)_rotated
{
    ((cocos2d::SpriteFrame*)impl_)->setRotated(_rotated);
}
-(CGPoint)offset
{
    return [ccTypeConvert PointToCGPoint:((cocos2d::SpriteFrame*)impl_)->getOffset()];
}
-(void)setOffset:(CGPoint)_offset
{
    ((cocos2d::SpriteFrame*)impl_)->setOffset([ccTypeConvert CGPointToPoint:_offset]);
}
-(CGPoint)offsetInPixels
{
    return [ccTypeConvert PointToCGPoint:((cocos2d::SpriteFrame*)impl_)->getOffsetInPixels()];
}
-(void)setOffsetInPixels:(CGPoint)_offsetInPixels
{
    ((cocos2d::SpriteFrame*)impl_)->setOffsetInPixels([ccTypeConvert CGPointToPoint:_offsetInPixels]);
}
-(CGSize)originalSize
{
    return [ccTypeConvert SizeToCGSize:((cocos2d::SpriteFrame*)impl_)->getOriginalSize()];
}
-(void)setOriginalSize:(CGSize)_originalSize
{
    ((cocos2d::SpriteFrame*)impl_)->setOriginalSize([ccTypeConvert CGSizeToSize:_originalSize]);
}
-(CGSize)originalSizeInPixels
{
    return [ccTypeConvert SizeToCGSize:((cocos2d::SpriteFrame*)impl_)->getOriginalSizeInPixels()];
}
-(void)setOriginalSizeInPixels:(CGSize)_originalSizeInPixels
{
    ((cocos2d::SpriteFrame*)impl_)->setOriginalSizeInPixels([ccTypeConvert CGSizeToSize:_originalSizeInPixels]);
}
-(CCTexture2D*)texture
{
    return [[[CCTexture2D alloc ]initWithObject: ((cocos2d::SpriteFrame*)impl_)->getTexture()] autorelease];
}
-(void)setTexture:_texture
{
    ((cocos2d::SpriteFrame*)impl_)->setTexture((cocos2d::Texture2D*)[_texture getImpl]);
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
    //CGRect rectInPixels = CC_RECT_POINTS_TO_PIXELS( rect );
    //return [self initWithTexture:texture rectInPixels:rectInPixels rotated:NO offset:CGPointZero originalSize:rectInPixels.size];
    
    if( (self=[super init]) )
    {
        cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)[texture getImpl];
        cocos2d::SpriteFrame* spriteFrame = cocos2d::SpriteFrame::createWithTexture(texture2D,[ccTypeConvert CGRectToRect:rect]);
        impl_ = spriteFrame;
        
        spriteFrame->retain();
        isNeedSpriteFrameDealloc_ = YES;
    }

    return self;
}

-(id) initWithTextureFilename:(NSString*)filename rect:(CGRect)rect
{
    //CGRect rectInPixels = CC_RECT_POINTS_TO_PIXELS( rect );
    //return [self initWithTextureFilename:filename rectInPixels:rectInPixels rotated:NO offset:CGPointZero originalSize:rectInPixels.size];
    
    if( (self=[super init]) )
    {
        cocos2d::SpriteFrame* spriteFrame = cocos2d::SpriteFrame::create([ccTypeConvert NSStringTostring:filename],[ccTypeConvert CGRectToRect:rect]);
        impl_ = spriteFrame;
        
        spriteFrame->retain();
        isNeedSpriteFrameDealloc_ = YES;
    }
    return self;
}
-(id) initWithTexture:(CCTexture2D*)texture rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize
{
    if( (self=[super init]) )
    {
        cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)[texture getImpl];
        cocos2d::SpriteFrame* spriteFrame = cocos2d::SpriteFrame::createWithTexture(texture2D,[ccTypeConvert CGRectToRect:rect],rotated,[ccTypeConvert CGPointToPoint:offset],[ccTypeConvert CGSizeToSize:originalSize]);
        impl_ = spriteFrame;
        
        spriteFrame->retain();
        isNeedSpriteFrameDealloc_ = YES;
    }
    return self;
}
-(id) initWithTextureFilename:(NSString *)filename rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize
{
    if( (self=[super init]) )
    {
        std::string _name = [ccTypeConvert NSStringTostring:filename];
        cocos2d::Rect _rect = [ccTypeConvert CGRectToRect:rect];
        cocos2d::Point _offset = [ccTypeConvert CGPointToPoint:offset];
        cocos2d::Size _originalSize = [ccTypeConvert CGSizeToSize:originalSize];
        cocos2d::SpriteFrame* spriteFrame = cocos2d::SpriteFrame::create(_name, _rect, rotated, _offset, _originalSize);
        impl_ = spriteFrame;
        
        spriteFrame->retain();
        isNeedSpriteFrameDealloc_ = YES;
    }
    return self;
}
- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | Texture=%@, Rect = (%.2f,%.2f,%.2f,%.2f)> rotated:%d offset=(%.2f,%.2f)", [self class], self,
            [self textureFilename],
            [self rect].origin.x,
            [self rect].origin.y,
            [self rect].size.width,
            [self rect].size.height,
            [self rotated],
            [self offsetInPixels].x,
            [self offsetInPixels].y
            ];
}

-(id) copyWithZone: (NSZone*) zone
{
    cocos2d::SpriteFrame* spriteFrame = (cocos2d::SpriteFrame*)impl_;
    return [[[CCSpriteFrame alloc] initWithObject: spriteFrame->clone()] autorelease];
}
@end
