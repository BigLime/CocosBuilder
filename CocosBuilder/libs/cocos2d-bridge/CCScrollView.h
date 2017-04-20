//
// CCScrollView
//
// author ke.huang

#import "CCLayer.h"
typedef enum {
    CCScrollViewDirectionHorizontal,
    CCScrollViewDirectionVertical,
    CCScrollViewDirectionBoth
} CCScrollViewDirection;

@interface CCScrollViewDelegate : NSObject
{
    void* impl_;
    BOOL isNeedScrollViewDelegateDealloc_;
}

-(id) init: (void*) pThis;

-(id) initWithObject: (void*) object;

-(void*) getImpl;

-(void) dealloc;

@end

@interface CCScrollView: CCLayer
{
    BOOL isNeedScrollViewDealloc_;
}
-(id) init: (void*) pThis;

-(id) initWithObject: (void*) object;

-(void*) getImpl;

-(void) dealloc;
/**
 * current zoom scale
 */
@property (nonatomic, assign) CGFloat zoomScale;
/**
 * min zoom scale
 */
@property (nonatomic, assign) CGFloat minZoomScale;
/**
 * max zoom scale
 */
@property (nonatomic, assign) CGFloat maxZoomScale;
/**
 * scroll view delegate
 */
@property (nonatomic, assign) CCScrollViewDelegate* delegate;
/**
 * If YES, the view is being dragged.
 */
@property (nonatomic, assign, readonly) BOOL isDragging;
/**
 * Determines whether the scroll view is allowed to bounce or not.
 */
@property (nonatomic, assign) BOOL bounces;
/**
 * direction allowed to scroll. CCScrollViewDirectionBoth by default.
 */
@property (nonatomic, assign) CCScrollViewDirection direction;
/**
 * If YES, it clips its children to the visible bounds (view size)
 * it is YES by default.
 */
@property (nonatomic, assign) BOOL clipsToBounds;
/**
 * Content offset. Note that left-bottom point is the origin
 */
@property (nonatomic, assign) CGPoint contentOffset;
/**
 * Sets the scrollable container object of the scroll view
 */
@property (nonatomic, retain) CCNode* container;
/**
 * container is a protected property
 */
@property (nonatomic, retain) CCNode  *container_;
/**
 * initial touch point
 */
@property (nonatomic, assign) CGPoint touchPoint_;
/**
 * determines whether touch is moved after begin phase
 */
@property (nonatomic, assign) BOOL    touchMoved_;
/**
 * ScrollView size which is different from contentSize. This size determines visible
 * bounding box.
 */
@property (nonatomic, assign, setter=setViewSize:) CGSize viewSize;
/**
 * Returns an autoreleased scroll view object.
 *
 * @param size view size
 * @return autoreleased scroll view object
 */
+(id)viewWithViewSize:(CGSize)size;
/**
 * Returns a scroll view object
 *
 * @param size view size
 * @return scroll view object
 */
-(id)initWithViewSize:(CGSize)size;
/**
 * Returns an autoreleased scroll view object.
 *
 * @param size view size
 * @param container parent object
 * @return autoreleased scroll view object
 */
+(id)viewWithViewSize:(CGSize)size container:(CCNode *)container;
/**
 * Returns a scroll view object
 *
 * @param size view size
 * @param container parent object
 * @return scroll view object
 */
-(id)initWithViewSize:(CGSize)size container:(CCNode *)container;
/**
 * Sets a new content offset. It ignores max/min offset. It just sets what's given. (just like UIKit's UIScrollView)
 *
 * @param offset new offset
 * @param If YES, the view scrolls to the new offset
 */
-(void)setContentOffset:(CGPoint)offset animated:(BOOL)animated;
/**
 * Sets a new content offset. It ignores max/min offset. It just sets what's given. (just like UIKit's UIScrollView)
 * You can override the animation duration with this method.
 *
 * @param offset new offset
 * @param animation duration
 */
-(void)setContentOffset:(CGPoint)offset animatedInDuration:(ccTime)dt;
/**
 * Sets a new scale and does that for a predefined duration.
 *
 * @param s a new scale vale
 * @param animated if YES, scaling is animated
 */
-(void)setZoomScale:(float)s animated:(BOOL)animated;
/**
 * Sets a new scale for container in a given duration.
 *
 * @param s a new scale value
 * @param animation duration
 */
-(void)setZoomScale:(float)s animatedInDuration:(ccTime)dt;
/**
 * Returns the current container's minimum offset. You may want this while you animate scrolling by yourself
 */
-(CGPoint)minContainerOffset;
/**
 * Returns the current container's maximum offset. You may want this while you animate scrolling by yourself
 */
-(CGPoint)maxContainerOffset;
/**
 * Determines if a given node's bounding box is in visible bounds
 *
 * @return YES if it is in visible bounds
 */
-(BOOL)isNodeVisible:(CCNode *)node;
/**
 * Provided to make scroll view compatible with SWLayer's pause method
 */
-(void)pause:(id)sender;
/**
 * Provided to make scroll view compatible with SWLayer's resume method
 */
-(void)resume:(id)sender;

@end
