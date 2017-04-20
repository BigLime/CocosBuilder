//
// CCTableView
//
// author ke.huang

#import "CCScrollView.h"

typedef enum {
    TOP_DOWN,
    BOTTOM_UP
}CCVerticalFillOrder;

@interface CCTableView : CCScrollView
{
    BOOL isNeedTableViewDealloc_;
}
-(id) init;

-(id) init: (void*) pThis;

-(id) initWithObject: (void*) object;

-(void*) getImpl;

-(void) dealloc;

-(id)initWithViewSize:(CGSize)size container:(CCNode *)container;

@property (nonatomic, assign) CCVerticalFillOrder verticalDirection;

@end
