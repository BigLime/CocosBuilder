//
// CCLayer Wrapper.mm
//
// author xiaobo.wang
//
// 2017-04-05 20:55:54
//

#import "CCLayer.h"
#import "2d/CCLayer.h"
#import "ccTypeConvert.h"

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
        cocos2d::Layer* layer = cocos2d::Layer::create();
        layer->retain();
        
        isNeedCCLayerDealloc_ = YES;
        impl_ = layer;
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                 = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCLayerDealloc_ = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLayerDealloc_)
    {
        cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
        layer->release();
    }
    
    [super dealloc];
}

-(BOOL) isMouseEnabled
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    (void)layer;
    
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
    return NO;
    // return layer->isMouseEnabled();
}

-(void) setMouseEnabled:(BOOL)mouseEnabled
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    (void)layer;
    
    // TODO: no implemnt in cpp.
//    NSAssert(NO, @"no implemnt in cpp.");
    // layer->setMouseEnabled(mouseEnabled);
}

-(NSInteger) mousePriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
    return 0;
}

-(void) setMousePriority:(NSInteger)mousePriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
}

-(BOOL) isKeyboardEnabled
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    return layer->isKeyboardEnabled();
}

-(void) setKeyboardEnabled:(BOOL)keyboardEnabled
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    layer->setKeyboardEnabled(keyboardEnabled);
}

-(NSInteger) keyboardPriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
    return 0;
}

-(void) setKeyboardPriority:(NSInteger)keyboardPriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
}

-(BOOL) isTouchEnabled
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    return layer->isTouchEnabled();
}

-(void) setTouchEnabled:(BOOL)enabled
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    layer->setTouchEnabled(enabled);
}

-(NSInteger) touchPriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
    return 0;
}
-(void) setTouchPriority:(NSInteger)touchPriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
}

-(BOOL) isGestureEnabled
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
    return NO;
}

-(void) setGestureEnabled:(BOOL)enabled
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
}

-(NSInteger) gesturePriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
    return 0;
}

-(void) setGesturePriority:(NSInteger)gesturePriority
{
    // TODO: no implemnt in cpp.
    NSAssert(NO, @"no implemnt in cpp.");
}

-(void) onEnter
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    layer->onEnter();
}

-(void) onEnterTransitionDidFinish
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
    layer->onEnterTransitionDidFinish();
}

-(void) onExit
{
    cocos2d::Layer* layer = static_cast<cocos2d::Layer*>(impl_);
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
        cocos2d::__LayerRGBA* layer = cocos2d::__LayerRGBA::create();
        layer->retain();
        
        isNeedCCLayerRGBADealloc_ = YES;
        impl_ = layer;
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                     = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCLayerRGBADealloc_ = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLayerRGBADealloc_)
    {
        cocos2d::__LayerRGBA* layer = static_cast<cocos2d::__LayerRGBA*>(impl_);
        layer->release();
    }
    
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
    return [ccTypeConvert Color3BToccColor3B:rgba->getColor()];
}

-(ccColor3B) displayedColor
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    return [ccTypeConvert Color3BToccColor3B:rgba->getDisplayedColor()];
}

- (void) setColor:(ccColor3B)color
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->setColor([ccTypeConvert ccColor3BToColor3B:color]);
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->updateDisplayedOpacity(parentOpacity);
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
    cocos2d::__LayerRGBA* rgba = (cocos2d::__LayerRGBA*)impl_;
    rgba->updateDisplayedColor([ccTypeConvert ccColor3BToColor3B:parentColor]);
}
@end

#pragma mark -
#pragma mark LayerColor

@implementation CCLayerColor

// Opacity and RGB color protocol
// @synthesize blendFunc = _blendFunc;
-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                       = pThis;
        isNeedCCLayerColorDealloc_  = NO;
    }
    else
    {
        cocos2d::LayerColor* layer = cocos2d::LayerColor::create();
        layer->retain();
        
        isNeedCCLayerColorDealloc_ = YES;
        impl_ = layer;
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                      = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCLayerColorDealloc_ = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLayerColorDealloc_)
    {
        cocos2d::LayerColor* layer = static_cast<cocos2d::LayerColor*>(impl_);
        layer->release();
    }
    [super dealloc];
}

