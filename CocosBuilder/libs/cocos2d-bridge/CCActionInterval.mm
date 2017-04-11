//
// CCActionInterval wrapper
//
// author xiaobo.wang
//
// 2017-04-11 19:08:23
//


#import "CCActionInterval.h"
#import "2d/CCActionInterval.h"

//
// IntervalAction
//
#pragma mark - CCIntervalAction
@implementation CCActionInterval

-(id) init
{
	NSAssert(NO, @"IntervalActionInit: Init not supported. Use InitWithDuration");
	[self release];
	return nil;
}

-(id) init: (void*) pThis
{
    NSAssert(!!pThis, @"CCActionInterval.h is a virtual type in cpp");
    if (!!pThis)
    {
        impl_                             = pThis;
        isNeedCCActionIntervalDealloc_    = NO;
    }
    else
    {
        
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_                           = object;
    isNeedCCActionIntervalDealloc_  = NO;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCActionIntervalDealloc_)
    {
        cocos2d::ActionInterval* action = static_cast<cocos2d::ActionInterval*>(impl_);
        action->release();
    }
    
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(void) hold
{
    isNeedCCActionIntervalDealloc_ = YES;
    
    cocos2d::ActionInterval* action = static_cast<cocos2d::ActionInterval*>(impl_);
    action->retain();
}


+(id) actionWithDuration: (ccTime) d
{
	return [[[self alloc] initWithDuration:d ] autorelease];
}

-(id) initWithDuration: (ccTime) d
{
    NSAssert(NO , @"NO EXPLICIT CTOR IN CPP");
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
    cocos2d::ActionInterval* s = (cocos2d::ActionInterval*)impl_;
    id copy = [[[CCActionInterval alloc] initWithObject: s->clone()] autorelease];
    [copy hold];
    
    return copy;
}

@end

