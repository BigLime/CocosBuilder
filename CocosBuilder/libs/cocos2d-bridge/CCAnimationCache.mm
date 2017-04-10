//
//  CCAnimationCache.m
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import "CCAnimationCache.h"
#import "CCAnimation.h"
#import "2d/CCAnimationCache.h"
#import "2d/CCAnimation.h"
#include "ccTypeConvert.h"

@implementation CCAnimationCache

static CCAnimationCache *_sharedAnimationCache=nil;

+ (CCAnimationCache *)sharedAnimationCache
{
    if (!_sharedAnimationCache)
        _sharedAnimationCache = [[CCAnimationCache alloc] init];
    
    return _sharedAnimationCache;
}

+(id)alloc
{
    NSAssert(_sharedAnimationCache == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

+(void)purgeSharedAnimationCache
{
    [_sharedAnimationCache release];
    _sharedAnimationCache = nil;
}

-(id) init
{
    if( (self=[super init]) ) {

    }
    
    return self;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | num of animations =  >", [self class], self];
}

-(void) dealloc
{
    CCLOGINFO(@"cocos2d: deallocing %@", self);

    [super dealloc];
}

-(void) addAnimation:(CCAnimation*)animation name:(NSString*)name
{
    cocos2d::AnimationCache* cache = cocos2d::AnimationCache::getInstance();
    cocos2d::Animation* anim = (cocos2d::Animation*)[animation getImpl];
    cache->addAnimation(anim, [ccTypeConvert NSStringTostring:name]);
}

-(void) removeAnimationByName:(NSString*)name
{
    if( ! name )
        return;
    
    cocos2d::AnimationCache* cache = cocos2d::AnimationCache::getInstance();
    cache->removeAnimation([ccTypeConvert NSStringTostring:name]);
}

-(CCAnimation*) animationByName:(NSString*)name
{
    cocos2d::AnimationCache* cache = cocos2d::AnimationCache::getInstance();
    cocos2d::Animation* anim = cache->getAnimation([ccTypeConvert NSStringTostring:name]);
    return [[[CCAnimation alloc] initWithObject:anim] autorelease];
}

-(void)addAnimationsWithFile:(NSString *)plist
{
    cocos2d::AnimationCache* cache = cocos2d::AnimationCache::getInstance();
    cache->addAnimationsWithFile([ccTypeConvert NSStringTostring:plist]);
}

@end
