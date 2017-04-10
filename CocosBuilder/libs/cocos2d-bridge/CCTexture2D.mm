//
// CCTexture2D
//
// author ke.huang

#import "CCTexture2D.h"
#import "renderer/CCTexture2D.h"
#import "ccTypeConvert.h"
#import "CCGLProgram.h"

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
        cocos2d::Texture2D* texture2D = new cocos2d::Texture2D;
        
        impl_ = texture2D;
        ((cocos2d::Texture2D*)impl_)->autorelease();
        
        isNeedSTextureDealloc_  = YES;
    }
    
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedSTextureDealloc_  = NO;
    
    self = [super init];
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
- (void)setMaxS:(GLfloat)_maxS
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setMaxS(_maxS);
}

- (GLfloat)maxT
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return texture2D->getMaxT();
}
- (void)setMaxT:(GLfloat)_maxT
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
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    return [[[CCGLProgram alloc] initWithObject:texture2D->getGLProgram()] autorelease];
}

-(void) setShaderProgram:(CCGLProgram*)_shaderProgram
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    texture2D->setGLProgram((cocos2d::GLProgram*)[_shaderProgram getImpl]);
}



- (id) initWithData:(const void*)data pixelFormat:(CCTexture2DPixelFormat)pixelFormat pixelsWide:(NSUInteger)width pixelsHigh:(NSUInteger)height contentSize:(CGSize)size
{
    if((self = [super init]))
    {
        cocos2d::Texture2D* texture2D = new cocos2d::Texture2D();
        ssize_t dataLen = width * height * 4;//TODO by hk this dataLen is new param in c++
        NSLog(@" cocos2d::Texture2D initWithData");
        texture2D->initWithData(data,dataLen,cocos2d::Texture2D::PixelFormat(pixelFormat),width,height,[ccTypeConvert CGSizeToSize:size]);
        impl_ = texture2D;
        
        texture2D->autorelease();
        
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
    CCLOG("cocos2d: CCTexture2D. initWithCGImage begin.");
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    CCTexture2DPixelFormat	pixelFormat;
    BOOL					hasAlpha;
    CGImageAlphaInfo		info;
    CGColorSpaceRef			colorSpace;
    
    if(cgImage == NULL) {
        CCLOG("cocos2d: CCTexture2D. Can't create Texture. cgImage is nil");
        [self release];
        return nil;
    }
    //CCConfiguration *conf = [CCConfiguration sharedConfiguration];
    
    info = CGImageGetAlphaInfo(cgImage);
        
    hasAlpha = ((info == kCGImageAlphaPremultipliedLast) || (info == kCGImageAlphaPremultipliedFirst) || (info == kCGImageAlphaLast) || (info == kCGImageAlphaFirst) ? YES : NO);
    
    colorSpace = CGImageGetColorSpace(cgImage);
    
    if(colorSpace) {
        if( hasAlpha ) {
            pixelFormat = [CCTexture2D defaultAlphaPixelFormat];
            info = kCGImageAlphaPremultipliedLast;
        }
        else
        {
            info = kCGImageAlphaNoneSkipLast;
            
            // Use RGBA8888 if default is RGBA8888, otherwise use RGB565.
            // DO NOT USE RGB888 since it is the same as RGBA8888, but it is more expensive to create it
            if( [CCTexture2D defaultAlphaPixelFormat] == kCCTexture2DPixelFormat_RGBA8888 )
                pixelFormat = kCCTexture2DPixelFormat_RGBA8888;
            else
            {
                pixelFormat = kCCTexture2DPixelFormat_RGB565;
                CCLOG("cocos2d: CCTexture2D: Using RGB565 texture since image has no alpha");
            }
        }
    } else {
        // NOTE: No colorspace means a mask image
        CCLOG("cocos2d: CCTexture2D: Using A8 texture since image is a mask");
        pixelFormat = kCCTexture2DPixelFormat_A8;
    }
    
    
    texture2D->initWithImage([ccTypeConvert CGImageToImage:cgImage],cocos2d::Texture2D::PixelFormat(pixelFormat));
}

@end
#pragma mark -
#pragma mark CCTexture2D - Text
@implementation CCTexture2D (Text)
#ifdef __CC_PLATFORM_IOS
- (id) initWithString:(NSString*)string dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)hAlignment vAlignment:(CCVerticalTextAlignment) vAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode font:(UIFont*)uifont
{
    //IOS
}
#elif defined(__CC_PLATFORM_MAC)

