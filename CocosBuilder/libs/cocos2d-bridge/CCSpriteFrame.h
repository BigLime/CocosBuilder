//
// CCSpriteFrame
//
// author ke.huang

#import "CCNode.h"
#import "CCProtocols.h"


@interface CCSpriteFrame : NSObject
{
    void* impl_;
    BOOL isNeedSpriteFrameDealloc_;
}

/** rect of the frame in points. If it is updated, then rectInPixels will be updated too. */
@property (nonatomic,readwrite) CGRect rect;

/** rect of the frame in pixels. If it is updated, then rect (points) will be updated too. */
@property (nonatomic,readwrite) CGRect rectInPixels;

/** whether or not the rect of the frame is rotated ( x = x+width, y = y+height, width = height, height = width ) */
@property (nonatomic,readwrite) BOOL rotated;

/** offset of the frame in points */
@property (nonatomic,readwrite) CGPoint offset;

/** offset of the frame in pixels */
@property (nonatomic,readwrite) CGPoint offsetInPixels;

/** original size of the trimmed image in points */
@property (nonatomic,readwrite) CGSize originalSize;

/** original size of the trimmed image in pixels */
@property (nonatomic,readwrite) CGSize originalSizeInPixels;

/** texture of the frame */
@property (nonatomic, retain, readwrite) CCTexture2D *texture;

/** texture file name of the frame */
@property (nonatomic, retain, readonly) NSString *textureFilename;

/** Create a CCSpriteFrame with a texture, rect in points.
 It is assumed that the frame was not trimmed.
 */
+(id) frameWithTexture:(CCTexture2D*)texture rect:(CGRect)rect;

/** Create a CCSpriteFrame with a texture filename, rect in points.
 It is assumed that the frame was not trimmed.
 */
+(id) frameWithTextureFilename:(NSString*)filename rect:(CGRect)rect;

/** Create a CCSpriteFrame with a texture, rect, rotated, offset and originalSize in pixels.
 The originalSize is the size in pixels of the frame before being trimmed.
 */
+(id) frameWithTexture:(CCTexture2D*)texture rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize;


/** Create a CCSpriteFrame with a texture filename, rect, rotated, offset and originalSize in pixels.
 The originalSize is the size in pixels of the frame before being trimmed.
 */
+(id) frameWithTextureFilename:(NSString*)filename rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize;


/** Initializes a CCSpriteFrame with a texture, rect in points;
 It is assumed that the frame was not trimmed.
 */
-(id) initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect;

/** Initializes a CCSpriteFrame with a texture filename, rect in points;
 It is assumed that the frame was not trimmed.
 */
-(id) initWithTextureFilename:(NSString*)filename rect:(CGRect)rect;


/** Initializes a CCSpriteFrame with a texture, rect, rotated, offset and originalSize in pixels.
 The originalSize is the size in pixels of the frame before being trimmed.
 */
-(id) initWithTexture:(CCTexture2D*)texture rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize;

/** Initializes a CCSpriteFrame with a texture, rect, rotated, offset and originalSize in pixels.
 The originalSize is the size in pixels of the frame before being trimmed.
 
 @since v1.1
 */
-(id) initWithTextureFilename:(NSString*)filename rectInPixels:(CGRect)rect rotated:(BOOL)rotated offset:(CGPoint)offset originalSize:(CGSize)originalSize;


@end
