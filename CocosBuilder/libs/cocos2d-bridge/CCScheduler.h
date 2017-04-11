//
// CCScheduler
//
// author ke.huang 17/4/10

#import "ccTypes.h"


@interface CCTimer : NSObject
{
    void* impl_;
    BOOL isNeedSTimerDealloc_;
}

-(id)initWithObject: (void*)object;

-(void*) getImpl;
/** interval in seconds */
//@property (nonatomic,readwrite,assign) ccTime interval;


/** triggers the timer */
//-(void) update: (ccTime) dt;


@end

@interface CCTimerTargetSelector : CCTimer
{
    BOOL isNeeddTimerTargetDealloc_;
}
-(id)initWithObject: (void*)object;

-(void*) getImpl;
@end

@interface CCTimerBlock : CCTimer
{
    BOOL isNeeddTimerBlockDealloc_;
}
-(id)initWithObject: (void*)object;

-(void*) getImpl;
@end

@interface CCScheduler : NSObject
{
    void* impl_;
    BOOL isNeedSchedulerDealloc_;
}
-(id)initWithObject: (void*)object;

-(void*) getImpl;
@end
