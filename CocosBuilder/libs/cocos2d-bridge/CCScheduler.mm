//
// CCScheduler
//
// author ke.huang

#import "CCScheduler.h"
#import "base/CCScheduler.h"

@implementation CCTimer

+(id)alloc
{
    return [super alloc];
}

- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedSTimerDealloc_  = NO;
    }
    else
    {
        impl_ = nil;
        isNeedSTimerDealloc_  = YES;
    }
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    ((cocos2d::Timer*)impl_)->retain();
    isNeedSTimerDealloc_  = YES;
    
    self = [super init];
    return self;
}

-(void) dealloc
{
    if(isNeedSTimerDealloc_)
        ((cocos2d::Timer*)impl_)->release();
    [super dealloc];
}
-(void*)getImpl
{
    return impl_;
}
@end

#pragma mark CCTimerTargetSelector

@implementation CCTimerTargetSelector

-(id) initWithObject: (void*) object
{
    impl_               = object;
    ((cocos2d::TimerTargetSelector*)impl_)->retain();
    isNeeddTimerTargetDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                  = pThis;
        isNeeddTimerTargetDealloc_    = NO;
    }
    else
    {
        cocos2d::TimerTargetSelector* targetSel = new cocos2d::TimerTargetSelector();
        targetSel->retain();
        targetSel->autorelease();
        impl_ = targetSel;
        isNeeddTimerTargetDealloc_ = YES;
    }
    
    self = [super init:impl_];
    return self;
}

-(void*)getImpl
{
    return impl_;
}
-(void) dealloc
{
    if (isNeeddTimerTargetDealloc_)
        ((cocos2d::TimerTargetSelector*)impl_)->release();
    
    [super dealloc];
}
@end

#pragma mark CCTimerBlock

@implementation CCTimerBlock
-(id) initWithObject: (void*) object
{
    impl_               = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedSTimerDealloc_  = YES;
    
    self = [super init];
    return self;
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                  = pThis;
        isNeedSTimerDealloc_    = NO;
    }
    else
    {
        impl_ = nil;
        //no class TimerBlock in c++
        isNeedSTimerDealloc_ = NO;
    }
    
    self = [super init:impl_];
    return self;
}

-(void*)getImpl
{
    return impl_;
}
-(void) dealloc
{
    [super dealloc];
}


@end
#pragma mark - CCScheduler

@implementation CCScheduler
+(id)alloc
{
    return [super alloc];
}

- (id) init:(void*) pThis
{
    self = [super init];
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedSchedulerDealloc_  = NO;
    }
    else
    {
        isNeedSchedulerDealloc_  = YES;
        cocos2d::Scheduler* sel = new cocos2d::Scheduler();
        sel->retain();
        sel->autorelease();
        impl_ = sel;
    }
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    ((cocos2d::Scheduler*)impl_)->retain();
    isNeedSchedulerDealloc_  = YES;
    
    self = [self init:impl_];
    return self;
}

-(void) dealloc
{
    if(isNeedSchedulerDealloc_)
        ((cocos2d::Scheduler*)impl_)->release();
    [super dealloc];
}

-(void*)getImpl
{
    return impl_;
}

- (id) init
{
    return [self init:nil];
}

@end
