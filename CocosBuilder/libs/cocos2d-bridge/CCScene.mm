//
// CCScene Wrapper
//
// author xiaobo.wang
//
// 2017-04-05 15:58:58
//

#import "CCScene.h"
#import "2d/CCScene.h"

@implementation CCScene

+(id) node
{
    return [[[self alloc] init] autorelease];
}

-(id) init
{
    return [self init:nil];
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                  = pThis;
        isNeedSceneDealloc_    = NO;
    }
    else
    {
        impl_ = cocos2d::Scene::create();
        ((cocos2d::Scene*)impl_)->retain();
        
        isNeedSceneDealloc_ = YES;
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                 = object;
    ((cocos2d::Scene*)impl_)->retain();
    isNeedSceneDealloc_   = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedSceneDealloc_)
        ((cocos2d::Scene*)impl_)->release();
    
    [super dealloc];
}

@end
