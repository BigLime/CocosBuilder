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
    BOOL isNeedSceneDealloc_;
}

+(id) node;
-(id) init;
-(id) initWithObject:(void *)object;
@end