- (id) initWithString:(NSString*)string dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)hAlignment vAlignment:(CCVerticalTextAlignment)vAlignment attributedString:(NSAttributedString*)stringWithAttributes
{
    //TODO no initWithString by hk
    NSAssert(stringWithAttributes, @"Invalid stringWithAttributes");
    
    // get nearest power of two
    NSSize POTSize = NSMakeSize(ccNextPOT(dimensions.width), ccNextPOT(dimensions.height));
    
    // Get actual rendered dimensions
    NSRect boundingRect = [stringWithAttributes boundingRectWithSize:NSSizeFromCGSize(dimensions) options:NSStringDrawingUsesLineFragmentOrigin];
    
    // Mac crashes if the width or height is 0
    if( POTSize.width == 0 )
        POTSize.width = 2;
    
    if( POTSize.height == 0)
        POTSize.height = 2;
    
    CGSize offset = CGSizeMake(0, POTSize.height - dimensions.height);
    
    //Alignment
    switch (hAlignment) {
        case kCCTextAlignmentLeft: break;
        case kCCTextAlignmentCenter: offset.width = (dimensions.width-boundingRect.size.width)/2.0f; break;
        case kCCTextAlignmentRight: offset.width = dimensions.width-boundingRect.size.width; break;
        default: break;
    }
    switch (vAlignment) {
        case kCCVerticalTextAlignmentTop: offset.height += dimensions.height - boundingRect.size.height; break;
        case kCCVerticalTextAlignmentCenter: offset.height += (dimensions.height - boundingRect.size.height) / 2; break;
        case kCCVerticalTextAlignmentBottom: break;
        default: break;
    }
    
    CGRect drawArea = CGRectMake(offset.width, offset.height, boundingRect.size.width, boundingRect.size.height);
    
    //Disable antialias
    [[NSGraphicsContext currentContext] setShouldAntialias:NO];
    
    NSImage *image = [[NSImage alloc] initWithSize:POTSize];
    [image lockFocus];
    [[NSAffineTransform transform] set];
    
    [stringWithAttributes drawWithRect:NSRectFromCGRect(drawArea) options:NSStringDrawingUsesLineFragmentOrigin];
    
    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithFocusedViewRect:NSMakeRect (0.0f, 0.0f, POTSize.width, POTSize.height)];
    [image unlockFocus];
    
    unsigned char *data = (unsigned char*) [bitmap bitmapData];  //Use the same buffer to improve the performance.
    
    NSUInteger textureSize = POTSize.width * POTSize.height;
#if CC_USE_LA88_LABELS
    unsigned short *dst = (unsigned short*)data;
    for(int i = 0; i<textureSize; i++)
        dst[i] = (data[i*4+3] << 8) | 0xff;		//Convert RGBA8888 to LA88
#else
    unsigned char *dst = (unsigned char*)data;
    for(int i = 0; i<textureSize; i++)
        dst[i] = data[i*4+3];					//Convert RGBA8888 to A8
#endif // ! CC_USE_LA88_LABELS
    
    data = [self keepData:dst length:textureSize];
    
    self = [self initWithData:data pixelFormat:LABEL_PIXEL_FORMAT pixelsWide:POTSize.width pixelsHigh:POTSize.height contentSize:dimensions];
    [bitmap release];
    [image release];
    
    return self;
    
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
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    bool isLineBreakMode = false;
    switch (lineBreakMode) {
        case kCCLineBreakModeWordWrap:
            isLineBreakMode = true;
            break;
        case kCCLineBreakModeCharacterWrap:
            isLineBreakMode = true;
        default:
            isLineBreakMode = false;
            break;
    }
    texture2D->initWithString(std::string([string UTF8String]),std::string([name UTF8String]),size,[ccTypeConvert CGSizeToSize:dimensions],hAlignment,
                              vAlignment,isLineBreakMode);
}
@end

#pragma mark -
#pragma mark CCTexture2D - PVRSupport

@implementation CCTexture2D (PVRSupport)

-(id) initWithPVRFile: (NSString*) relPath
{
    //TODO no initWithPVRFile by hk
    NSAssert(false, @"no initWithPVRFile");
}
+(void) PVRImagesHavePremultipliedAlpha:(BOOL)haveAlphaPremultiplied
{
    cocos2d::Texture2D::PVRImagesHavePremultipliedAlpha(haveAlphaPremultiplied);
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
-(void) setTexParameters:(ccTexParams*)texParams
{
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)impl_;
    cocos2d::Texture2D::_TexParams* _texParams = new cocos2d::Texture2D::_TexParams;
    _texParams->minFilter = texParams->minFilter;
    _texParams->magFilter = texParams->magFilter;
    _texParams->wrapS = texParams->wrapS;
    _texParams->wrapT = texParams->wrapT;
    texture2D->setTexParameters(_texParams);
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
            CCLOG("bitsPerPixelForFormat: %ld, cannot give useful result", (long)format);
            break;
    }
    return ret;
}
+(CCTexture2DPixelFormat) defaultAlphaPixelFormat
{
    return (CCTexture2DPixelFormat)cocos2d::Texture2D::getDefaultAlphaPixelFormat();
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
