//
// CCNode Wrapper.mm
//
// author xiaobo.wang
//
// 2017-04-05 17:34:57
//

#import "CCNode.h"
#import "CCGrid.h"
#import "2d/CCNode.h"

#if CC_NODE_RENDER_SUBPIXEL
#define RENDER_IN_SUBPIXEL
#else
#define RENDER_IN_SUBPIXEL(__ARGS__) (ceil(__ARGS__))
#endif

#pragma mark - Node

@implementation CCNode

// @synthesize zOrder = _zOrder;
-(void)setZOrder:(NSInteger)zOrder
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setLocalZOrder(zOrder);
}

-(NSInteger)zOrder
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getLocalZOrder();
}

// @synthesize children = _children;
-(void)setChildren:(CCArray *)children
{
    // read noly
}

-(CCArray *)children
{
    // TODO: ccVector to CCArray.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getChildren();
}

// @synthesize visible = _visible;
-(void)setVisible:(BOOL)visible
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setVisible(visible);
}

-(BOOL)visible
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->isVisible(visible);
}

// @synthesize parent = _parent;
-(void)setParent:(CCNode *)parent
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->setParent([parent getImpl]);
}

-(CCNode *)parent
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return [[Node alloc]initWithObject: node->getParent() autorelease];
}

// @synthesize grid = _grid;
-(void)setGrid:(CCGridBase *)grid
{
    // TODO: no implement in 2dx
}

-(CCGridBase *)grid
{
    // TODO: no impl in 2dx.
    return nil;
}

// @synthesize tag = _tag;
-(void)setTag:(NSInteger)tag
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setTag(tag);
}

-(NSInteger)tag
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getTag();
}

// @synthesize vertexZ = _vertexZ;
-(void)setVertexZ:(float)vertexZ
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setPositionZ(tag);
}

-(float)vertexZ
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getPositionZ();
}

// @synthesize isRunning = _isRunning;

-(void)setIsRunning:(BOOL)isRunning
{
    // read only;
}

-(BOOL)isRunning
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->isRunning();
}

// @synthesize userData = _userData, userObject = _userObject;
-(void)setUserData:(void *)userData
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setUserData(data);
}

-(void *)userData
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getUserData();
}

-(void)setUserObject:(id)userObject
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setUserObject((cocos2d::Ref*)userObject);
}

-(id)userObject
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return (id)(node->getUserObject());
}

// @synthesize	shaderProgram = _shaderProgram;
-(void)setShaderProgram:(CCGLProgram *)shaderProgram
{
    //TODO: CCGLPROGRAM --> GLPROGRAM.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setGLProgram(shaderProgram);
}
-(CCGLProgram *)shaderProgram
{
    //TODO: CCGLPROGRAM --> GLPROGRAM.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getGLProgram();
}

// @synthesize orderOfArrival = _orderOfArrival;
-(void)setOrderOfArrival:(NSUInteger)orderOfArrival
{
    //TODO: private in c++
}

-(NSUInteger)orderOfArrival
{
    //TODO: private in c++
    return 0;
}

// @synthesize glServerState = _glServerState;
// DEPRECATED.
-(void)setGlServerState:(ccGLServerState)glServerState
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setGLServerState((int)glServerState);
}
-(ccGLServerState)glServerState
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return (ccGLServerState)node->getGLServerState(glServerState);
}

#pragma mark CCNode - Transform related properties

// @synthesize rotationX = _rotationX, rotationY = _rotationY, scaleX = _scaleX, scaleY = _scaleY;
-(void)setRotationX:(float)rotationX
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setRotationSkewX(rotationX);
}

-(float)rotationX
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getRotationSkewX();
}

-(void)setRotationY:(float)rotationY
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setRotationSkewY(rotationY);
}

-(float)rotationY
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getRotationSkewY();
}

-(void)setScaleX:(float)scaleX
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setScaleX(scaleX);
}

-(float)scaleX
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getScaleX();
}

-(void)setScaleY:(float)scaleY
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setScaleY(scaleY);
}

-(float)scaleY
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getScaleY();
}

// @synthesize position = _position;
-(void)setPosition:(CGPoint)position
{
    //TODO: CGPoint to cocos2d::vec2
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setPosition(position);
}

-(CGPoint)position
{
    //TODO: CGPoint to cocos2d::vec2
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getPosition();
}

// @synthesize anchorPoint = _anchorPoint, anchorPointInPoints = _anchorPointInPoints;
-(void)setAnchorPoint:(CGPoint)anchorPoint
{
    //TODO: CGPoint to cocos2d::vec2
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setAnchorPoint(anchorPoint);
}

-(CGPoint)anchorPoint
{
    //TODO: CGPoint to cocos2d::vec2
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getAnchorPoint();
}

-(void)setAnchorPointInPoints:(CGPoint)anchorPointInPoints
{
    //TODO: read only in 2dx.
}

-(CGPoint)anchorPointInPoints
{
    //TODO: CGPoint to cocos2d::vec2
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getAnchorPointInPoints();
}