// manually getter && setter
-(void) setBlendFunc: (ccBlendFunc) blendFunc
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->setBlendFunc([ccTypeConvert ccBlendFuncToBlendFunc:blendFunc]);
}

-(ccBlendFunc) blendFunc
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    return [ccTypeConvert BlendFuncToccBlendFunc: layerColor->getBlendFunc()];
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
    cocos2d::LayerColor* layer = cocos2d::LayerColor::create(cocos2d::Color4B(color.r, color.g, color.b, color.a), w, h);
    layer->retain();
    
    isNeedCCLayerColorDealloc_ = YES;
    impl_ = layer;
    
    self = [super init:impl_];
    return self;
}

- (id) initWithColor:(ccColor4B)color
{
    cocos2d::LayerColor* layer = cocos2d::LayerColor::create(cocos2d::Color4B(color.r, color.g, color.b, color.a));
    layer->retain();
    
    isNeedCCLayerColorDealloc_ = YES;
    impl_ = layer;
    
    self = [super init:impl_];
    return self;
}

// override contentSize
-(void) setContentSize: (CGSize) size
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->setContentSize([ccTypeConvert CGSizeToSize:size]);
}

- (void) changeWidth: (GLfloat) w height:(GLfloat) h
{
    cocos2d::LayerColor* layerColor = (cocos2d::LayerColor*)impl_;
    layerColor->changeWidthAndHeight(w, h);
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
    layerColor->setColor([ccTypeConvert ccColor3BToColor3B:color]);
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
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    return gradient->getStartOpacity();
}

-(void) setStartOpacity:(GLubyte)startOpacity
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    gradient->setStartOpacity(startOpacity);
}

-(void) setEndColor:(ccColor3B)endColor
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    gradient->setEndColor([ccTypeConvert ccColor3BToColor3B:endColor]   );
}

-(ccColor3B) endColor
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: gradient->getEndColor()];
}

-(void) setEndOpacity: (GLubyte)endOpacity
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    gradient->setEndOpacity(endOpacity);
}

-(GLubyte) endOpacity
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    return gradient->getEndOpacity();
}

-(void) setVector:(CGPoint)vector
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    gradient->setVector([ccTypeConvert CGPointToPoint:vector]);
}

-(CGPoint) vector
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    return [ccTypeConvert PointToCGPoint:gradient->getVector()];
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
    cocos2d::LayerGradient* layer = cocos2d::LayerGradient::create(cocos2d::Color4B(start.r, start.g, start.b, start.a),
                                                                   cocos2d::Color4B(end.r, end.g, end.b, end.a));
    layer->retain();
    
    isNeedCCLayerGradientDealloc_ = YES;
    impl_ = layer;
    
    self = [super init:impl_];
    return self;
}

- (id) initWithColor: (ccColor4B) start fadingTo: (ccColor4B) end alongVector: (CGPoint) v
{
    cocos2d::LayerGradient* layer = cocos2d::LayerGradient::create(cocos2d::Color4B(start.r, start.g, start.b, start.a),
                                                                   cocos2d::Color4B(end.r, end.g, end.b, end.a),
                                                                   [ccTypeConvert CGPointToPoint:v]);
    layer->retain();
    
    isNeedCCLayerGradientDealloc_ = YES;
    impl_ = layer;
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject:(void *)object
{
    impl_                         = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCLayerGradientDealloc_ = YES;
    
    self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCLayerGradientDealloc_)
    {
        cocos2d::LayerGradient* layer = static_cast<cocos2d::LayerGradient*>(impl_);
        layer->release();
    }
    
    [super dealloc];
}

-(BOOL) compressedInterpolation
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    return gradient->isCompressedInterpolation();
}

-(void) setCompressedInterpolation:(BOOL)compress
{
    cocos2d::LayerGradient* gradient = static_cast<cocos2d::LayerGradient*>(impl_);
    gradient->setCompressedInterpolation(compress);
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











































