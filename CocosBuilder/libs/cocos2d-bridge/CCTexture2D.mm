//
// CCTexture2D
//
// author ke.huang

#import "CCTexture2D.h"
#import "ccTypeConvert.h"


@implementation CCTexture2D

//c++ no this resolutionType
@synthesize resolutionType = _resolutionType;

- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedSTextureDealloc_  = NO;
    }
    else
    {
        cocos2d::Sprite* sprite = cocos2d::Sprite()::Create();
        impl_ = sprite;
        impl_->retain();
        
        isNeedSTextureDealloc_  = YES;
    }
    
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedSTextureDealloc_  = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedSTextureDealloc_)
    {
        cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
        texture2D->releaseGLTexture();
        texture2D->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (CCTexture2DPixelFormat)pixelFormat
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    CCTexture2DPixelFormat format = (CCTexture2DPixelFormat)(texture2D->getPixelFormat());
    return format;
}

- (NSUInteger)pixelsWide
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->getPixelsWide();
}

- (NSUInteger)pixelsHigh
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->getPixelsHigh();
}

- (GLuint)name
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->getName();
}

- (CGSize)contentSizeInPixels
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return [ccTypeConvert SizeToCGSize:texture2D->getContentSizeInPixels()];
}

- (GLfloat)maxS
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->getMaxS();
}
- (void)setMaxS:_maxS
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setMaxS(_maxS);
}

- (GLfloat)maxT
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->getMaxT();
}
- (void)setMaxS:_maxT
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setMaxT(_maxT);
}

- (BOOL)hasPremultipliedAlpha
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->hasPremultipliedAlpha();
}

- (CCGLProgram*)shaderProgram
{
    NSAssert(false, "no shaderProgram ");
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->getGLProgram();
}

-(void) setShaderProgram:_shaderProgram
{
    NSAssert(false, "no setShaderProgra ");
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setGLProgram(_shaderProgram);
}



- (id) initWithData:(const void*)data pixelFormat:(CCTexture2DPixelFormat)pixelFormat pixelsWide:(NSUInteger)width pixelsHigh:(NSUInteger)height contentSize:(CGSize)size
{
    if((self = [super init]))
    {
        cocos2d::Texture2D* texture2D = new cocos2d::Texture2D();
        ssize_t dataLen = width * height * 4;//TODO by hk this dataLen is new param in c++
        NSLog(" cocos2d::Texture2D")
        sprite->initWithData(data,dataLen,pixelFormat,width,height,[ccTypeConvert CGSizeToSize:size]);
        impl_ = texture2D;
        
        impl_->autolease();
        isNeedSTextureDealloc_ = YES;
    }
    return self;
}

- (void) releaseData:(void*)data
{
    //Free data
    free(data);
}
- (void*) keepData:(void*)data length:(NSUInteger)length
{
    //The texture data mustn't be saved becuase it isn't a mutable texture.
    return data;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | Name = %i | Dimensions = %lux%lu | Pixel format = %@ | Coordinates = (%.2f, %.2f)>", [self class], self, [self name], (unsigned long)[self pixelsWide], (unsigned long)[self pixelsHigh], [self stringForFormat], [self maxS], [self maxT]];
}
-(CGSize) contentSize
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return [ccTypeConvert SizeToCGSize:texture2D->getContentSize()];
}
@end

@implementation CCTexture2D (Image)

- (id) initWithCGImage:(CGImageRef)cgImage resolutionType:(ccResolutionType)resolution
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    //texture2D->initWithImage();
    //TODO no CGImage* by hk
}

@end
#pragma mark -
#pragma mark CCTexture2D - Text
@implementation CCTexture2D (Text)
#ifdef __CC_PLATFORM_IOS
- (id) initWithString:(NSString*)string dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)hAlignment vAlignment:(CCVerticalTextAlignment) vAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode font:(UIFont*)uifont
{
    //TODO no initWithString by hk
}
#elif defined(__CC_PLATFORM_MAC)

