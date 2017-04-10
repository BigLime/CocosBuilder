//
//  CCActionManager.h
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import <Foundation/Foundation.h>

@interface CCActionManager : NSObject
{
    void* impl_;
    BOOL isNeedActionManagerDealloc_;
}

-(id)initWithObject: (void*)object;

-(void*) getImpl;

@end