// @synthesize contentSize = _contentSize;
-(void)setContentSize:(CGSize)contentSize
{
    // TODO: CONVERT CGSIZE -- cocos2d::Size.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setContentSize(contentSize);
}

-(CGSize)contentSize
{
    // TODO: CONVERT CGSIZE -- cocos2d::Size.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getContentSize();
}

// @synthesize ignoreAnchorPointForPosition = _ignoreAnchorPointForPosition;
-(void)setIgnoreAnchorPointForPosition:(BOOL)ignoreAnchorPointForPosition
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setIgnoreAnchorPointForPosition(ignoreAnchorPointForPosition);
}

-(BOOL)ignoreAnchorPointForPosition
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->isIgnoreAnchorPointForPosition();
}

// @synthesize skewX = _skewX, skewY = _skewY;
-(void)setSkewX:(float)skewX
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setSkewX(skewX);
}

-(float)skewX
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getSkewX();
}

-(void)setSkewY:(float)skewY
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setSkewY(skewY);
}

-(float)skewY
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getSkewY();
}

#pragma mark CCNode - Init & cleanup

+(id) node
{
    return [[[self alloc] init] autorelease];
}

-(id) init
{
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
        impl_ = cocos2d::Node::Create();
        impl_->retain();
        
        isNeedNodeDealloc_  = YES;
    }
    
    self = [super init:self];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedNodeDealloc_  = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedNodeDealloc_)
        impl_->release();
    
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(void)cleanup
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->cleanup();
}

-(NSString *)description
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return [NSString stringWithCString:node->getDescription().c_str() encoding:NSUTF8StringEncoding];
}

#pragma mark Setters
// getters synthesized, setters explicit
-(void) setRotation: (float)newRotation
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setRotation(newRotation);
}

-(float) rotation
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getRotation();
}

-(CGRect)boundingBox
{
    //TODO: convert CGRect to cocos2d::Rect
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getBoundingBox();
}

-(void)setScale:(float)scale
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setScale(scale);
}

-(float)scale
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getscale();
}

#pragma mark CCNode Composition
-(void)setCamera:(CCCamera *)camera
{
    //TODO: read only property.
}

-(CCCamera *)camera
{
    // TODO: DEPCREATED IN cc2dx 3.14.
    return nil;
}

-(CCNode *)getChildByTag:(NSInteger)tag
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return [[CCNode alloc] initWithObject: node->getChildByTag(tag) autorelease];
}

-(void)addChild:(CCNode *)node z:(NSInteger)z tag:(NSInteger)tag
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->addChild([node getImpl], z, tag);
}

-(void)addChild:(CCNode *)node z:(NSInteger)z
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->addChild([node getImpl], z);
}

-(void)addChild:(CCNode *)node
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->addChild([node getImpl]);
}

-(void)removeFromParent
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->removeFromParent();
}

-(void)removeChild:(CCNode *)child
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->removeChild([child getImpl]);
}

-(void)removeChild:(CCNode *)node cleanup:(BOOL)cleanup
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->removeChild([child getImpl], cleanup);
}

-(void)removeChildByTag:(NSInteger)tag
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->removeChildByTag(tag);
}

-(void)removeChildByTag:(NSInteger)tag cleanup:(BOOL)cleanup
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->removeChildByTag(tag);
}

-(void)removeAllChildren
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->removeAllChildren();
}

-(void)removeAllChildrenWithCleanup:(BOOL)cleanup
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->removeAllChildrenWithCleanup(cleanup);
}

-(void)reorderChild:(CCNode *)child z:(NSInteger)zOrder
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->reorderChild([child getImpl], zOrder);
}

-(void)sortAllChildren
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->sortAllChildren();
}

#pragma mark CCNode Draw

-(void)draw
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->draw();
}

-(void)visit
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->visit();
}

#pragma mark CCNode - Transformations
-(void)transformAncestors
{
    // TODO: different transform structure.
}

-(void)transform
{
    // TODO: different transform structure.
}

#pragma mark CCNode SceneManagement
-(void)onEnter
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->onEnter();
}

-(void)onEnterTransitionDidFinish
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->onEnterTransitionDidFinish();
}

-(void)onExit
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->onExit();
}

-(void)onExitTransitionDidStart
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->onExitTransitionDidStart();
}

#pragma mark CCNode Actions

-(void)setActionManager:(CCActionManager *)actionManager
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setActionManager([actionManager getImpl]);
}

-(CCActionManager *)actionManager
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return [[CCActionManager alloc] initWithObject: node->getActionManager() autorelease];
}

-(CCAction *)runAction:(CCAction *)action
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return [[CCAction alloc] initWithObject: node->runAction([action getImpl]) autorelease];
}

-(void)stopAllActions
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->stopAllActions();
}

-(void)stopAction:(CCAction *)action
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->stopAction([action getImpl]);
}

-(void)stopActionByTag:(NSInteger)tag
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->stopActionByTag(tag);
}

-(CCAction *)getActionByTag:(NSInteger)tag
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return [[CCAction alloc] initWithObject:node->getActionByTag(tag) autorelease];
}

