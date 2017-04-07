//
//  CCRenderTexture.m
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import "CCRenderTexture.h"

#include "ccTypeConvert.h"

@implementation CCRenderTexture

// getter setter
-(void)setSprite:(CCSprite *)sprite
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->setSprite((cocos2d::Sprite*)[sprite getImpl]);
}

-(CCSprite*)sprite
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    return [[[CCSprite alloc] initWithObject:rt->getSprite()] autorelease];
}

// getter setter
-(void)setAutoDraw:(BOOL)autoDraw
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->setAutoDraw(autoDraw);
}

-(BOOL)autoDraw
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    return rt->isAutoDraw();
}

// getter setter
-(void)setClearColor:(ccColor4F)clearColor
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->setClearColor(clearColor);
}

-(ccColor4F)clearColor
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    return rt->getClearColor();
}

// getter setter
-(void)setClearDepth:(GLclampf)clearDepth
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->setClearDepth(clearDepth);
}

-(GLclampf)clearDepth
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    return rt->getClearDepth();
}

// getter setter
-(void)setClearStencil:(GLint)clearStencil
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->setCleaarStencil(clearStencil);
}

-(GLint)clearStencil
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    return rt->getClearStencil();
}

// getter setter
-(void)setClearFlags:(GLbitfield)clearFlags
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->setClearFlags(clearFlags);
}

-(GLbitfield)clearFlags
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    return rt->getClearFlags();
}

+(id)renderTextureWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat) format depthStencilFormat:(GLuint)depthStencilFormat
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    
    return [[[self alloc] initWithWidth:w height:h pixelFormat:format depthStencilFormat:depthStencilFormat] autorelease];
}

// issue #994
+(id)renderTextureWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat) format
{
    cocos2d::RenderTexture* rt = cocos2d::RenderTexture::create(w, h, format);
    return [[[CCRenderTexture alloc] initWithObject:rt] autorelease];
}

+(id)renderTextureWithWidth:(int)w height:(int)h
{
    cocos2d::RenderTexture* rt = cocos2d::RenderTexture::create(w, h);
    return [[[CCRenderTexture alloc] initWithObject:rt] autorelease];
}

-(id)initWithWidth:(int)w height:(int)h
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->initWithWidthAndHeight(w, h, cocos2d::Texture2D::PixelFormat::BGRA8888);
}

- (id)initWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat)format
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->initWithWidthAndHeight(w, h, (cocos2d::Texture2D::PixelFormat)format);
}

-(id)initWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat) format depthStencilFormat:(GLuint)depthStencilFormat
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->initWithWidthAndHeight(w, h, (cocos2d::Texture2D::PixelFormat)format, depthStencilFormat);
}

-(id) initWithObject:(void *)object
{
    impl_                 = object;
    ((cocos2d::RenderTexture*)impl_)->retain();
    isNeedRenderTextureDealloc_   = YES;
    
    self = [super init:self];
    return self;
}

-(void)dealloc
{
    if(isNeedRenderTextureDealloc_)
        impl_->release();
    [super dealloc];
}

-(void)begin
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->begin();
}

-(void)beginWithClear:(float)r g:(float)g b:(float)b a:(float)a depth:(float)depthValue stencil:(int)stencilValue flags:(GLbitfield)flags
{
    /*mark todo by lsr*/ // protected
}

-(void)beginWithClear:(float)r g:(float)g b:(float)b a:(float)a
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->beginWithClear(r, g, b, a);
}

-(void)beginWithClear:(float)r g:(float)g b:(float)b a:(float)a depth:(float)depthValue
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->beginWithClear(r, g, b, a, depthValue);
}
-(void)beginWithClear:(float)r g:(float)g b:(float)b a:(float)a depth:(float)depthValue stencil:(int)stencilValue
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->beginWithClear(r, g, b, a, depthValue, stencilValue);
}

-(void)end
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->end();
}

-(void)clear:(float)r g:(float)g b:(float)b a:(float)a
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->clear(r, g, b, a);
}

- (void)clearDepth:(float)depthValue
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->clearDepth(depthValue);
}

- (void)clearStencil:(int)stencilValue
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->clearStencil(stencilValue);
}

#pragma mark RenderTexture - "auto" update

- (void)visit
{
    /*mark todo by lsr*/ // 接口参数不一致
}

- (void)draw
{
    /*mark todo by lsr*/ // 接口参数不一致
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
}

#pragma mark RenderTexture - Save Image

-(CGImageRef) newCGImage
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    cocos2d::Image* img = rt->newImage();
    /*mark todo by lsr*/ // 返回类型不一致
}

-(BOOL) saveToFile:(NSString*)name
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->saveToFile([ccTypeConvert NSStringTostring:name]);
}

-(BOOL)saveToFile:(NSString*)fileName format:(tCCImageFormat)format
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->saveToFile([ccTypeConvert NSStringTostring:fileName], (cocos2d::Image::Format)format);
}


#pragma RenderTexture - Override

-(CGSize) contentSize
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    return [ccTypeConvert SizeToCGSize:rt->getContentSize()];
}

-(void) setContentSize:(CGSize)size
{
    cocos2d::RenderTexture* rt = (cocos2d::RenderTexture*)impl_;
    rt->setContentSize([ccTypeConvert CGSizeToSize:size]);
}

-(void*) getImpl
{
    return impl_;
}

@end
