//
//  CCTextureCache.m
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import "CCTextureCache.h"
#import "renderer/CCTextureCache.h"
#import "base/CCDirector.h"
#import "CCTexture2D.h"

#include "ccTypeConvert.h"

//#ifdef __CC_PLATFORM_MAC
//#import "Platforms/Mac/CCDirectorMac.h"
//#endif

// needed for CCCallFuncO in Mac-display_link version
//#import "CCActionManager.h"
//#import "CCActionInstant.h"

#ifdef __CC_PLATFORM_IOS
static EAGLContext *_auxGLcontext = nil;
#elif defined(__CC_PLATFORM_MAC)
static NSOpenGLContext *_auxGLcontext = nil;
#endif

@implementation CCTextureCache

#pragma mark TextureCache - Alloc, Init & Dealloc
static CCTextureCache *sharedTextureCache;

+ (CCTextureCache *)sharedTextureCache
{
    if (!sharedTextureCache)
        sharedTextureCache = [[self alloc] init];
    
    return sharedTextureCache;
}

+(id)alloc
{
    NSAssert(sharedTextureCache == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

+(void)purgeSharedTextureCache
{
    [sharedTextureCache release];
    sharedTextureCache = nil;
}

-(id) init
{
    if( (self=[super init]) ) {
        
    }
    
    return self;
}

- (NSString*) description
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    return [ccTypeConvert stringToNSString:cache->getDescription()];
}

-(void) dealloc
{
    CCLOGINFO(@"cocos2d: deallocing %@", self);
    
    sharedTextureCache = nil;
    
    [super dealloc];
}

#pragma mark TextureCache - Add Images

-(void) addImageAsync: (NSString*)path target:(id)target selector:(SEL)selector
{
    __block id t = target;
    [self addImageAsync:path withBlock:^(id sender){
        [t performSelector:selector withObject:sender];
    }];
}

-(void) addImageAsync:(NSString*)path withBlock:(void(^)(CCTexture2D *tex))block
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    
    cache->addImageAsync([ccTypeConvert NSStringTostring:path], [block, self](cocos2d::Ref*){
        [block self];
    });
}

-(CCTexture2D*) addImage: (NSString*) path
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    cocos2d::Texture2D* texture = cache->addImage([ccTypeConvert NSStringTostring:path]);
    return [[[CCTexture2D alloc] initWithObject:texture] autorelease];
}


-(CCTexture2D*) addCGImage: (CGImageRef) imageref forKey: (NSString *)key
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    cocos2d::Texture2D* texture = cache->addImage([ccTypeConvert CGImageToImage:imageref], [ccTypeConvert NSStringTostring:key]);
    return [[[CCTexture2D alloc] initWithObject:texture] autorelease];
}

#pragma mark TextureCache - Remove

-(void) removeAllTextures
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    cache->removeAllTextures();
}

-(void) removeUnusedTextures
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    cache->removeUnusedTextures();
}

-(void) removeTexture: (CCTexture2D*) tex
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    cache->removeTexture((cocos2d::Texture2D*)[tex getImpl]);
}

-(void) removeTextureForKey:(NSString*)name
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    cache->removeTextureForKey([ccTypeConvert NSStringTostring:name]);
}

#pragma mark TextureCache - Get
- (CCTexture2D *)textureForKey:(NSString *)key
{
    cocos2d::TextureCache* cache = cocos2d::Director::getInstance()->getTextureCache();
    cocos2d::Texture2D* texture = cache->getTextureForKey([ccTypeConvert NSStringTostring:key]);
    return [[[CCTexture2D alloc] initWithObject:texture] autorelease];
}

@end