-(NSUInteger)numberOfRunningActions
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getNumberOfRunningActions();
}

#pragma mark CCNode - Scheduler

-(void)setScheduler:(CCScheduler *)scheduler
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->setScheduler([scheduler getImpl]);
}

-(CCScheduler *)scheduler
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return [[CCScheduler alloc] initWithObject: node->getScheduler() autorelease];
}

-(void)scheduleUpdate
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->scheduleUpdate();
}

-(void)scheduleUpdateWithPriority:(NSInteger)priority
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->scheduleUpdateWithPriority(priority);
}

-(void)unscheduleUpdate
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->unscheduleUpdate();
}

-(void)schedule:(SEL) selector
{
    // TODO: no selector support.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->schedule(nil);
}

-(void)schedule:(SEL)s interval:(ccTime)interval
{
    // TODO: no selector support.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->schedule(nil, interval);
}

-(void)schedule:(SEL)selector interval:(ccTime)interval repeat:(uint)repeat delay:(ccTime)delay
{
    // TODO: no selector support.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->schedule(nil, interval, repeat, delay);
}

-(void)scheduleOnce:(SEL)selector delay:(ccTime)delay
{
    // TODO: no selector support.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->scheduleOnce(nil, delay);
}

-(void)unschedule:(SEL)selector
{
    // TODO: no selector support.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->unschedule(nil);
}

-(void)unscheduleAllSelectors
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->unscheduleAllCallbacks();
}

- (void) resumeSchedulerAndActions
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->resumeSchedulerAndActions();
}

- (void) pauseSchedulerAndActions
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->pauseSchedulerAndActions();
}

-(void)update:(ccTime)delta
{
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    node->update(delta);
}

#pragma mark CCNode Transform

-(CGAffineTransform)nodeToParentTransform
{
    // TODO: CONVERT CGAfflineTransform -- cocos2d::AfflineTransform.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getNodeToParentAffineTransform();
}

-(CGAffineTransform)parentToNodeTransform
{
    // TODO: CONVERT CGAfflineTransform -- cocos2d::AfflineTransform.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getParentToNodeAffineTransform();
}

-(CGAffineTransform)nodeToWorldTransform
{
    // TODO: CONVERT CGAfflineTransform -- cocos2d::AfflineTransform.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getNodeToWorldAffineTransform();
}

-(CGAffineTransform)worldToNodeTransform
{
    // TODO: CONVERT CGAfflineTransform -- cocos2d::AfflineTransform.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->getWorldToNodeAffineTransform();
}

-(CGPoint)convertToNodeSpace:(CGPoint)worldPoint
{
    // TODO: convert CGPoint to cocos2d::vec2.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->convertToNodeSpace(worldPoint);
}

-(CGPoint)convertToWorldSpace:(CGPoint)nodePoint
{
    // TODO: convert CGPoint to cocos2d::vec2.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->convertToWorldSpace(worldPoint);
}

-(CGPoint)convertToNodeSpaceAR:(CGPoint)worldPoint
{
    // TODO: convert CGPoint to cocos2d::vec2.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->convertToNodeSpaceAR(worldPoint);
}

-(CGPoint)convertToWorldSpaceAR:(CGPoint)nodePoint
{
    // TODO: convert CGPoint to cocos2d::vec2.
    (cocos2d::Node*) node = (cocos2d::Node*)impl_;
    return node->convertToWorldSpaceAR(worldPoint);
}

@end

#pragma mark - NodeRGBA

@implementation CCNodeRGBA

// @synthesize cascadeColorEnabled = _cascadeColorEnabled;
-(void)setCascadeColorEnabled:(BOOL)cascadeColorEnabled
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    node->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL)isCascadeColorEnabled
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    return node->isCascadeColorEnabled();
}

// @synthesize cascadeOpacityEnabled = _cascadeOpacityEnabled;
-(void)setCascadeOpacityEnabled:(BOOL)cascadeOpacityEnabled
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    node->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL)isCascadeOpacityEnabled
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
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
        impl_ = new cocos2d::__NodeRGBA;
        impl_->retain();
        
        isNeedCCNodeRGBADealloc_    = YES;
    }
    
    self = [super init:self];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_                     = object;
    isNeedCCNodeRGBADealloc_  = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedCCNodeRGBADealloc_)
        impl_->release();
    
    [super dealloc];
}


-(GLubyte) opacity
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    return node->getOpacity();
}

-(GLubyte) displayedOpacity
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    return node->getDisplayedOpacity();
}

- (void) setOpacity:(GLubyte)opacity
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    node->setOpacity(opacity);
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    node->updateDisplayedOpacity(parentOpacity);
}

// TODO: convert ccColor3B to cocos2d::Color3B.
-(ccColor3B) color
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    return node->getColor();
}

-(ccColor3B) displayedColor
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    return node->getDisplayedColor();
}

- (void) setColor:(ccColor3B)color
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    node->setColor(color);
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
    (cocos2d::__NodeRGBA*) node = (cocos2d::__NodeRGBA*)impl_;
    node->updateDisplayedColor(parentColor);
}

@end







































