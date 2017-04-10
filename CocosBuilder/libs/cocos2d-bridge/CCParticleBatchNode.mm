//
//  CCParticleBatchNode.m
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import "CCParticleBatchNode.h"
#import "2d/CCParticleBatchNode.h"

@implementation CCParticleBatchNode

-(id)initWithObject: (void*)object
{
    impl_ = object;
    ((cocos2d::ParticleBatchNode*)impl_)->retain();
    isNeedParticleBatchNodeDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

-(void) dealloc
{
    if(isNeedParticleBatchNodeDealloc_)
        ((cocos2d::ParticleBatchNode*)impl_)->release();
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

@end
