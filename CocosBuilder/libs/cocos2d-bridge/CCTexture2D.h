//
// CCTexture2D
//
// author ke.huang 17/4/7

#import <Foundation/Foundation.h> //	for NSObject

//CONSTANTS:

/** @typedef CCTexture2DPixelFormat
 Possible texture pixel formats
 */
///this PixelFormat is from c++
typedef enum
{
    //! auto detect the type
    AUTO,
    //! 32-bit texture: BGRA8888
    BGRA8888,
    //! 32-bit texture: RGBA8888
    RGBA8888,
    //! 24-bit texture: RGBA888
    RGB888,
    //! 16-bit texture without Alpha channel
    RGB565,
    //! 8-bit textures used as masks
    A8,
    //! 8-bit intensity texture
    I8,
    //! 16-bit textures used as masks
    AI88,
    //! 16-bit textures: RGBA4444
    RGBA4444,
    //! 16-bit textures: RGB5A1
    RGB5A1,
    //! 4-bit PVRTC-compressed texture: PVRTC4
    PVRTC4,
    //! 4-bit PVRTC-compressed texture: PVRTC4 (has alpha channel)
    PVRTC4A,
    //! 2-bit PVRTC-compressed texture: PVRTC2
    PVRTC2,
    //! 2-bit PVRTC-compressed texture: PVRTC2 (has alpha channel)
    PVRTC2A,
    //! ETC-compressed texture: ETC
    ETC,
    //! S3TC-compressed texture: S3TC_Dxt1
    S3TC_DXT1,
    //! S3TC-compressed texture: S3TC_Dxt3
    S3TC_DXT3,
    //! S3TC-compressed texture: S3TC_Dxt5
    S3TC_DXT5,
    //! ATITC-compressed texture: ATC_RGB
    ATC_RGB,
    //! ATITC-compressed texture: ATC_EXPLICIT_ALPHA
    ATC_EXPLICIT_ALPHA,
    //! ATITC-compressed texture: ATC_INTERPOLATED_ALPHA
    ATC_INTERPOLATED_ALPHA,
    //! Default texture format: AUTO
    DEFAULT = AUTO,
    
    NONE = -1
}PixelFormat;

///redefine CCTexture2DPixelFormat
typedef enum {
    //! 32-bit texture: RGBA8888
    kCCTexture2DPixelFormat_RGBA8888 = RGBA8888,
    //! 32-bit texture without Alpha channel. Don't use it.
    kCCTexture2DPixelFormat_RGB888 = RGB888,
    //! 16-bit texture without Alpha channel
    kCCTexture2DPixelFormat_RGB565 = RGB565,
    //! 8-bit textures used as masks
    kCCTexture2DPixelFormat_A8 = A8,
    //! 8-bit intensity texture
    kCCTexture2DPixelFormat_I8 = I8,
    //! 16-bit textures used as masks
    kCCTexture2DPixelFormat_AI88 = AI88,
    //! 16-bit textures: RGBA4444
    kCCTexture2DPixelFormat_RGBA4444 = RGBA4444,
    //! 16-bit textures: RGB5A1
    kCCTexture2DPixelFormat_RGB5A1 = RGB5A1,
    //! 4-bit PVRTC-compressed texture: PVRTC4
    kCCTexture2DPixelFormat_PVRTC4 = PVRTC4,
    //! 2-bit PVRTC-compressed texture: PVRTC2
    kCCTexture2DPixelFormat_PVRTC2 = PVRTC2,
    
    //! Default texture format: RGBA8888
    kCCTexture2DPixelFormat_Default = kCCTexture2DPixelFormat_RGBA8888,
    
} CCTexture2DPixelFormat;

@class CCGLProgram;

@interface CCTexture2D : NSObject
{
	void* impl_;
	BOOL isNeedSTextureDealloc_;
}

