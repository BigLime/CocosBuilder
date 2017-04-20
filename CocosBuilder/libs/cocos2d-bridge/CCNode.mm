//
// CCNode Wrapper.mm
//
// author xiaobo.wang
//
// 2017-04-05 17:34:57
//

#import "CCNode.h"
#import "CCGrid.h"
#import "CCAction.h"
#import "CCScheduler.h"
#import "CCActionManager.h"

#import "2d/CCNode.h"

#import "support/CCArray.h"
#import "ccTypeConvert.h"

#if CC_NODE_RENDER_SUBPIXEL
#define RENDER_IN_SUBPIXEL
#else
#define RENDER_IN_SUBPIXEL(__ARGS__) (ceil(__ARGS__))
#endif

#pragma mark - Node

@implementation CCNode
@synthesize children = _children;
// @synthesize zOrder = _zOrder;
-(void)setZOrder:(NSInteger)zOrder
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setLocalZOrder(zOrder);
}

-(NSInteger)zOrder
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getLocalZOrder();
}

// @synthesize children = _children;
-(void)setChildren:(CCArray *)children
{
    // read noly
    NSAssert(NO, @"READ ONLY");
}
/*
-(CCArray *)children
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    auto child = node->getChildren();
    
    id result = [CCArray array];
    for (const auto& subChild : child)
    {
        [result addObject:[[[CCNode alloc] initWithObject: subChild] autorelease]];
    }
    
    return result;
}*/

// @synthesize visible = _visible;
-(void)setVisible:(BOOL)visible
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setVisible(visible);
}

-(BOOL)visible
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->isVisible();
}

 @synthesize parent = _parent;
/*-(void)setParent:(CCNode *)parent
{
    _parent = parent;
    //cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    //cocos2d::Node* cppparent = static_cast<cocos2d::Node*>([parent getImpl]);
    
    //return node->setParent(cppparent);
}

-(CCNode *)parent
{
    //cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    //return [[[CCNode alloc] initWithObject: node->getParent()] autorelease];
    return _parent;
}
*/
// @synthesize grid = _grid;
-(void)setGrid:(CCGridBase *)grid
{
    NSAssert(NO, @"no setter.");
}

-(CCGridBase *)grid
{
    NSAssert(NO, @"no getter.");
    return nil;
}

// @synthesize tag = _tag;
-(void)setTag:(NSInteger)tag
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setTag(tag);
}

-(NSInteger)tag
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getTag();
}

// @synthesize vertexZ = _vertexZ;
-(void)setVertexZ:(float)vertexZ
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setPositionZ(vertexZ);
}

-(float)vertexZ
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getPositionZ();
}

// @synthesize isRunning = _isRunning;

-(void)setIsRunning:(BOOL)isRunning
{
    // read only;
    NSAssert(NO, @"no setter.");
}

-(BOOL)isRunning
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->isRunning();
}

// @synthesize userData = _userData, userObject = _userObject;
-(void)setUserData:(void *)userData
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setUserData(userData);
}

-(void *)userData
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getUserData();
}

-(void)setUserObject:(id)userObject
{
    [userObject retain];
    [_userObject release];
    _userObject = userObject;
}

-(id)userObject
{
    return _userObject;
}

// @synthesize	shaderProgram = _shaderProgram;
-(void)setShaderProgram:(CCGLProgram *)shaderProgram
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setGLProgram(static_cast<cocos2d::GLProgram*>([shaderProgram getImpl]));
}
-(CCGLProgram *)shaderProgram
{
    //TODO: CCGLPROGRAM --> GLPROGRAM.
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [[[CCGLProgram alloc] initWithObject: node->getGLProgram()] autorelease];
}

// @synthesize orderOfArrival = _orderOfArrival;
-(void)setOrderOfArrival:(NSUInteger)orderOfArrival
{
    // private in c++
    NSAssert(NO, @"no setter.");
}

-(NSUInteger)orderOfArrival
{
    // private in c++
    NSAssert(NO, @"no getter.");
    return 0;
}

