//
// CCLayer Wrapper.mm
//
// author xiaobo.wang
//
// 2017-04-05 20:55:54
//

#import "CCLayer.h"
#import "2d/CCLayer.h"

@implementation CCLayer

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                  = pThis;
        isNeedCCLayerDealloc_  = NO;
    }
    else
    {
        impl_ = cocos2d::CCLayer::create();
        impl_->retain();
        
        isNeedCCLayerDealloc_ = YES;
    }
    
    self = [super init:self];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                 = object;
    isNeedCCLayerDealloc_ = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLayerDealloc_)
        impl_->release();
    
    [super dealloc];
}

-(BOOL) isMouseEnabled
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    return layer->isMouseEnabled;
}

-(void) setMouseEnabled:(BOOL)mouseEnabled
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    layer->setMouseEnabled(mouseEnabled);
}

-(NSInteger) mousePriority
{
    // no implement in cc2dx;
    return 0;
}

-(void) setMousePriority:(NSInteger)mousePriority
{
    // no implement in cc2dx;
}

-(BOOL) isKeyboardEnabled
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    return layer->isKeyboardEnabled;
}

-(void) setKeyboardEnabled:(BOOL)keyboardEnabled
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    layer->setKeyboardEnabled(keyboardEnabled);
}

-(NSInteger) keyboardPriority
{
    // no implement in cc2dx;
    return 0;
}

-(void) setKeyboardPriority:(NSInteger)keyboardPriority
{
    // no implement in cc2dx;
}

-(BOOL) isTouchEnabled
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    return layer->isTouchEnabled;
}

-(void) setTouchEnabled:(BOOL)enabled
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    layer->setTouchEnabled(enabled);
}

-(NSInteger) touchPriority
{
    // no implement in cc2dx;
    return 0;
}
-(void) setTouchPriority:(NSInteger)touchPriority
{
    // no implement in cc2dx;
}

-(BOOL) isGestureEnabled
{
    // no implement in cc2dx;
    return NO;
}

-(void) setGestureEnabled:(BOOL)enabled
{
    // no implement in cc2dx;
}

-(NSInteger) gesturePriority
{
    // no implement in cc2dx;
    return 0;
}

-(void) setGesturePriority:(NSInteger)gesturePriority
{
    // no implement in cc2dx;
}

-(void) onEnter
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    layer->onEnter();
}

-(void) onEnterTransitionDidFinish
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    layer->onEnterTransitionDidFinish();
}

-(void) onExit
{
    cocos2d::CCLayer* layer = (cocos2d::CCLayer*)impl_;
    layer->onExit();
}
@end

#pragma mark - LayerRGBA

@implementation CCLayerRGBA

// @synthesize cascadeColorEnabled     = _cascadeColorEnabled;
// @synthesize cascadeOpacityEnabled   = _cascadeOpacityEnabled;
-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                      = pThis;
        isNeedCCLayerRGBADealloc_  = NO;
    }
    else
    {
        impl_ = cocos2d::__LayerRGBA::create();
        impl_->retain();
        
        isNeedCCLayerRGBADealloc_ = YES;
    }
    
    self = [super init:self];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                     = object;
    isNeedCCLayerRGBADealloc_ = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLayerRGBADealloc_)
        impl_->release();
    
    [super dealloc];
}

// manually getter && setter
-(void) setCascadeColorEnabled: (BOOL)cascadeColorEnabled
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL) isCascadeColorEnabled
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return rgba->isCascadeColorEnabled();
}

-(void) setCascadeOpacityEnabled: (BOOL) cascadeOpacityEnabled
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL) isCascadeOpacityEnabled
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return rgba->isCascadeOpacityEnabled();
}

-(GLubyte) opacity
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return rgba->getOpacity();
}

-(GLubyte) displayedOpacity
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return rgba->getDisplayedOpacity();
}

/** Override synthesized setOpacity to recurse items */
- (void) setOpacity:(GLubyte)opacity
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->setOpacity(opacity);
}

// TODO: convert old ccColor3B to 2dx-3.0's Color3B
-(ccColor3B) color
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return rgba->getColor();
}

-(ccColor3B) displayedColor
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return rgba->getDisplayedColor();
}

- (void) setColor:(ccColor3B)color
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return rgba->setColor(color);
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->updateDisplayedOpacity(parentOpacity);
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->updateDisplayedColor(parentColor);
}
@end

#pragma mark -
#pragma mark LayerColor

@implementation CCLayerColor

// Opacity and RGB color protocol
// @synthesize blendFunc = _blendFunc;
-(id) init: (void) pThis
{
    if (!!pThis)
    {
        impl_                       = pThis;
        isNeedCCLayerColorDealloc_  = NO;
    }
    else
    {
        impl_ = cocos2d::LayerColor::create();
        impl_->retain();
        
        isNeedCCLayerColorDealloc_ = YES;
    }
    
    self = [super init:self];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                      = object;
    isNeedCCLayerColorDealloc_ = NO;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLayerColorDealloc_)
        impl_->release();
    
    [super dealloc];
}

