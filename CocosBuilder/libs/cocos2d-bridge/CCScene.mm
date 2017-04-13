//
// CCScene Wrapper
//
// author xiaobo.wang
//
// 2017-04-05 15:58:58
//

#import "CCScene.h"
#import "2d/CCScene.h"

#import "2d/CCLabel.h"

@implementation CCScene

+(id) node
{
    CCScene* scene = [[[self alloc] init] autorelease];
//    cocos2d::Scene* s = (cocos2d::Scene*)[scene getImpl];
//    cocos2d::Label* label = cocos2d::Label::createWithSystemFont("Test", "", 56);
//    label->setPosition(100, 100);
//    s->addChild(label);
    return scene;
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