/** Initializes with a texture2d with data */
- (id) initWithData:(const void*)data pixelFormat:(CCTexture2DPixelFormat)pixelFormat pixelsWide:(NSUInteger)width pixelsHigh:(NSUInteger)height contentSize:(CGSize)size;

/** These functions are needed to create mutable textures */
- (void) releaseData:(void*)data;
- (void*) keepData:(void*)data length:(NSUInteger)length;

/** pixel format of the texture */
@property(nonatomic,readonly) CCTexture2DPixelFormat pixelFormat;
/** width in pixels */
@property(nonatomic,readonly) NSUInteger pixelsWide;
/** hight in pixels */
@property(nonatomic,readonly) NSUInteger pixelsHigh;

/** texture name */
@property(nonatomic,readonly) GLuint name;

/** returns content size of the texture in pixels */
@property(nonatomic,readonly, nonatomic) CGSize contentSizeInPixels;

/** texture max S */
@property(nonatomic,readwrite) GLfloat maxS;
/** texture max T */
@property(nonatomic,readwrite) GLfloat maxT;
/** whether or not the texture has their Alpha premultiplied */
@property(nonatomic,readonly) BOOL hasPremultipliedAlpha;

/** shader program used by drawAtPoint and drawInRect */
@property(nonatomic,readwrite,retain) CCGLProgram *shaderProgram;

/** Returns the resolution type of the texture.
 Is it a RetinaDisplay texture, an iPad texture, a Mac, a Mac RetinaDisplay or an standard texture ?
 
 Should be a readonly property. It is readwrite as a hack.
 
 @since v1.1
 */
@property (nonatomic, readwrite) ccResolutionType resolutionType;


/** returns the content size of the texture in points */
-(CGSize) contentSize;


@end

/**
 Drawing extensions to make it easy to draw basic quads using a CCTexture2D object.
 These functions require GL_TEXTURE_2D and both GL_VERTEX_ARRAY and GL_TEXTURE_COORD_ARRAY client states to be enabled.
 */
@interface CCTexture2D (Drawing)
/** draws a texture at a given point */
- (void) drawAtPoint:(CGPoint)point;
/** draws a texture inside a rect */
- (void) drawInRect:(CGRect)rect;
@end

/**
 Extensions to make it easy to create a CCTexture2D object from an image file.
 Note that RGBA type textures will have their alpha premultiplied - use the blending mode (GL_ONE, GL_ONE_MINUS_SRC_ALPHA).
 */
@interface CCTexture2D (Image)
/** Initializes a texture from a CGImage object */
- (id) initWithCGImage:(CGImageRef)cgImage resolutionType:(ccResolutionType)resolution;
@end

/**
 Extensions to make it easy to create a CCTexture2D object from a string of text.
 Note that the generated textures are of type A8 - use the blending mode (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA).
 */
@interface CCTexture2D (Text)
/** Initializes a texture from a string with dimensions, alignment, line break mode, font name and font size
 Supported lineBreakModes:
	- iOS: all UILineBreakMode supported modes
	- Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment) vertAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode ;
/** Initializes a texture from a string with dimensions, alignment, font name and font size */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment) vertAlignment;
/** Initializes a texture from a string with font name and font size */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size;
@end


/**
 Extensions to make it easy to create a CCTexture2D object from a PVRTC file
 Note that the generated textures don't have their alpha premultiplied - use the blending mode (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA).
 */
@interface CCTexture2D (PVRSupport)
/** Initializes a texture from a PVR file.
 
 Supported PVR formats:
 - BGRA 8888
 - RGBA 8888
 - RGBA 4444
 - RGBA 5551
 - RBG 565
 - A 8
 - I 8
 - AI 8
 - PVRTC 2BPP
 - PVRTC 4BPP
 
 By default PVR images are treated as if they alpha channel is NOT premultiplied. You can override this behavior with this class method:
 - PVRImagesHavePremultipliedAlpha:(BOOL)haveAlphaPremultiplied;
 
 IMPORTANT: This method is only defined on iOS. It is not supported on the Mac version.
 
 */
