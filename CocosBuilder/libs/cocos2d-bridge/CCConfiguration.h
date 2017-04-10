//
// CCConfiguration
//
// author ke.huang 17/4/10


@interface CCConfiguration : NSObject
{

}


/** OpenGL Max texture size. */
@property (nonatomic, readonly) GLint maxTextureSize;

/** returns the maximum texture units
 @since v2.0.0
 */
@property (nonatomic, readonly) GLint maxTextureUnits;

/** Whether or not the GPU supports NPOT (Non Power Of Two) textures.
 OpenGL ES 2.0 already supports NPOT (iOS).
 
 @since v0.99.2
 */
@property (nonatomic, readonly) BOOL supportsNPOT;

/** Whether or not PVR Texture Compressed is supported */
@property (nonatomic, readonly) BOOL supportsPVRTC;

/** Whether or not BGRA8888 textures are supported.
 
 @since v0.99.2
 */
@property (nonatomic, readonly) BOOL supportsBGRA8888;

/** Whether or not glDiscardFramebufferEXT is supported
 
 @since v0.99.2
 */
@property (nonatomic, readonly) BOOL supportsDiscardFramebuffer;

/** Whether or not shareable VAOs are supported.
 @since v2.0.0
 */
@property (nonatomic, readonly) BOOL supportsShareableVAO;

/** returns the OS version.
	- On iOS devices it returns the firmware version.
	- On Mac returns the OS version
 
 @since v0.99.5
 */
@property (nonatomic, readonly) unsigned int OSVersion;


/** returns a shared instance of the CCConfiguration */
+(CCConfiguration *) sharedConfiguration;

/** returns whether or not an OpenGL is supported */
- (BOOL) checkForGLExtension:(NSString *)searchName;

/** returns the current device */
-(NSInteger) runningDevice;

/** dumps in the console the CCConfiguration information.
 @since v2.1
 */
-(void) dumpInfo;


@end
