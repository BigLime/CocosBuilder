//
//  CCActionManager.m
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import "CCActionManager.h"
#import "2d/CCActionManager.h"

@implementation CCActionManager

-(id)initWithObject: (void*)object
{
    impl_ = object;
    ((cocos2d::ActionManager*)impl_)->retain();
    isNeedActionManagerDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

-(void) dealloc
{
    if(isNeedActionManagerDealloc_)
        ((cocos2d::ActionManager*)impl_)->release();
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

@end
