//
// CCScrollView
//
// author ke.huang

#import "CCScrollView.h"
#import "extensions/GUI/CCScrollView/CCScrollView.h"
#import "ccTypeConvert.h"

@implementation CCScrollViewDelegate
- (id) init:(void*) pThis
{
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedScrollViewDelegateDealloc_  = NO;
    }
    else
    {
        cocos2d::extension::ScrollViewDelegate* scrollViewDelegate = new cocos2d::extension::ScrollViewDelegate();
        
        impl_ = scrollViewDelegate;
        
        isNeedScrollViewDelegateDealloc_  = YES;
    }
    self = [super init];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedScrollViewDelegateDealloc_  = YES;
    
    self = [super init];
    return self;
}

-(void) dealloc
{
    if (isNeedScrollViewDelegateDealloc_)
    {
        delete ((cocos2d::extension::ScrollViewDelegate*)impl_);
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

@end

@implementation CCScrollView

-(id)init
{
    return [self initWithViewSize:CGSizeMake(200, 200) container:nil];
}

- (id) init:(void*) pThis
{
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedScrollViewDealloc_  = NO;
    }
    else
    {
        cocos2d::extension::ScrollView* scrollView = cocos2d::extension::ScrollView::create();
        scrollView->retain();
        
        impl_ = scrollView;
        
        isNeedScrollViewDealloc_  = YES;
    }
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedScrollViewDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedScrollViewDealloc_)
    {
        ((cocos2d::extension::ScrollView*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(CGFloat)zoomScale
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return scrollView->getZoomScale();
}

-(void)setZoomScale:(CGFloat)zoomScale
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setZoomScale(zoomScale);
}

-(CGFloat)minZoomScale
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return scrollView->getZoomScale();
}

-(void)setMinZoomScale:(CGFloat)minZoomScale
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setMinScale(minZoomScale);
}

-(CGFloat)maxZoomScale
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return scrollView->getZoomScale();
}

-(void)setMaxZoomScale:(CGFloat)maxZoomScale
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setMaxScale(maxZoomScale);
}

-(CCScrollViewDelegate*)delegate
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return [[[CCScrollViewDelegate alloc]initWithObject:scrollView->getDelegate()] autorelease];
}

-(void)setDelegate:(CCScrollViewDelegate *)delegate
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setDelegate(static_cast<cocos2d::extension::ScrollViewDelegate*>([delegate getImpl]));
}

-(BOOL)isDragging
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return scrollView->isDragging();
}

-(BOOL)bounces
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return scrollView->isBounceable();

}

-(void)setBounces:(BOOL)bounces
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setBounceable(bounces);
}

-(CCScrollViewDirection)direction
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return CCScrollViewDirection(scrollView->getDirection());
}

-(void)setDirection:(CCScrollViewDirection)direction
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setDirection(cocos2d::extension::ScrollView::Direction(direction));
}

-(CGSize)viewSize
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return [ccTypeConvert SizeToCGSize:scrollView->getViewSize()];
}

-(void)setViewSize:(CGSize)viewSize
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setViewSize([ccTypeConvert CGSizeToSize:viewSize]);
}

-(CGPoint)touchPoint_
{
    //cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return CGPointMake(0, 0);
}

-(void)setTouchPoint_:(CGPoint)touchPoint
{
    //cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    
}

-(BOOL)touchMoved_
{
    return NO;
}

-(void)setTouchMoved_:(BOOL)touchMoved_
{
    
}

-(CCNode*)container_
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    cocos2d::Node* node = scrollView->getContainer();
    return [[[CCNode alloc]initWithObject:node] autorelease];
}

-(void)setContainer_:(CCNode *)container_
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    cocos2d::Node* node = static_cast<cocos2d::Node*>([container_ getImpl]);
    scrollView->setContainer(node);
}
-(BOOL)clipsToBounds
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return scrollView->isClippingToBounds();
}

-(void)setClipsToBounds:(BOOL)clipsToBounds
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setClippingToBounds(clipsToBounds);
}

-(CGPoint)contentOffset
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return [ccTypeConvert PointToCGPoint:scrollView->getContentOffset()];
}

-(void)setContentOffset:(CGPoint)contentOffset
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setContentOffset([ccTypeConvert CGPointToPoint:contentOffset]);
}

-(CCNode*)container
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    cocos2d::Node* node = scrollView->getContainer();
    return [[[CCNode alloc]initWithObject:node] autorelease];
}

-(void)setContainer:(CCNode *)container
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    cocos2d::Node* node = static_cast<cocos2d::Node*>([container getImpl]);
    scrollView->setContainer(node);
}

+(id)viewWithViewSize:(CGSize)size
{
    return [[[self alloc] initWithViewSize:size] autorelease];
}

-(id)initWithViewSize:(CGSize)size
{
     return [self initWithViewSize:size container:nil];
}

+(id)viewWithViewSize:(CGSize)size container:(CCNode *)container
{
    return [[[self alloc] initWithViewSize:size container:container] autorelease];
}

-(id)initWithViewSize:(CGSize)size container:(CCNode *)container
{
    cocos2d::extension::ScrollView* scrollView = cocos2d::extension::ScrollView::create([ccTypeConvert CGSizeToSize:size],static_cast<cocos2d::Node*>([container getImpl]));
    scrollView->retain();
    impl_ = scrollView;
    
    isNeedScrollViewDealloc_ = YES;
    
    self = [super init:impl_];
    return self;
}

-(void)setContentOffset:(CGPoint)offset animated:(BOOL)animated
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setContentOffset([ccTypeConvert CGPointToPoint:offset],animated);
}

-(void)setContentOffset:(CGPoint)offset animatedInDuration:(ccTime)dt
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setContentOffsetInDuration([ccTypeConvert CGPointToPoint:offset], dt);
}

-(void)setZoomScale:(float)s animated:(BOOL)animated
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setZoomScale(s, animated);
}

-(void)setZoomScale:(float)s animatedInDuration:(ccTime)dt
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->setZoomScale(s, dt);
}

-(CGPoint)minContainerOffset
{
    CGSize viewSize = [self viewSize];
    CCNode* container = [self container_];
    return CGPointMake(viewSize.width - container.contentSize.width*container.scaleX,
               viewSize.height - container.contentSize.height*container.scaleY);
}

-(CGPoint)maxContainerOffset;
{
    return CGPointMake(0.0f, 0.0f);
}

-(BOOL)isNodeVisible:(CCNode *)node
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    return scrollView->isNodeVisible(static_cast<cocos2d::Node*>([node getImpl]));
}

-(void)pause:(id)sender
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->pause();
}

-(void)resume:(id)sender
{
    cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    scrollView->resume();
}

-(void)relocateContainer:(BOOL)animated
{
    //c++ method is protected
    //cocos2d::extension::ScrollView* scrollView = static_cast<cocos2d::extension::ScrollView*>(impl_);
    //scrollView->relocateContainer(animated);
}
@end
