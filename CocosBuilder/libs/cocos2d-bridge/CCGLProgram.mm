//
//  CCGLProgram.m
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import "CCGLProgram.h"
#import "renderer/CCGLProgram.h"
#import "ccTypeConvert.h"

@implementation CCGLProgram

// getter setter
-(GLuint)program
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    return pr->getProgram();
}

+ (id)programWithVertexShaderByteArray:(const GLchar*)vShaderByteArray fragmentShaderByteArray:(const GLchar*)fShaderByteArray
{
    cocos2d::GLProgram* pr = cocos2d::GLProgram::createWithByteArrays(vShaderByteArray, fShaderByteArray);
    return [[[self alloc] initWithObject:pr] autorelease];
}

+ (id)programWithVertexShaderFilename:(NSString *)vShaderFilename fragmentShaderFilename:(NSString *)fShaderFilename
{
//    return [[[self alloc] initWithVertexShaderFilename:vShaderFilename fragmentShaderFilename:fShaderFilename] autorelease];
    cocos2d::GLProgram* pr = cocos2d::GLProgram::createWithFilenames([ccTypeConvert NSStringTostring:vShaderFilename], [ccTypeConvert NSStringTostring:fShaderFilename]);
    return [[[self alloc] initWithObject:pr] autorelease];
}

- (NSString*) description
{
//    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
//    return [ccTypeConvert stringToNSString:pr->getDescription()]; // protected
    return [NSString stringWithFormat:@"<%@ = %p>", [self class], self];
}

#pragma mark -

- (void)addAttribute:(NSString *)attributeName index:(GLuint)index
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->bindAttribLocation([ccTypeConvert NSStringTostring:attributeName], index);
}

-(void) updateUniforms
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->updateUniforms();
}

#pragma mark -

-(BOOL) link
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    return pr->link();
}

-(void) use
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->use();
}

- (NSString *)vertexShaderLog
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    return [ccTypeConvert stringToNSString:pr->getVertexShaderLog()];
}

- (NSString *)fragmentShaderLog
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    return [ccTypeConvert stringToNSString:pr->getFragmentShaderLog()];
}

- (NSString *)programLog
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    return [ccTypeConvert stringToNSString:pr->getProgramLog()];
}

- (GLint)uniformLocationForName:(NSString*)name
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    return pr->getUniformLocationForName([ccTypeConvert NSStringTostring:name].c_str());
}

-(void) setUniformLocation:(GLint)location withI1:(GLint)i1
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith1i(location, i1);
}

-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith1f(location, f1);
}

-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1 f2:(GLfloat)f2
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith2f(location, f1, f2);
}

-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1 f2:(GLfloat)f2 f3:(GLfloat)f3
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith3f(location, f1, f2, f3);
}

-(void) setUniformLocation:(GLint)location withF1:(GLfloat)f1 f2:(GLfloat)f2 f3:(GLfloat)f3 f4:(GLfloat)f4
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith4f(location, f1, f2, f3, f4);
}

-(void) setUniformLocation:(GLint)location with2fv:(GLfloat*)floats count:(NSUInteger)numberOfArrays
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith2fv(location, floats, numberOfArrays);
}

-(void) setUniformLocation:(GLint)location with3fv:(GLfloat*)floats count:(NSUInteger)numberOfArrays
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith3fv(location, floats, numberOfArrays);
}

-(void) setUniformLocation:(GLint)location with4fv:(GLvoid*)floats count:(NSUInteger)numberOfArrays
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWith4fv(location, (GLfloat*)floats, numberOfArrays);
}

-(void) setUniformLocation:(GLint)location withMatrix4fv:(GLvoid*)matrixArray count:(NSUInteger)numberOfMatrices
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformLocationWithMatrix4fv(location, (GLfloat*)matrixArray, numberOfMatrices);
}

-(void) setUniformsForBuiltins
{
    cocos2d::GLProgram* pr = (cocos2d::GLProgram*)impl_;
    pr->setUniformsForBuiltins();
}

-(void)setUniformForModelViewProjectionMatrix;
{
    [self setUniformsForBuiltins];
}

-(id)initWithObject: (void*)object
{
    impl_ = object;
    cocos2d::GLProgram* prog = static_cast<cocos2d::GLProgram*>(impl_);
    prog->retain();

    isNeedGLProgramDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

-(void) dealloc
{
    if(isNeedGLProgramDealloc_)
    {
        cocos2d::GLProgram* prog = static_cast<cocos2d::GLProgram*>(impl_);
        prog->release();
    }
    
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

@end
