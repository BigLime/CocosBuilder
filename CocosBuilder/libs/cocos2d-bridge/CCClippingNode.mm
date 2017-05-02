//
// CCClippingNode
//
// author ke.huang
#import "CCClippingNode.h"
#import "2d/CCClippingNode.h"
#import "2d/CCLayer.h"
#import "2d/CCDrawNode.h"
#import "ccTypeConvert.h"

@implementation CCClippingNode

- (id) init:(void*) pThis
{
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedClippingNodeDealloc_  = NO;
    }
    else
    {
        cocos2d::ClippingNode* node = cocos2d::ClippingNode::create();
        node->retain();
        
        impl_ = node;
        
        isNeedClippingNodeDealloc_  = YES;
    }
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedClippingNodeDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedClippingNodeDealloc_)
    {
        ((cocos2d::ClippingNode*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(CCNode*)stencil
{
    cocos2d::ClippingNode* node = static_cast<cocos2d::ClippingNode*>(impl_);
    if(node->getStencil())
        return [[[CCNode alloc]initWithObject:node->getStencil()] autorelease];
    else
        return nil;
}

-(void)setStencil:(CCNode *)stencil
{
    cocos2d::ClippingNode* node = static_cast<cocos2d::ClippingNode*>(impl_);
    cocos2d::Node* _stencil = static_cast<cocos2d::Node*>([stencil getImpl]);
    node->setStencil(_stencil);
}

-(GLfloat)alphaThreshold
{
    cocos2d::ClippingNode* node = static_cast<cocos2d::ClippingNode*>(impl_);
    return node->getAlphaThreshold();
}

-(void)setAlphaThreshold:(GLfloat)alphaThreshold
{
    cocos2d::ClippingNode* node = static_cast<cocos2d::ClippingNode*>(impl_);
    node->setAlphaThreshold(alphaThreshold);
}

-(BOOL)inverted
{
    cocos2d::ClippingNode* node = static_cast<cocos2d::ClippingNode*>(impl_);
    return node->isInverted();
}

-(void)setInverted:(BOOL)inverted
{
    cocos2d::ClippingNode* node = static_cast<cocos2d::ClippingNode*>(impl_);
    node->setInverted(inverted);
}

+ (id)clippingNode
{
    return [self node];
}

+ (id)clippingNodeWithStencil:(CCNode *)stencil
{
    return [[[self alloc] initWithStencil:stencil] autorelease];
}

- (id)init
{
    return [self initWithStencil:nil];
}

- (id)initWithStencil:(CCNode *)stencil
{
    cocos2d::Node* _stencil = static_cast<cocos2d::Node*>([stencil getImpl]);
    cocos2d::ClippingNode* node = cocos2d::ClippingNode::create(_stencil);
    node->retain();
    impl_ = node;
    
    isNeedClippingNodeDealloc_ = YES;
    
    self = [super init:impl_];
    return self;
}

@end