// @synthesize glServerState = _glServerState;
// DEPRECATED.
-(void)setGlServerState:(ccGLServerState)glServerState
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setGLServerState((int)glServerState);
}
-(ccGLServerState)glServerState
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return (ccGLServerState)node->getGLServerState();
}

#pragma mark CCNode - Transform related properties

// @synthesize rotationX = _rotationX, rotationY = _rotationY, scaleX = _scaleX, scaleY = _scaleY;
-(void)setRotationX:(float)rotationX
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setRotationSkewX(rotationX);
}

-(float)rotationX
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getRotationSkewX();
}

-(void)setRotationY:(float)rotationY
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setRotationSkewY(rotationY);
}

-(float)rotationY
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getRotationSkewY();
}

-(void)setScaleX:(float)scaleX
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setScaleX(scaleX);
}

-(float)scaleX
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getScaleX();
}

-(void)setScaleY:(float)scaleY
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setScaleY(scaleY);
}

-(float)scaleY
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getScaleY();
}

// @synthesize position = _position;
-(void)setPosition:(CGPoint)position
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setPosition([ccTypeConvert CGPointToPoint:position]);
}

-(CGPoint)position
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert PointToCGPoint:node->getPosition()];
}

// @synthesize anchorPoint = _anchorPoint, anchorPointInPoints = _anchorPointInPoints;
-(void)setAnchorPoint:(CGPoint)anchorPoint
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setAnchorPoint([ccTypeConvert CGPointToPoint:anchorPoint]);
}

-(CGPoint)anchorPoint
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert PointToCGPoint:node->getAnchorPoint()];
}

-(void)setAnchorPointInPoints:(CGPoint)anchorPointInPoints
{
    //TODO: read only in 2dx.
    NSAssert(NO, @"read only in 2dx.");
}

-(CGPoint)anchorPointInPoints
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert PointToCGPoint:node->getAnchorPointInPoints()];
}

// @synthesize contentSize = _contentSize;
-(void)setContentSize:(CGSize)contentSize
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setContentSize([ccTypeConvert CGSizeToSize:contentSize]);
}

-(CGSize)contentSize
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert SizeToCGSize:node->getContentSize()];
}

// @synthesize ignoreAnchorPointForPosition = _ignoreAnchorPointForPosition;
-(void)setIgnoreAnchorPointForPosition:(BOOL)ignoreAnchorPointForPosition
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setIgnoreAnchorPointForPosition(ignoreAnchorPointForPosition);
}

-(BOOL)ignoreAnchorPointForPosition
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->isIgnoreAnchorPointForPosition();
}

// @synthesize skewX = _skewX, skewY = _skewY;
-(void)setSkewX:(float)skewX
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setSkewX(skewX);
}

-(float)skewX
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getSkewX();
}

-(void)setSkewY:(float)skewY
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setSkewY(skewY);
}

-(float)skewY
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getSkewY();
}

#pragma mark CCNode - Init & cleanup

+(id) node
{
    return [[[self alloc] init] autorelease];
}

-(id) init
{
    _children = nil;
    _parent = nil;
    return [self init: nil];
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_               = pThis;
        isNeedNodeDealloc_  = NO;
    }
    else
    {
        cocos2d::Node* node = cocos2d::Node::create();
        node->retain();
        
        isNeedNodeDealloc_  = YES;
        impl_ = node;
    }
    
    // no super class.
    // self = [super init:impl_];
    self = [super init];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedNodeDealloc_  = YES;
    
    // no super class.
    // self = [super init:impl_];
    self = [super init];
    return self;
}

-(void) dealloc
{
    if (isNeedNodeDealloc_)
    {
        cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
        node->release();
    }
    // children
    [_children release];
    [_userObject release];
    
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(void)cleanup
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->cleanup();
    [_children makeObjectsPerformSelector:@selector(cleanup)];
}

-(NSString *)description
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [NSString stringWithCString:node->getDescription().c_str() encoding:NSUTF8StringEncoding];
}

#pragma mark Setters
// getters synthesized, setters explicit
-(void) setRotation: (float)newRotation
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setRotation(newRotation);
}

-(float) rotation
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getRotation();
}

