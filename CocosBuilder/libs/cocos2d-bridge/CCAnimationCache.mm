//
//  CCAnimationCache.m
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import "CCAnimationCache.h"

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
    
    [_animations release];
    [super dealloc];
}

-(void) addAnimation:(CCAnimation*)animation name:(NSString*)name
{
    AnimationCache* cache = AnimationCache::getInstance();
    Animation* anim = (Animation*)[animation getImpl];
    cache->addAnimation(anim, name);
}

-(void) removeAnimationByName:(NSString*)name
{
    if( ! name )
        return;
    
    AnimationCache* cache = AnimationCache::getInstance();
    cache->removeAnimation(name);
}

-(CCAnimation*) animationByName:(NSString*)name
{
    AnimationCache* cache = AnimationCache::getInstance();
    return cache->getAnimation(name);
}

-(void)addAnimationsWithDictionary:(NSDictionary *)dictionary
{
    AnimationCache* cache = AnimationCache::getInstance();
    cache->addAnimationsWithDictionary(dictionary, nil);
}


/** Read an NSDictionary from a plist file and parse it automatically for animations */
-(void)addAnimationsWithFile:(NSString *)plist
{
    AnimationCache* cache = AnimationCache::getInstance();
    cache->addAnimationsWithFile(plist);
}

@end
