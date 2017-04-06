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

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                  = pThis;
        isNeedCCSceneDealloc_  = NO;
    }
    else
    {
        impl_ = cocos2d::CCScene::Create();
        impl_->retain();
        
        isNeedCCSceneDealloc_ = YES;
    }
    
    self = [super init:self];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                 = object;
    isNeedCCSceneDealloc_ = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedCCSceneDealloc_)
        impl_->release();
    
    [super dealloc];
}

@end