-(CGRect)boundingBox
{
    //TODO: convert CGRect to cocos2d::Rect
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert RectToCGRect: node->getBoundingBox()];
}

-(void)setScale:(float)scale
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->setScale(scale);
}

-(float)scale
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getScale();
}

#pragma mark CCNode Composition
-(void)setCamera:(CCCamera *)camera
{
    //TODO: read only property.
    NSAssert(NO, @"no setter");
}

-(CCCamera *)camera
{
    // TODO: DEPCREATED IN cc2dx 3.14.
    NSAssert(NO, @"DEPCREATED IN cc2dx 3.14.");
    return nil;
}

-(CCNode *)getChildByTag:(NSInteger)tag
{
    //cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    //return [[[CCNode alloc] initWithObject: node->getChildByTag(tag)] autorelease];
    CCNode *node;
    CCARRAY_FOREACH(_children, node){
        if( node.tag == tag )
            return node;
    }
    
    return nil;
}

-(void) insertChild:(CCNode*)child
{
    if( ! _children )
    {
        _children = [[CCArray alloc] initWithCapacity:4];
    }
    [child setParent: self];
    ccArrayAppendObjectWithResize(_children->data, child);
}

-(void)addChild:(CCNode *)inp z:(NSInteger)z tag:(NSInteger)tag
{
    [self insertChild:inp];
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Node* inP = static_cast<cocos2d::Node*>([inp getImpl]);
    node->addChild(inP, z, tag);
}

-(void)addChild:(CCNode *)inp z:(NSInteger)z
{
    [self insertChild:inp];
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Node* inP = static_cast<cocos2d::Node*>([inp getImpl]);
    node->addChild(inP, z);
}

-(void)addChild:(CCNode *)inp
{
   [self insertChild:inp];
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Node* inP = static_cast<cocos2d::Node*>([inp getImpl]);
    node->addChild(inP);
}

-(void)removeFromParent
{
    [self removeFromParentAndCleanup:YES];
}

-(void)removeFromParentAndCleanup:(BOOL)cleanup
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->removeFromParentAndCleanup(cleanup);
    [_parent removeChild:self cleanup:cleanup];
}

-(void)removeChild:(CCNode *)child
{
    [self removeChild:child cleanup:YES];
}

-(void)removeChild:(CCNode *)child cleanup:(BOOL)cleanup
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Node* inP = static_cast<cocos2d::Node*>([child getImpl]);
    node->removeChild(inP, cleanup);
    if ( [_children containsObject:child] )
        [_children removeObject:child];
}

-(void)removeChildByTag:(NSInteger)tag
{
    //cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    //node->removeChildByTag(tag);
    [self removeChildByTag:tag cleanup:YES];
}

-(void)removeChildByTag:(NSInteger)tag cleanup:(BOOL)cleanup
{
    CCNode *child = [self getChildByTag:tag];
    if (child == nil)
        CCLOG("cocos2d: removeChildByTag: child not found!");
    else
        [self removeChild:child cleanup:cleanup];
    //cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    //node->removeChildByTag(tag);
}

-(void)removeAllChildren
{
    [self removeAllChildrenWithCleanup:YES];
}

-(void)removeAllChildrenWithCleanup:(BOOL)cleanup
{
    [_children removeAllObjects];
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->removeAllChildrenWithCleanup(cleanup);
}

-(void)reorderChild:(CCNode *)child z:(NSInteger)zOrder
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Node* inP = static_cast<cocos2d::Node*>([child getImpl]);
    node->reorderChild(inP, zOrder);
}

-(void)sortAllChildren
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->sortAllChildren();
}

#pragma mark CCNode Draw

-(void)draw
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->draw();
}

-(void)visit
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->visit();
}

#pragma mark CCNode - Transformations
-(void)transformAncestors
{
    // TODO: different transform structure.
    NSAssert(NO, @"different in cpp");
}

-(void)transform
{
    // TODO: different transform structure.
}

#pragma mark CCNode SceneManagement
-(void)onEnter
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->onEnter();
}

-(void)onEnterTransitionDidFinish
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->onEnterTransitionDidFinish();
}

-(void)onExit
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->onExit();
}

