//
// CCSpriteBatchNode
//
// author ke.huang 17/4/7

#import "CCSpriteBatchNode.h"
#import "2d/CCSpriteBatchNode.h"

@implementation CCSpriteBatchNode

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
        cocos2dx::SpriteBatchNode* bathNode = new cocos2dx::SpriteBatchNode();
        impl_ = bathNode;
        impl_->autorelease();
        
        isNeedBatchNodeDealloc_  = YES;
    }
    
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
        ((cocos2dx::SpriteBatchNode*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (CCTextureAtlas*) textureAtlas
{
    return [[[CCSpriteFrame alloc ]initWithObject: ((cocos2dx::SpriteFrame*)impl_)->getTexture()] autorelease];
}

- (void) setTextureAtlas:_textureAtlas
{
    ((cocos2dx::SpriteBatchNode*)impl_)->setTextureAtlas(((cocos2dx::TextureAtlas*)[_textureAtlas getImpl]));
}
- (ccBlendFunc) blendFunc
{
    //TODO ccBlendFunc
    return ((cocos2dx::SpriteBatchNode*)impl_)->getBlendFunc();
}
- (void) setBlendFunc:_blendFunc
{
    //TODO ccBlendFunc
    ((cocos2dx::SpriteBatchNode*)impl_)->setBlendFunc(_blendFunc);
}

- (CCArray*)descendants
{
    std::vector<cocos2dx::Sprite> spriteVec = ((cocos2dx::SpriteBatchNode*)impl_)->getDescendants();
    return [ccTypeConvert VectorSpriteToNSMutableArray:spriteVec];
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
    if( (self=[super init])) {
        cocos2dx::SpriteBatchNode* batchNode = cocos2dx::SpriteBatchNode::create(((cocos2dx::Texture2D*)[tex getImpl]),capacity);
        impl_ = batchNode;
        
        impl_->retain();
        isNeedBatchNodeDealloc_ = YES;
    }
    return self;
}
- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | Tag = %ld>", [self class], self, (long)[self getTag ]];
}

-(void) visit
{
    
    ((cocos2dx::SpriteBatchNode*)impl_)->visit();
}

-(void) addChild:(CCSprite*)child z:(NSInteger)z tag:(NSInteger) aTag
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[child getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->addChild(_sprite,z,aTag);
}
-(void) reorderChild:(CCSprite*)child z:(NSInteger)z
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[child getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->reorderChild(_sprite,z);
}
-(void)removeChild: (CCSprite *)sprite cleanup:(BOOL)doCleanup
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->removeChild(_sprite,doCleanup);
}
-(void)removeChildAtIndex:(NSUInteger)index cleanup:(BOOL)doCleanup
{
    ((cocos2dx::SpriteBatchNode*)impl_)->removeChildAtIndex(index,doCleanup);
}
-(void)removeAllChildrenWithCleanup:(BOOL)doCleanup
{
    ((cocos2dx::SpriteBatchNode*)impl_)->removeAllChildrenWithCleanup(doCleanup);
}
- (void) sortAllChildren
{
    ((cocos2dx::SpriteBatchNode*)impl_)->sortAllChildren();
}
-(void) updateAtlasIndex:(CCSprite*) sprite currentIndex:(NSInteger*) curIndex
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->updateAtlasIndex(_sprite,curIndex);
}
- (void) swap:(NSInteger) oldIndex withNewIndex:(NSInteger) newIndex
{
    ((cocos2dx::SpriteBatchNode*)impl_)->swap(oldIndex,newIndex);
}
- (void) reorderBatch:(BOOL) reorder
{
    ((cocos2dx::SpriteBatchNode*)impl_)->reorderBatch(reorder);
}
-(void) draw
{
    NSAssert( false, @"Invalid function draw()");
   ( (cocos2dx::SpriteBatchNode*)impl_)->draw();
}
-(void) increaseAtlasCapacity
{
    ((cocos2dx::SpriteBatchNode*)impl_)->increaseAtlasCapacity();
}
-(NSUInteger) rebuildIndexInOrder:(CCSprite*)sprite atlasIndex:(NSUInteger)index
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    return ((cocos2dx::SpriteBatchNode*)impl_)->rebuildIndexInOrder(_sprite,index);
}
-(NSUInteger) highestAtlasIndexInChild:(CCSprite*)sprite
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    return ((cocos2dx::SpriteBatchNode*)impl_)->highestAtlasIndexInChild(_sprite);
}
-(NSUInteger) lowestAtlasIndexInChild:(CCSprite*)sprite
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    return ((cocos2dx::SpriteBatchNode*)impl_)->lowestAtlasIndexInChild(_sprite);
}
-(NSUInteger)atlasIndexForChild:(CCSprite*)sprite atZ:(NSInteger)z
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    return ((cocos2dx::SpriteBatchNode*)impl_)->lowestAtlasIndexInChild(_sprite,z);
}
-(void) insertChild:(CCSprite*)sprite inAtlasAtIndex:(NSUInteger)index
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->insertChild(_sprite,index);
}
-(void) appendChild:(CCSprite*)sprite
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->appendChild(_sprite);
}
-(void) removeSpriteFromAtlas:(CCSprite*)sprite
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->removeSpriteFromAtlas(_sprite);
}
-(void) updateBlendFunc
{
    ((cocos2dx::SpriteBatchNode*)impl_)->updateBlendFunc();
}
-(void) setTexture:(CCTexture2D*)texture
{
   ((cocos2dx::SpriteBatchNode*)impl_)->setTexture(((cocos2dx::Texture2D*)[texture getImpl]));
}
-(CCTexture2D*) texture
{
    return [[[CCTexture2D alloc ]initWithObject: ((cocos2dx::SpriteBatchNode*)impl_)->getTexture()] autorelease];
}
@end

#pragma mark - CCSpriteBatchNode Extension

@implementation CCSpriteBatchNode (QuadExtension)

-(void) insertQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->insertQuadFromSprite(_sprite,index);
}
-(void) updateQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[sprite getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->updateQuadFromSprite(_sprite,index);
}
-(id) addSpriteWithoutQuad:(CCSprite*)child z:(NSUInteger)z tag:(NSInteger)aTag
{
    cocos2dx::Sprite* _sprite = (cocos2dx::Sprite*)[child getImpl];
    ((cocos2dx::SpriteBatchNode*)impl_)->addSpriteWithoutQuad(_sprite,z,tag);
}
@end
