//
// CCClippingNode
//
// author ke.huang

#import "CCNode.h"

@interface CCClippingNode : CCNode
{
    BOOL isNeedClippingNodeDealloc_;
}
-(id) init: (void*) pThis;

-(id) initWithObject: (void*) object;

-(void*) getImpl;

-(void) dealloc;
/** The CCNode to use as a stencil to do the clipping.
 The stencil node will be retained.
 This default to nil.
 */
@property (nonatomic, retain) CCNode *stencil;

/** The alpha threshold.
 The content is drawn only where the stencil have pixel with alpha greater than the alphaThreshold.
 Should be a float between 0 and 1.
 This default to 1 (so alpha test is disabled).
 */
@property (nonatomic) GLfloat alphaThreshold;

/** Inverted. If this is set to YES,
 the stencil is inverted, so the content is drawn where the stencil is NOT drawn.
 This default to NO.
 */
@property (nonatomic) BOOL inverted;

/** Creates and initializes a clipping node without a stencil.
 */
+ (id)clippingNode;

/** Creates and initializes a clipping node with an other node as its stencil.
 The stencil node will be retained.
 */
+ (id)clippingNodeWithStencil:(CCNode *)stencil;

/** Initializes a clipping node without a stencil.
 */
- (id)init;

/** Initializes a clipping node with an other node as its stencil.
 The stencil node will be retained, and its parent will be set to this clipping node.
 */
- (id)initWithStencil:(CCNode *)stencil;

@end