-(void)onExitTransitionDidStart
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->onExitTransitionDidStart();
}

#pragma mark CCNode Actions

-(void)setActionManager:(CCActionManager *)actionManager
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::ActionManager* mgr = static_cast<cocos2d::ActionManager*>([actionManager getImpl]);
    node->setActionManager(mgr);
}

-(CCActionManager *)actionManager
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [[[CCActionManager alloc] initWithObject: node->getActionManager()] autorelease];
}

-(CCAction *)runAction:(CCAction *)action
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Action* cppAction = static_cast<cocos2d::Action*>([action getImpl]);
    return [[[CCAction alloc] initWithObject: node->runAction(cppAction)] autorelease];
}

-(void)stopAllActions
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->stopAllActions();
}

-(void)stopAction:(CCAction *)action
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Action* cppAction = static_cast<cocos2d::Action*>([action getImpl]);
    node->stopAction(cppAction);
}

-(void)stopActionByTag:(NSInteger)tag
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->stopActionByTag(tag);
}

-(CCAction *)getActionByTag:(NSInteger)tag
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [[[CCAction alloc] initWithObject:node->getActionByTag(tag)] autorelease];
}

-(NSUInteger)numberOfRunningActions
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return node->getNumberOfRunningActions();
}

#pragma mark CCNode - Scheduler

-(void)setScheduler:(CCScheduler *)scheduler
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    cocos2d::Scheduler* cppScheduler = static_cast<cocos2d::Scheduler*>([scheduler getImpl]);
    node->setScheduler(cppScheduler);
}

-(CCScheduler *)scheduler
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [[[CCScheduler alloc] initWithObject: node->getScheduler()] autorelease];
}

-(void)scheduleUpdate
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->scheduleUpdate();
}

-(void)scheduleUpdateWithPriority:(NSInteger)priority
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->scheduleUpdateWithPriority(priority);
}

-(void)unscheduleUpdate
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->unscheduleUpdate();
}

-(void)schedule:(SEL) selector
{
//    __block id t = self;
//    [self scheduleWithBlock:^(float inParam)
//    {
//        [t performSelector:selector withObject:self afterDelay:inParam];
//    }];
    const auto callBack = [=](float inParam) { [self performSelector:selector withObject:self afterDelay:inParam]; };
    NSString* key = @"selector";
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->schedule(callBack, [key UTF8String]);
}

-(void)scheduleWithBlock: (void (^)(float)) block
{
    NSString* key = (NSString *)self;
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->schedule([block](float inParam) { block(inParam); }, [key UTF8String]);
}

-(void)schedule:(SEL)selector interval:(ccTime)interval
{
    __block id t = self;
    [self scheduleWithBlock:^(float inParam)
     {
         [t performSelector:selector withObject:self afterDelay:inParam];
     } interval:interval];
}

-(void)scheduleWithBlock:(void (^)(float)) block interval:(ccTime)seconds
{
    NSString* key = (NSString *)self;
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->schedule([block](float inParam) { block(inParam); }, seconds, [key UTF8String]);
}

-(void)schedule:(SEL)selector interval:(ccTime)interval repeat:(uint)repeat delay:(ccTime)delay
{
    __block id t = self;
    [self scheduleWithBlock:^(float inParam)
     {
         [t performSelector:selector withObject:self afterDelay:inParam];
     } interval:interval repeat:repeat delay:delay];
}

-(void)scheduleWithBlock:(void (^)(float)) block interval:(ccTime)interval repeat:(uint)repeat delay:(ccTime)delay
{
    NSString* key = (NSString *)self;
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->schedule([block](float inParam) { block(inParam); }, interval, repeat, delay, [key UTF8String]);
}

-(void)scheduleOnce:(SEL)selector delay:(ccTime)delay
{
    __block id t = self;
    [self scheduleOnceWithBlock:^(float inParam)
     {
         [t performSelector:selector withObject:self afterDelay:inParam];
     } delay:delay];
}

-(void)scheduleOnceWithBlock: (void (^)(float)) block delay:(ccTime)delay
{
    NSString* key = (NSString *)self;
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->scheduleOnce([block](float inParam) { block(inParam); }, delay, [key UTF8String]);
}

