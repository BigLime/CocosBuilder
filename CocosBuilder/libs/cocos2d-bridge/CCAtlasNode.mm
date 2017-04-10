//
// CCAtlasNode Wrapper
//
// author xiaobo.wang
//
// 2017-04-10 14:38:49
//

#import "CCAtlasNode.h"
#import "2d/CCAtlasNode.h"

#import "ccTypeConvert.h"

@implementation CCAtlasNode

// @synthesize textureAtlas = _textureAtlas;
-(void)setTextureAtlas:(CCTextureAtlas *)textureAtlas
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->setTextureAtlas(static_cast<cocos2d::TextureAtlas*>([textureAtlas getImpl]));
}

-(CCTextureAtlas *)textureAtlas
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    return [[CCTextureAtlas alloc]initWithObject: node->getTextureAtlas()];
}

// @synthesize blendFunc = _blendFunc;
-(void)setBlendFunc:(ccBlendFunc)blendFunc
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->setBlendFunc([ccTypeConvert ccBlendFuncToBlendFunc: blendFunc]);
}

-(ccBlendFunc)blendFunc
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    return [ccTypeConvert BlendFuncToccBlendFunc:node->getBlendFunc()];
}

// @synthesize quadsToDraw = _quadsToDraw;
-(void)setQuadsToDraw:(NSUInteger)quadsToDraw
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->setQuadsToDraw(quadsToDraw);
}

-(NSUInteger)quadsToDraw
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    return node->getQuadsToDraw();
}

#pragma mark CCAtlasNode - Creation & Init
- (id) init
{
    NSAssert( NO, @"Not supported - Use initWtihTileFile instead");
    return self;
}

+(id) atlasWithTileFile:(NSString*)tile tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c
{
    return [[[self alloc] initWithTileFile:tile tileWidth:w tileHeight:h itemsToRender:c] autorelease];
}

-(id) initWithTileFile:(NSString*)filename tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c
{
    cocos2d::AtlasNode* node = cocos2d::AtlasNode::create([filename UTF8String], w, h, c);
    node->retain();
    
    impl_ = node;
    isNeedCCAtlasNodeDealloc_ = YES;

    self = [super init:impl_];
    return self;
}

-(id) initWithTexture:(CCTexture2D*)texture tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c
{
    // TODO: Not Supported in cpp now.
    NSAssert( NO, @"Not supported - Use initWtihTileFile instead");
    return self;
}

-(void) dealloc
{
    if (isNeedCCAtlasNodeDealloc_)
    {
        cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
        node->release();
    }
    
    [super dealloc];
}

#pragma mark CCAtlasNode - Atlas generation

-(void) calculateMaxItems
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    
    // TODO:
    NSAssert( NO, @"Not supported - Cpp Protected.");
    // node->calculateMaxItems();
}

-(void) updateAtlasValues
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->updateAtlasValues();
}

#pragma mark CCAtlasNode - draw
- (void) draw
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    
    // TODO: different params.
    NSAssert( NO, @"Not supported - Cpp different params.");
    // node->draw();
}

#pragma mark CCAtlasNode - RGBA protocol

- (ccColor3B) color
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: node->getColor()];
}

-(void) setColor:(ccColor3B)color3
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->setColor([ccTypeConvert ccColor3BToColor3B: color3]);
}

-(void) setOpacity:(GLubyte) anOpacity
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->setOpacity(anOpacity);
}

-(void) setOpacityModifyRGB:(BOOL)modify
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->setOpacityModifyRGB(modify);
}

-(BOOL) doesOpacityModifyRGB
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    return node->isOpacityModifyRGB();
}

-(void) updateOpacityModifyRGB
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    
    // TODO: protected in cpp.
    NSAssert( NO, @"Not supported - Cpp protected functions.");
    // node->updateOpacityModifyRGB();
}

#pragma mark CCAtlasNode - CCNodeTexture protocol

-(void) updateBlendFunc
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    
    // TODO: protected in cpp.
    NSAssert( NO, @"Not supported - Cpp protected functions.");
    // node->updateBlendFunc();
}

-(void) setTexture:(CCTexture2D*)texture
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    node->setTexture(static_cast<cocos2d::Texture2D*>([texture getImpl]));
}

-(CCTexture2D*) texture
{
    cocos2d::AtlasNode* node = static_cast<cocos2d::AtlasNode*>(impl_);
    return [[CCTexture2D alloc]initWithObject: node->getTexture()]; 
}
@end
