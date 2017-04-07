//
// CCTextureAtlas
//
// author ke.huang

#import "CCTextureAtlas.h"
#import "2d/CCTextureAtlas.h"

@implementation CCTextureAtlas

- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedTextureAtlasDealloc_  = NO;
    }
    else
    {
        cocos2d::TextureAtlas* bathNode = new cocos2d::TextureAtlas();
        impl_ = bathNode;
        impl_->autorelease();
        
        isNeedTextureAtlasDealloc_  = YES;
    }
    
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedTextureAtlasDealloc_  = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedTextureAtlasDealloc_)
    {
        ((cocos2d::TextureAtlas*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (NSUInteger)totalQuads
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    return _textureAtlas->getTotalQuads();
}

- (NSUInteger)capacity
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    return _textureAtlas->getCapacity();
}

- (CCTexture2D*)texture
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    return [[[CCTexture2D alloc ]initWithObject: _textureAtlas->getTexture()] autorelease];
}
-(void) setTexture:(CCTexture2D*)texture
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->setTexture(((cocos2d::Texture2D*)[texture getImpl]));
}
- (ccV3F_C4B_T2F_Quad)quads
{
    //TODO ccV3F_C4B_T2F_Quad
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    return _textureAtlas->getQuads();
}

- (void)setQuads:_quads
{
    //TODO ccV3F_C4B_T2F_Quad
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->setQuads(_quads);
}

+(id) textureAtlasWithFile:(NSString*) file capacity: (NSUInteger) n
{
    return [[[self alloc] initWithFile:file capacity:n] autorelease];
}

+(id) textureAtlasWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)n
{
    return [[[self alloc] initWithTexture:tex capacity:n] autorelease];
}

-(id) initWithFile:(NSString*)file capacity:(NSUInteger)n
{
    if( (self=[super init])) {
        cocos2d::TextureAtlas* _textureAtlas = cocos2d::TextureAtlas::create([ccTypeConvert NSStringTostring:file],n);
        impl_ = _textureAtlas;
        
        impl_->retain();
        isNeedTextureAtlasDealloc_ = YES;
    }
    return self;

}

-(id) initWithTexture:(CCTexture2D*)tex capacity:(NSUInteger)n
{
    if( (self=[super init])) {
        cocos2d::CCTexture2D* _texture2D = (cocos2d::CCTexture2D*)[tex getImpl];
        cocos2d::TextureAtlas* _textureAtlas = cocos2d::TextureAtlas::createWithTexture(_texture2D,n);
        impl_ = _textureAtlas;
        
        impl_->retain();
        isNeedTextureAtlasDealloc_ = YES;
    }
    return self;
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | totalQuads =  %lu>", [self class], self, (unsigned long)[self totalQuads]];
}

-(void) setupIndices
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->setupIndices();

}

#if CC_TEXTURE_ATLAS_USE_VAO
-(void) setupVBOandVAO
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->setupVBOandVAO();
}
#else // CC_TEXTURE_ATLAS_USE_VAO
-(void) setupVBO
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->setupVBO();
}
-(void) mapBuffers
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->mapBuffers();
}
-(void) updateQuad:(ccV3F_C4B_T2F_Quad*)quad atIndex:(NSUInteger) n
{
    //TODO ccV3F_C4B_T2F_Quad
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->updateQuad(quad,n);
}
-(void) insertQuad:(ccV3F_C4B_T2F_Quad*)quad atIndex:(NSUInteger)index
{
    //TODO ccV3F_C4B_T2F_Quad
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->insertQuad(quad,index);
}
-(void) insertQuads:(ccV3F_C4B_T2F_Quad*)quads atIndex:(NSUInteger)index amount:(NSUInteger) amount
{
    //TODO ccV3F_C4B_T2F_Quad
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->insertQuads(quad,index,amount);
}
-(void) insertQuadFromIndex:(NSUInteger)oldIndex atIndex:(NSUInteger)newIndex
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->insertQuadFromIndex(oldIndex,newIndex);
}

-(void) moveQuadsFromIndex:(NSUInteger)oldIndex amount:(NSUInteger) amount atIndex:(NSUInteger)newIndex
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->moveQuadsFromIndex(oldIndex,amount,newIndex);
}
-(void) removeQuadAtIndex:(NSUInteger) index
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->removeQuadAtIndex(index);

}
-(void) removeQuadsAtIndex:(NSUInteger) index amount:(NSUInteger) amount
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->removeQuadsAtIndex(index,amount);
}
-(void) removeAllQuads
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->removeAllQuads();
}
#pragma mark TextureAtlas - Resize

-(BOOL) resizeCapacity: (NSUInteger) newCapacity
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    return _textureAtlas->resizeCapacity(newCapacity);
    
}
#pragma mark TextureAtlas - CCParticleBatchNode Specific

-(void) fillWithEmptyQuadsFromIndex:(NSUInteger) index amount:(NSUInteger) amount
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->fillWithEmptyQuadsFromIndex(index,amount);
}
-(void) increaseTotalQuadsWith:(NSUInteger) amount
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->increaseTotalQuadsWith(amount);
}
-(void) moveQuadsFromIndex:(NSUInteger) index to:(NSUInteger) newIndex
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->moveQuadsFromIndex(index,newIndex);
}
#pragma mark TextureAtlas - Drawing

-(void) drawQuads
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->drawQuads();
}

-(void) drawNumberOfQuads: (NSUInteger) n
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->drawNumberOfQuads(n);
}
-(void) drawNumberOfQuads: (NSUInteger) n fromIndex: (NSUInteger) start
{
    cocos2d::TextureAtlas* _textureAtlas = (cocos2d::TextureAtlas*)impl_;
    _textureAtlas->drawNumberOfQuads(n,start);
}

@end


