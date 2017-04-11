//
//  SimpleAudioEngine.m
//  CocosBuilder
//
//  Created by Leem on 17/4/11.
//
//

#import "SimpleAudioEngine.h"
#import "audio/include/SimpleAudioEngine.h"
#import "ccTypeConvert.h"

@implementation SimpleAudioEngine

static SimpleAudioEngine *sharedEngine = nil;

// Init
+ (SimpleAudioEngine *) sharedEngine
{
    @synchronized(self)     {
        if (!sharedEngine)
            sharedEngine = [[SimpleAudioEngine alloc] init];
    }
    return sharedEngine;
}

+ (id) alloc
{
    @synchronized(self)     {
        NSAssert(sharedEngine == nil, @"Attempted to allocate a second instance of a singleton.");
        return [super alloc];
    }
    return nil;
}

-(id) init
{
    if((self=[super init])) {
        
    }
    return self;
}

// Memory
- (void) dealloc
{
    [super dealloc];
}

-(ALuint) playEffect:(NSString*) filePath loop:(BOOL) loop pitch:(Float32) pitch pan:(Float32) pan gain:(Float32) gain
{
    CocosDenshion::SimpleAudioEngine* instance = CocosDenshion::SimpleAudioEngine::getInstance();
    return instance->playEffect([ccTypeConvert NSStringTostring:filePath].c_str(), loop, pitch, pan, gain);
}

@end 
