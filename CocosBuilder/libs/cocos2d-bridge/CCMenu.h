//
// CCMenu wrapper
//
// author xiaobo.wang
//
// 2017-04-07 14:10:24
//

#import "CCMenuItem.h"
#import "CCLayer.h"

typedef enum
{
    kCCMenuStateWaiting,
    kCCMenuStateTrackingTouch
} tCCMenuState;

enum
{
    //* priority used by the menu for the event handler
    kCCMenuHandlerPriority = -128,
};

/** A CCMenu
 *
 * Features and Limitation:
 *  - You can add MenuItem objects in runtime using addChild:
 *  - But the only accecpted children are MenuItem objects
 */
@interface CCMenu : CCLayerRGBA
{
    BOOL isNeedCCMenuDealloc_;
}

/** whether or not the menu will receive events */
@property (nonatomic, readwrite) BOOL enabled;

/** creates a CCMenu with CCMenuItem objects */
+ (id) menuWithItems: (CCMenuItem*) item, ... NS_REQUIRES_NIL_TERMINATION;

/** creates a CCMenu with CCMenuItem objects */
+ (id) menuWithItems: (CCMenuItem*) firstItem vaList: (va_list) args;

/** creates a CCMenu with a NSArray of CCMenuItem objects */
+ (id) menuWithArray:(NSArray*)arrayOfItems;

/** initializes a CCMenu with a NSArray of CCMenuItem objects */
- (id) initWithArray:(NSArray*)arrayOfItems;

/** align items vertically */
-(void) alignItemsVertically;

/** align items vertically with padding
 @since v0.7.2
 */
-(void) alignItemsVerticallyWithPadding:(float) padding;

/** align items horizontally */
-(void) alignItemsHorizontally;

/** align items horizontally with padding
 @since v0.7.2
 */
-(void) alignItemsHorizontallyWithPadding: (float) padding;

/** align items in rows of columns */
-(void) alignItemsInColumns: (NSNumber *) columns, ... NS_REQUIRES_NIL_TERMINATION;
-(void) alignItemsInColumns: (NSNumber *) columns vaList: (va_list) args;
-(void) alignItemsInColumnsWithArray:(NSArray*) arrayOfNumbers;

/** align items in columns of rows */
-(void) alignItemsInRows: (NSNumber *) rows, ... NS_REQUIRES_NIL_TERMINATION;
-(void) alignItemsInRows: (NSNumber *) rows vaList: (va_list) args;
-(void) alignItemsInRowsWithArray: (NSArray*) arrayOfNumbers;

/** set event handler priority. By default it is: kCCMenuTouchPriority */
-(void) setHandlerPriority:(NSInteger)newPriority;

@end
