//
//  CCParticleBatchNode.h
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import <Foundation/Foundation.h>

@interface CCParticleBatchNode : NSObject
{
    void* impl_;
    BOOL isNeedParticleBatchNodeDealloc_;
}

-(id)initWithObject: (void*)object;

-(void*) getImpl;

@end
