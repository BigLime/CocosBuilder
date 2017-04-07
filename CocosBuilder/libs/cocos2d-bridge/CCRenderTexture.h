//
//  CCRenderTexture.h
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import <Foundation/Foundation.h>

#import "ccMacros.h"
#import "CCNode.h"
#import "CCSprite.h"
#import "Support/OpenGL_Internal.h"
#import "kazmath/mat4.h"

typedef enum
{
    kCCImageFormatJPEG = 0,
    kCCImageFormatPNG = 1,
} tCCImageFormat;


/**
 CCRenderTexture is a generic rendering target. To render things into it,
 simply construct a render target, call begin on it, call visit on any cocos2d
 scenes or objects to render them, and call end. For convenience, render texture
 adds a sprite as its display child with the results, so you can simply add
 the render texture to your scene and treat it like any other CCNode.
 There are also functions for saving the render texture to disk in PNG or JPG format.
 
 @since v0.8.1
 */
@interface CCRenderTexture : CCNode
{
    BOOL isNeedRenderTextureDealloc_;
}

/** The CCSprite being used.
 The sprite, by default, will use the following blending function: GL_ONE, GL_ONE_MINUS_SRC_ALPHA.
 The blending function can be changed in runtime by calling:
	- [[renderTexture sprite] setBlendFunc:(ccBlendFunc){GL_ONE, GL_ONE_MINUS_SRC_ALPHA}];
 */
@property (nonatomic,readwrite, retain) CCSprite* sprite;

/** Valid flags: GL_COLOR_BUFFER_BIT, GL_DEPTH_BUFFER_BIT, GL_STENCIL_BUFFER_BIT. They can be OR'ed. Valid when "autoDraw is YES. */
@property (nonatomic, readwrite) GLbitfield clearFlags;
/** Clear color value. Valid only when "autoDraw" is YES. */
@property (nonatomic, readwrite) ccColor4F clearColor;
/** Value for clearDepth. Valid only when autoDraw is YES. */
@property (nonatomic, readwrite) GLclampf clearDepth;
/** Value for clear Stencil. Valid only when autoDraw is YES */
@property (nonatomic, readwrite) GLint clearStencil;
/** When enabled, it will render its children into the texture automatically. Disabled by default for compatiblity reasons.
 Will be enabled in the future.
 */
@property (nonatomic, readwrite) BOOL autoDraw;


/** initializes a RenderTexture object with width and height in Points and a pixel format( only RGB and RGBA formats are valid ) and depthStencil format*/
+(id)renderTextureWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat) format depthStencilFormat:(GLuint)depthStencilFormat;

/** creates a RenderTexture object with width and height in Points and a pixel format, only RGB and RGBA formats are valid */
+(id)renderTextureWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat) format;

/** creates a RenderTexture object with width and height in Points, pixel format is RGBA8888 */
+(id)renderTextureWithWidth:(int)w height:(int)h;

/** initializes a RenderTexture object with width and height in Points and a pixel format, only RGB and RGBA formats are valid */
-(id)initWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat) format;

/** initializes a RenderTexture object with width and height in Points and a pixel format( only RGB and RGBA formats are valid ) and depthStencil format*/
- (id)initWithWidth:(int)w height:(int)h pixelFormat:(CCTexture2DPixelFormat)format depthStencilFormat:(GLuint)depthStencilFormat;

/** starts grabbing */
-(void)begin;

/** starts rendering to the texture while clearing the texture first.
 This is more efficient then calling -clear first and then -begin */
-(void)beginWithClear:(float)r g:(float)g b:(float)b a:(float)a;

/** starts rendering to the texture while clearing the texture first.
 This is more efficient then calling -clear first and then -begin */
- (void)beginWithClear:(float)r g:(float)g b:(float)b a:(float)a depth:(float)depthValue;

/** starts rendering to the texture while clearing the texture first.
 This is more efficient then calling -clear first and then -begin */
- (void)beginWithClear:(float)r g:(float)g b:(float)b a:(float)a depth:(float)depthValue stencil:(int)stencilValue;


/** ends grabbing */
-(void)end;

/** clears the texture with a color */
-(void)clear:(float)r g:(float)g b:(float)b a:(float)a;

/** clears the texture with a specified depth value */
- (void)clearDepth:(float)depthValue;

/** clears the texture with a specified stencil value */
- (void)clearStencil:(int)stencilValue;

/* creates a new CGImage from with the texture's data.
 Caller is responsible for releasing it by calling CGImageRelease().
 */
-(CGImageRef) newCGImage;

/** saves the texture into a file using JPEG format. The file will be saved in the Documents folder.
 Returns YES if the operation is successful.
 */
-(BOOL)saveToFile:(NSString*)name;

/** saves the texture into a file. The format could be JPG or PNG. The file will be saved in the Documents folder.
 Returns YES if the operation is successful.
 */
-(BOOL)saveToFile:(NSString*)name format:(tCCImageFormat)format;

-(id)initWithObject: (void*)object;
-(void*) getImpl;

@end