-(id) initWithPVRFile: (NSString*) file;

/** treats (or not) PVR files as if they have alpha premultiplied.
 Since it is impossible to know at runtime if the PVR images have the alpha channel premultiplied, it is
 possible load them as if they have (or not) the alpha channel premultiplied.
 
 By default it is disabled.
 
 @since v0.99.5
 */
+(void) PVRImagesHavePremultipliedAlpha:(BOOL)haveAlphaPremultiplied;
@end

/**
 Extension to set the Min / Mag filter
 */
typedef struct _ccTexParams {
    GLuint	minFilter;
    GLuint	magFilter;
    GLuint	wrapS;
    GLuint	wrapT;
} ccTexParams;

@interface CCTexture2D (GLFilter)
/** sets the min filter, mag filter, wrap s and wrap t texture parameters.
 If the texture size is NPOT (non power of 2), then in can only use GL_CLAMP_TO_EDGE in GL_TEXTURE_WRAP_{S,T}.
 
 @warning Calling this method could allocate additional texture memory.
 
 @since v0.8
 */
-(void) setTexParameters: (ccTexParams*) texParams;

/** sets antialias texture parameters:
 - GL_TEXTURE_MIN_FILTER = GL_LINEAR
 - GL_TEXTURE_MAG_FILTER = GL_LINEAR
 
 @warning Calling this method could allocate additional texture memory.
 
 @since v0.8
 */
- (void) setAntiAliasTexParameters;

/** sets alias texture parameters:
 - GL_TEXTURE_MIN_FILTER = GL_NEAREST
 - GL_TEXTURE_MAG_FILTER = GL_NEAREST
 
 @warning Calling this method could allocate additional texture memory.
 
 @since v0.8
 */
- (void) setAliasTexParameters;


/** Generates mipmap images for the texture.
 It only works if the texture size is POT (power of 2).
 @since v0.99.0
 */
-(void) generateMipmap;


@end

@interface CCTexture2D (PixelFormat)
/** sets the default pixel format for CGImages that contains alpha channel.
 If the CGImage contains alpha channel, then the options are:
	- generate 32-bit textures: kCCTexture2DPixelFormat_RGBA8888 (default one)
	- generate 16-bit textures: kCCTexture2DPixelFormat_RGBA4444
	- generate 16-bit textures: kCCTexture2DPixelFormat_RGB5A1
	- generate 24-bit textures: kCCTexture2DPixelFormat_RGB888 (no alpha)
	- generate 16-bit textures: kCCTexture2DPixelFormat_RGB565 (no alpha)
	- generate 8-bit textures: kCCTexture2DPixelFormat_A8 (only use it if you use just 1 color)
 
 How does it work ?
 - If the image is an RGBA (with Alpha) then the default pixel format will be used (it can be a 8-bit, 16-bit or 32-bit texture)
 - If the image is an RGB (without Alpha) then: If the default pixel format is RGBA8888 then a RGBA8888 (32-bit) will be used. Otherwise a RGB565 (16-bit texture) will be used.
 
 This parameter is not valid for PVR / PVR.CCZ images.
 
 @since v0.8
 */
+(void) setDefaultAlphaPixelFormat:(CCTexture2DPixelFormat)format;

/** returns the alpha pixel format
 @since v0.8
 */
+(CCTexture2DPixelFormat) defaultAlphaPixelFormat;

/** returns the bits-per-pixel of the in-memory OpenGL texture
 @since v1.0
 */
-(NSUInteger) bitsPerPixelForFormat;

/** returns the pixel format in a NSString.
 @since v2.0
 */
-(NSString*) stringForFormat;


/** Helper functions that returns bits per pixels for a given format.
 @since v2.0
 */
+(NSUInteger) bitsPerPixelForFormat:(CCTexture2DPixelFormat)format;
@end
