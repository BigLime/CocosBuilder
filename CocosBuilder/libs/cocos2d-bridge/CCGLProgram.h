//
//  CCGLProgram.h
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import <Foundation/Foundation.h>
#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

enum {
    kCCVertexAttrib_Position,
    kCCVertexAttrib_Color,
    kCCVertexAttrib_TexCoords,
    
    kCCVertexAttrib_MAX,
};

enum {
    kCCUniformPMatrix,
    kCCUniformMVMatrix,
    kCCUniformMVPMatrix,
    kCCUniformTime,
    kCCUniformSinTime,
    kCCUniformCosTime,
    kCCUniformRandom01,
    kCCUniformSampler,
    
    kCCUniform_MAX,
};

#define kCCShader_PositionTextureColor			@"ShaderPositionTextureColor"
#define kCCShader_PositionTextureColorAlphaTest	@"ShaderPositionTextureColorAlphaTest"
#define kCCShader_PositionColor					@"ShaderPositionColor"
#define kCCShader_PositionTexture				@"ShaderPositionTexture"
#define kCCShader_PositionTexture_uColor		@"ShaderPositionTexture_uColor"
#define kCCShader_PositionTextureA8Color		@"ShaderPositionTextureA8Color"
#define kCCShader_Position_uColor				@"ShaderPosition_uColor"
#define kCCShader_PositionLengthTexureColor		@"ShaderPositionLengthTextureColor"

// uniform names
#define kCCUniformPMatrix_s				"CC_PMatrix"
#define kCCUniformMVMatrix_s			"CC_MVMatrix"
#define kCCUniformMVPMatrix_s			"CC_MVPMatrix"
#define kCCUniformTime_s				"CC_Time"
#define kCCUniformSinTime_s				"CC_SinTime"
#define kCCUniformCosTime_s				"CC_CosTime"
#define kCCUniformRandom01_s			"CC_Random01"
#define kCCUniformSampler_s				"CC_Texture0"
#define kCCUniformAlphaTestValue_s		"CC_AlphaValue"

// Attribute names
#define	kCCAttributeNameColor			@"a_color"
#define	kCCAttributeNamePosition		@"a_position"
#define	kCCAttributeNameTexCoord		@"a_texCoord"


struct _hashUniformEntry;

/** CCGLProgram
 Class that implements a glProgram
 
 
 @since v2.0.0
 */
@interface CCGLProgram : NSObject
{
    void* impl_;
    BOOL isNeedGLProgramDealloc_;
}

@property(nonatomic, readonly) GLuint program;

/** creates the CCGLProgram with a vertex and fragment from byte arrays */
+ (id)programWithVertexShaderByteArray:(const GLchar*)vShaderByteArray fragmentShaderByteArray:(const GLchar*)fShaderByteArray;

/** creates the CCGLProgram with a vertex and fragment with contents of filenames */
+ (id)programWithVertexShaderFilename:(NSString *)vShaderFilename fragmentShaderFilename:(NSString *)fShaderFilename;

/**  It will add a new attribute to the shader */
- (void)addAttribute:(NSString *)attributeName index:(GLuint)index;

/** links the glProgram */
- (BOOL)link;

/** it will call glUseProgram() */
- (void)use;

/** It will create 4 uniforms:
	- kCCUniformPMatrix
	- kCCUniformMVMatrix
	- kCCUniformMVPMatrix
	- kCCUniformSampler
 
 And it will bind "kCCUniformSampler" to 0
 */
- (void) updateUniforms;

/** calls retrieves the named uniform location for this shader program. */
- (GLint)uniformLocationForName:(NSString*)name;

/** calls glUniform1i only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location withI1:(GLint)i1;

/** calls glUniform1f only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1;

/** calls glUniform2f only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1 f2:(GLfloat)f2;

/** calls glUniform3f only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1 f2:(GLfloat)f2 f3:(GLfloat)f3;

/** calls glUniform4f only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1 f2:(GLfloat)f2 f3:(GLfloat)f3 f4:(GLfloat)f4;

/** calls glUniform2fv only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location with2fv:(GLfloat*)floats count:(NSUInteger)numberOfArrays;

/** calls glUniform3fv only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location with3fv:(GLfloat*)floats count:(NSUInteger)numberOfArrays;

/** calls glUniform4fv only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location with4fv:(GLvoid*)floats count:(NSUInteger)numberOfArrays;

/** calls glUniformMatrix4fv only if the values are different than the previous call for this same shader program. */
-(void) setUniformLocation:(GLint)location withMatrix4fv:(GLvoid*)matrix_array count:(NSUInteger)numberOfMatrix;

/** will update the builtin uniforms if they are different than the previous call for this same shader program. */
-(void) setUniformsForBuiltins;

/** Deprecated alias for setUniformsForBuiltins */
-(void)setUniformForModelViewProjectionMatrix __attribute__((__deprecated__));

/** returns the vertexShader error log */
- (NSString *)vertexShaderLog;

/** returns the fragmentShader error log */
- (NSString *)fragmentShaderLog;

/** returns the program error log */
- (NSString *)programLog;

-(id)initWithObject: (void*)object;

-(void*) getImpl;

@end
