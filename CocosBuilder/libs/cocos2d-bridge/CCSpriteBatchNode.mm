//
// CCSpriteBatchNode
//
// author ke.huang 17/4/7

#import "CCSpriteBatchNode.h"
#import "CCSpriteFrame.h"
#import "CCTextureAtlas.h"
#import "CCTexture2D.h"
#import "CCTextureCache.h"
#import "ccTypeConvert.h"
#import "2d/CCSpriteBatchNode.h"

@implementation CCSpriteBatchNode
const NSUInteger defaultCapacity = 29;
- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedBatchNodeDealloc_  = NO;
    }
    else
    {
        cocos2d::SpriteBatchNode* bathNode = new cocos2d::SpriteBatchNode();
        bathNode->autorelease();
        impl_ = bathNode;
        
        isNeedBatchNodeDealloc_  = YES;
    }
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedBatchNodeDealloc_  = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedBatchNodeDealloc_)
    {
        ((cocos2d::SpriteBatchNode*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (CCTextureAtlas*) textureAtlas
{
    return [[[CCTextureAtlas alloc ]initWithObject: ((cocos2d::TextureAtlas*)impl_)->getTexture()] autorelease];
}

- (void) setTextureAtlas:(CCTextureAtlas*)_textureAtlas
{
    ((cocos2d::SpriteBatchNode*)impl_)->setTextureAtlas(((cocos2d::TextureAtlas*)[_textureAtlas getImpl]));
}
- (ccBlendFunc) blendFunc
{
    return [ccTypeConvert BlendFuncToccBlendFunc:((cocos2d::SpriteBatchNode*)impl_)->getBlendFunc()];
}
- (void) setBlendFunc:(ccBlendFunc)_blendFunc
{
    ((cocos2d::SpriteBatchNode*)impl_)->setBlendFunc([ccTypeConvert ccBlendFuncToBlendFunc:_blendFunc]);
}

- (CCArray*)descendants
{
    std::vector<cocos2d::Sprite*> spriteVec = ((cocos2d::SpriteBatchNode*)impl_)->getDescendants();
    return [ccTypeConvert StdVectorSpriteToCCArray:spriteVec];
}

/*
 * creation with CCTexture2D
 */
+(id)batchNodeWithTexture:(CCTexture2D *)tex
{
    return [[[self alloc] initWithTexture:tex capacity:defaultCapacity] autorelease];
}

+(id)batchNodeWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity
{
    return [[[self alloc] initWithTexture:tex capacity:capacity] autorelease];
}

/*
 * creation with File Image
 */
+(id)batchNodeWithFile:(NSString*)fileImage capacity:(NSUInteger)capacity
{
    return [[[self alloc] initWithFile:fileImage capacity:capacity] autorelease];
}

+(id)batchNodeWithFile:(NSString*) imageFile
{
    return [[[self alloc] initWithFile:imageFile capacity:defaultCapacity] autorelease];
}

-(id)init
{
    return [self initWithTexture:[[[CCTexture2D alloc] init] autorelease] capacity:0];
}

-(id)initWithFile:(NSString *)fileImage capacity:(NSUInteger)capacity
{
    CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:fileImage];
    return [self initWithTexture:tex capacity:capacity];
}
// Designated initializer
-(id)initWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity
{
    cocos2d::SpriteBatchNode* batchNode = cocos2d::SpriteBatchNode::createWithTexture(((cocos2d::Texture2D*)[tex getImpl]),capacity);
    impl_ = batchNode;
        
    batchNode->retain();
    isNeedBatchNodeDealloc_ = YES;

    self=[super init:impl_];
    return self;
}
- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | Tag = %ld>", [self class], self, (long)[self tag]];
}

-(void) visit
{
    
    //((cocos2d::SpriteBatchNode*)impl_)->visit();
}

-(void) addChild:(CCSprite*)child z:(NSInteger)z tag:(NSInteger) aTag
{
    cocos2d::Node* _sprite = (cocos2d::Node*)[child getImpl];
    ((cocos2d::SpriteBatchNode*)impl_)->addChild(_sprite,z,aTag);
}
-(void) reorderChild:(CCSprite*)child z:(NSInteger)z
{
    cocos2d::Node* _sprite = (cocos2d::Node*)[child getImpl];
    ((cocos2d::SpriteBatchNode*)impl_)->reorderChild(_sprite,z);
}
-(void)removeChild: (CCSprite *)sprite cleanup:(BOOL)doCleanup
{
    cocos2d::Node* _sprite = (cocos2d::Node*)[sprite getImpl];
    ((cocos2d::SpriteBatchNode*)impl_)->removeChild(_sprite,doCleanup);
}
-(void)removeChildAtIndex:(NSUInteger)index cleanup:(BOOL)doCleanup
{
    ((cocos2d::SpriteBatchNode*)impl_)->removeChildAtIndex(index,doCleanup);
}
-(void)removeAllChildrenWithCleanup:(BOOL)doCleanup
{
    ((cocos2d::SpriteBatchNode*)impl_)->removeAllChildrenWithCleanup(doCleanup);
}
- (void) sortAllChildren
{
    ((cocos2d::SpriteBatchNode*)impl_)->sortAllChildren();
}
-(void) updateAtlasIndex:(CCSprite*) sprite currentIndex:(NSInteger*) curIndex
{
    NSAssert(false, @"updateAtlasIndex is protected");
    //cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    //((cocos2d::SpriteBatchNode*)impl_)->updateAtlasIndex(_sprite,curIndex);
}
- (void) swap:(NSInteger) oldIndex withNewIndex:(NSInteger) newIndex
{
    NSAssert(false, @"swap is protected");
    //((cocos2d::SpriteBatchNode*)impl_)->swap(oldIndex,newIndex);
}
- (void) reorderBatch:(BOOL) reorder
{
    ((cocos2d::SpriteBatchNode*)impl_)->reorderBatch(reorder);
}
-(void) draw
{
    NSAssert( false, @"Invalid function draw()");
   //( (cocos2d::SpriteBatchNode*)impl_)->draw();
}
-(void) increaseAtlasCapacity
{
    ((cocos2d::SpriteBatchNode*)impl_)->increaseAtlasCapacity();
}
-(NSUInteger) rebuildIndexInOrder:(CCSprite*)sprite atlasIndex:(NSUInteger)index
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    return ((cocos2d::SpriteBatchNode*)impl_)->rebuildIndexInOrder(_sprite,index);
}
-(NSUInteger) highestAtlasIndexInChild:(CCSprite*)sprite
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    return ((cocos2d::SpriteBatchNode*)impl_)->highestAtlasIndexInChild(_sprite);
}
-(NSUInteger) lowestAtlasIndexInChild:(CCSprite*)sprite
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    return ((cocos2d::SpriteBatchNode*)impl_)->lowestAtlasIndexInChild(_sprite);
}
-(NSUInteger)atlasIndexForChild:(CCSprite*)sprite atZ:(NSInteger)z
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    return ((cocos2d::SpriteBatchNode*)impl_)->atlasIndexForChild(_sprite,z);
}
-(void) insertChild:(CCSprite*)sprite inAtlasAtIndex:(NSUInteger)index
{
    NSAssert(false, @"no insertChild in c++");
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    //((cocos2d::SpriteBatchNode*)impl_)->insertChild(_sprite,index);
    ((cocos2d::SpriteBatchNode*)impl_)->appendChild(_sprite);
}
-(void) appendChild:(CCSprite*)sprite
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    ((cocos2d::SpriteBatchNode*)impl_)->appendChild(_sprite);
}
-(void) removeSpriteFromAtlas:(CCSprite*)sprite
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    ((cocos2d::SpriteBatchNode*)impl_)->removeSpriteFromAtlas(_sprite);
}
-(void) updateBlendFunc
{
    
    NSAssert(false, @"updateBlendFunc is protected");
    //((cocos2d::SpriteBatchNode*)impl_)->updateBlendFunc();
}
-(void) setTexture:(CCTexture2D*)texture
{
   ((cocos2d::SpriteBatchNode*)impl_)->setTexture(((cocos2d::Texture2D*)[texture getImpl]));
}
-(CCTexture2D*) texture
{
    return [[[CCTexture2D alloc ]initWithObject: ((cocos2d::SpriteBatchNode*)impl_)->getTexture()] autorelease];
}
@end

#pragma mark - CCSpriteBatchNode Extension

@implementation CCSpriteBatchNode (QuadExtension)

-(void) insertQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    ((cocos2d::SpriteBatchNode*)impl_)->insertQuadFromSprite(_sprite,index);
}
-(void) updateQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index
{
    NSAssert(false, @"updateQuadFromSprite is protected");
    //cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[sprite getImpl];
    //((cocos2d::SpriteBatchNode*)impl_)->updateQuadFromSprite(_sprite,index);
}
-(id) addSpriteWithoutQuad:(CCSprite*)child z:(NSUInteger)z tag:(NSInteger)aTag
{
    cocos2d::Sprite* _sprite = (cocos2d::Sprite*)[child getImpl];
    cocos2d::SpriteBatchNode* batchNode = ((cocos2d::SpriteBatchNode*)impl_)->addSpriteWithoutQuad(_sprite,z,aTag);
    return [[[CCSpriteBatchNode alloc]initWithObject:batchNode] autorelease];
}
@end
