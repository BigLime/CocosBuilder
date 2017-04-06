//
// CCScene Wrapper
//
// author xiaobo.wang
//
// 2017-04-05 15:58:58
//

#import "CCNode.h"

@interface CCScene : CCNode
{
    BOOL isNeedCCSceneDealloc_;
}

-(id) init: (void*) pThis;

@end