// manually getter && setter
-(void) setBlendFunc: (int) blendFunc
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->setBlendFunc((cocos2d::BlendFunc)blendFunc);
}

-(int) blendFunc
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    return (int) layerColor->getBlendFunc();
}

+ (id) layerWithColor:(ccColor4B)color width:(GLfloat)w  height:(GLfloat) h
{
    return [[[self alloc] initWithColor:color width:w height:h] autorelease];
}

+ (id) layerWithColor:(ccColor4B)color
{
    return [[(CCLayerColor*)[self alloc] initWithColor:color] autorelease];
}

// Designated initializer
- (id) initWithColor:(ccColor4B)color width:(GLfloat)w  height:(GLfloat) h
{
    impl_ = cocos2d::LayerColor::create(color, w, h);
    impl_->retain();
    
    isNeedCCLayerColorDealloc_ = YES;
    
    self = [super init:self];
    return self;
}

- (id) initWithColor:(ccColor4B)color
{
    impl_ = cocos2d::LayerColor::create(color);
    impl_->retain();
    
    isNeedCCLayerColorDealloc_ = YES;
    
    self = [super init:self];
    return self;
}

// override contentSize
-(void) setContentSize: (CGSize) size
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->setContentSize(size);
}

- (void) changeWidth: (GLfloat) w height:(GLfloat) h
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->changeWidth(w, h);
}

-(void) changeWidth: (GLfloat) w
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->changeWidth(w);
}

-(void) changeHeight: (GLfloat) h
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->changeWidth(h);
}

-(void) setColor:(ccColor3B)color
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->setColor(color);
}

-(void) setOpacity: (GLubyte) opacity
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->setOpacity(opacity);
}
@end

#pragma mark -
#pragma mark LayerGradient

@implementation CCLayerGradient

// @synthesize startOpacity    = _startOpacity;
// @synthesize endColor        = _endColor;
// @synthesize endOpacity      = _endOpacity;
// @synthesize vector          = _vector;

// manual setter & getter.
-(GLubyte) startOpacity
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    return impl_->getStartOpacity();
}

-(void) setStartOpacity:(GLubyte)startOpacity
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    impl_->setStartOpacity();
}

-(void) setEndColor:(int)endColor
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    impl_->setEndColor((cocos2d::Color3B*)endColor);
}

-(int) endColor
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    return impl_->getEndColor();
}

-(void) setEndOpacity: (GLubyte)endOpacity
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    impl_->setEndOpacity(endOpacity);
}

-(GLubyte) endOpacity
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    return impl_->getEndOpacity();
}

-(void) setVector:(CGPoint)vector
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    impl_->setVector(vector);
}

-(CGPoint) vector
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    return impl_->getVector();
}

+ (id) layerWithColor: (ccColor4B) start fadingTo: (ccColor4B) end
{
    return [[[self alloc] initWithColor:start fadingTo:end] autorelease];
}

+ (id) layerWithColor: (ccColor4B) start fadingTo: (ccColor4B) end alongVector: (CGPoint) v
{
    return [[[self alloc] initWithColor:start fadingTo:end alongVector:v] autorelease];
}

- (id) init
{
    return [self initWithColor:ccc4(0, 0, 0, 255) fadingTo:ccc4(0, 0, 0, 255)];
}

- (id) initWithColor: (ccColor4B) start fadingTo: (ccColor4B) end
{
    impl_ = cocos2d::CCLayerGradient::create(start, end);
    impl_->retain();
    
    isNeedCCLayerGradientDealloc_ = YES;
    
    return self;
}

- (id) initWithColor: (ccColor4B) start fadingTo: (ccColor4B) end alongVector: (CGPoint) v
{
    impl_ = cocos2d::CCLayerGradient::create(start, end, v);
    impl_->retain();
    
    isNeedDealloc_ = true;
    
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                         = object;
    isNeedCCLayerGradientDealloc_ = NO;
    
    self = [super init:self];
    return self;
}

-(void)dealloc
{
    if (isNeedCCLayerGradientDealloc_)
    {
        impl_->release();
    }
    
    [super dealloc];
}

-(BOOL) compressedInterpolation
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    return impl_->isCompressedInterpolation();
}

-(void) setCompressedInterpolation:(BOOL)compress
{
    (cocos2d::CCLayerGradient*) gradient = (cocos2d::CCLayerGradient*)impl_;
    impl_->setCompressedInterpolation(compress);
}

@end

#pragma mark -
#pragma mark MultiplexLayer

@implementation CCLayerMultiplex
+(id) layerWithArray:(NSArray *)arrayOfLayers
{

}

+(id) layerWithLayers: (CCLayer*) layer, ...
{

}

-(id) initWithArray:(NSArray *)arrayOfLayers
{

}

-(id) initWithLayers: (CCLayer*) layer vaList:(va_list) params
{

}

-(void) dealloc
{
    [super dealloc];
}

-(void) switchTo: (unsigned int) n
{

}

-(void) switchToAndReleaseMe: (unsigned int) n
{

}
@end











































