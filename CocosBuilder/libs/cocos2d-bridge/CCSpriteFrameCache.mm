//
// CCSpriteFrameCache
//
// author ke.huang 17/4/7


#import "CCSpriteFrameCache.h"
#import "2d/CCSpriteFrameCache.h"
#import "renderer/CCTexture2D.h"
#import "ccTypeConvert.h"
#import "CCTexture2D.h"

@implementation CCSpriteFrameCache

static CCSpriteFrameCache *_sharedSpriteFrameCache=nil;

+ (CCSpriteFrameCache *)sharedSpriteFrameCache
{
    if (!_sharedSpriteFrameCache)
        _sharedSpriteFrameCache = [[CCSpriteFrameCache alloc] init];
    
    return _sharedSpriteFrameCache;
}

+(id)alloc
{
    NSAssert(_sharedSpriteFrameCache == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

+(void)purgeSharedSpriteFrameCache
{
    [_sharedSpriteFrameCache release];
    _sharedSpriteFrameCache = nil;
}

-(id) init
{
    if( (self=[super init]) ) {
    }
    
    return self;

}
- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | num of sprite frames =  %lu %@>", [self class], self, 0l,@"no thisDescription in c++"];
}

-(void) dealloc
{
    cocos2d::SpriteFrameCache::getInstance()->destroyInstance();
    [super dealloc];
}

-(void) addSpriteFramesWithFile:(NSString*)plist
{
    NSAssert(plist, @"plist filename should not be nil");
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->addSpriteFramesWithFile([ccTypeConvert NSStringTostring:plist]);
}

-(void) addSpriteFramesWithFile:(NSString*)plist textureFilename:(NSString*)filename
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->addSpriteFramesWithFile([ccTypeConvert NSStringTostring:plist], [ccTypeConvert NSStringTostring:filename]);
}

-(void) addSpriteFramesWithFile:(NSString*)plist texture:(CCTexture2D*)texture
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->addSpriteFramesWithFile([ccTypeConvert NSStringTostring:plist], (cocos2d::Texture2D*)[texture getImpl]);
}

-(void) addSpriteFrame:(CCSpriteFrame*)frame name:(NSString*)frameName
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string name = [frameName UTF8String];
    cocos2d::SpriteFrame* spriteFrame = (cocos2d::SpriteFrame*)[frame getImpl];
    spriteFrameCache->addSpriteFrame(spriteFrame,name);
}
-(void) removeSpriteFrames
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->removeSpriteFrames();
}
-(void) removeUnusedSpriteFrames
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->removeUnusedSpriteFrames();
}
-(void) removeSpriteFrameByName:(NSString*)name
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string nameStr = [name UTF8String];
    spriteFrameCache->removeSpriteFrameByName(nameStr);
}
- (void) removeSpriteFramesFromFile:(NSString*) plist
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string plistStr = [plist UTF8String];
    spriteFrameCache->removeSpriteFramesFromFile(plistStr);
}

- (void) removeSpriteFramesFromTexture:(CCTexture2D*) texture
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)[texture getImpl];
    spriteFrameCache->removeSpriteFramesFromTexture(texture2D);
}
-(CCSpriteFrame*) spriteFrameByName:(NSString*)name
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string nameStr = [name UTF8String];
    cocos2d::SpriteFrame* spriteFrame = spriteFrameCache->getSpriteFrameByName(nameStr);
    return [[[CCSpriteFrame alloc ]initWithObject: spriteFrame] autorelease];
}

@end