- (id) initWithString:(NSString*)string dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)hAlignment vAlignment:(CCVerticalTextAlignment)vAlignment attributedString:(NSAttributedString*)stringWithAttributes
{
    //TODO no initWithString by hk
    
}
#endif // __CC_PLATFORM_MAC

- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->initWithString(std::string([string UTF8String]), std::string([name UTF8String]),size);
    return self;
}
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vAlignment
{
    return [self initWithString:string fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:vAlignment lineBreakMode:kCCLineBreakModeWordWrap];
}

- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)hAlignment vAlignment:(CCVerticalTextAlignment)vAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode
{
    //TODO no initWithString by hk
}
@end

#pragma mark -
#pragma mark CCTexture2D - PVRSupport

@implementation CCTexture2D (PVRSupport)

-(id) initWithPVRFile: (NSString*) relPath
{
    //TODO no initWithPVRFile by hk
}
+(void) PVRImagesHavePremultipliedAlpha:(BOOL)haveAlphaPremultiplied
{
    //TODO no PVRImagesHavePremultipliedAlpha by hk
}
@end

#pragma mark -
#pragma mark CCTexture2D - Drawing

@implementation CCTexture2D (Drawing)

- (void) drawAtPoint:(CGPoint)point
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->drawAtPoint([ccTypeConvert CGPointToPoint:point]);
}
- (void) drawInRect:(CGRect)rect
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->drawInRect([ccTypeConvert CGRectToRect:rect]);
}
@end
#pragma mark -
#pragma mark CCTexture2D - GLFilter

//
// Use to apply MIN/MAG filter
//
@implementation CCTexture2D (GLFilter)

-(void) generateMipmap
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->generateMipmap();
}
-(void) setTexParameters: (ccTexParams*) texParams
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setTexParameters(texParams);//TODO translate ccTexParams
}

-(void) setAliasTexParameters
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setAliasTexParameters();
}

-(void) setAntiAliasTexParameters
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setAntiAliasTexParameters();
}

@end

#pragma mark -
#pragma mark CCTexture2D - Pixel Format

//
// Texture options for images that contains alpha
//
@implementation CCTexture2D (PixelFormat)
+(void) setDefaultAlphaPixelFormat:(CCTexture2DPixelFormat)format
{
    cocos2d::Texture2D::setDefaultAlphaPixelFormat(format);
}
+(NSUInteger) bitsPerPixelForFormat:(CCTexture2DPixelFormat)format
{
    NSUInteger ret=0;
    
    switch (format) {
        case kCCTexture2DPixelFormat_RGBA8888:
            ret = 32;
            break;
        case kCCTexture2DPixelFormat_RGB888:
            // It is 32 and not 24, since its internal representation uses 32 bits.
            ret = 32;
            break;
        case kCCTexture2DPixelFormat_RGB565:
            ret = 16;
            break;
        case kCCTexture2DPixelFormat_RGBA4444:
            ret = 16;
            break;
        case kCCTexture2DPixelFormat_RGB5A1:
            ret = 16;
            break;
        case kCCTexture2DPixelFormat_AI88:
            ret = 16;
            break;
        case kCCTexture2DPixelFormat_A8:
            ret = 8;
            break;
        case kCCTexture2DPixelFormat_I8:
            ret = 8;
            break;
        case kCCTexture2DPixelFormat_PVRTC4:
            ret = 4;
            break;
        case kCCTexture2DPixelFormat_PVRTC2:
            ret = 2;
            break;
        default:
            ret = -1;
            NSAssert1(NO , @"bitsPerPixelForFormat: %ld, unrecognised pixel format", (long)format);
            CCLOG(@"bitsPerPixelForFormat: %ld, cannot give useful result", (long)format);
            break;
    }
    return ret;
}
+(CCTexture2DPixelFormat) defaultAlphaPixelFormat
{
    return cocos2d::Texture2D::getDefaultAlphaPixelFormat();
}
-(NSUInteger) bitsPerPixelForFormat
{
    return [[self class] bitsPerPixelForFormat:_format];
}
-(NSString*) stringForFormat
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return [ccTypeConvert stringToNSString:texture2D->getStringForFormat()];
}
@end