-(void)unschedule:(SEL)selector
{
    // TODO: no selector support.
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->unschedule(nil);
}

-(void)unscheduleAllSelectors
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->unscheduleAllCallbacks();
}

- (void) resumeSchedulerAndActions
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->resumeSchedulerAndActions();
}

- (void) pauseSchedulerAndActions
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->pauseSchedulerAndActions();
}

-(void)update:(ccTime)delta
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    node->update(delta);
}

#pragma mark CCNode Transform

-(CGAffineTransform)nodeToParentTransform
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert AffineTransformToCGAffineTransform: node->getNodeToParentAffineTransform()];
}

-(CGAffineTransform)parentToNodeTransform
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert AffineTransformToCGAffineTransform: node->getParentToNodeAffineTransform()];
}

-(CGAffineTransform)nodeToWorldTransform
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert AffineTransformToCGAffineTransform: node->getNodeToWorldAffineTransform()];
}

-(CGAffineTransform)worldToNodeTransform
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert AffineTransformToCGAffineTransform: node->getWorldToNodeAffineTransform()];
}

-(CGPoint)convertToNodeSpace:(CGPoint)worldPoint
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert PointToCGPoint: node->convertToNodeSpace([ccTypeConvert CGPointToPoint: worldPoint])];
}

-(CGPoint)convertToWorldSpace:(CGPoint)nodePoint
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert PointToCGPoint: node->convertToWorldSpace([ccTypeConvert CGPointToPoint: nodePoint])];
}

-(CGPoint)convertToNodeSpaceAR:(CGPoint)worldPoint
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert PointToCGPoint: node->convertToNodeSpaceAR([ccTypeConvert CGPointToPoint: worldPoint])];
}

-(CGPoint)convertToWorldSpaceAR:(CGPoint)nodePoint
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>(impl_);
    return [ccTypeConvert PointToCGPoint: node->convertToWorldSpaceAR([ccTypeConvert CGPointToPoint: nodePoint])];
}

@end

#pragma mark - NodeRGBA

@implementation CCNodeRGBA

// @synthesize cascadeColorEnabled = _cascadeColorEnabled;
-(void)setCascadeColorEnabled:(BOOL)cascadeColorEnabled
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    node->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL)isCascadeColorEnabled
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    return node->isCascadeColorEnabled();
}

// @synthesize cascadeOpacityEnabled = _cascadeOpacityEnabled;
-(void)setCascadeOpacityEnabled:(BOOL)cascadeOpacityEnabled
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    node->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL)isCascadeOpacityEnabled
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    return node->isCascadeOpacityEnabled();
}

-(id) init
{
    return [self init: nil];
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                       = pThis;
        isNeedCCNodeRGBADealloc_    = NO;
    }
    else
    {
        cocos2d::__NodeRGBA* rgba = new cocos2d::__NodeRGBA;
        rgba->autorelease();
        rgba->retain();
        
        isNeedCCNodeRGBADealloc_    = YES;
        impl_ = rgba;
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_                     = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCNodeRGBADealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCNodeRGBADealloc_)
    {
        cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
        node->release();
    }
    
    [super dealloc];
}


-(GLubyte) opacity
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    return node->getOpacity();
}

-(GLubyte) displayedOpacity
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    return node->getDisplayedOpacity();
}

- (void) setOpacity:(GLubyte)opacity
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    node->setOpacity(opacity);
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    node->updateDisplayedOpacity(parentOpacity);
}

// TODO: convert ccColor3B to cocos2d::Color3B.
-(ccColor3B) color
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: node->getColor()];
}

-(ccColor3B) displayedColor
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: node->getDisplayedColor()];
}

- (void) setColor:(ccColor3B)color
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    node->setColor([ccTypeConvert ccColor3BToColor3B: color]);
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
    cocos2d::__NodeRGBA* node = static_cast<cocos2d::__NodeRGBA*>(impl_);
    node->updateDisplayedColor([ccTypeConvert ccColor3BToColor3B: parentColor]);
}

@end







































