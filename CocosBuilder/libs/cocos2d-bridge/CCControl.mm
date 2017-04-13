//
// CCControl
//
// author ke.huang

#import "CCControl.h"
#import "extensions/GUI/CCControlExtension/CCControl.h"
#import "ccTypeConvert.h"

@implementation CCControl

- (id) init:(void*) pThis
{
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedControlDealloc_  = NO;
    }
    else
    {
        cocos2d::extension::Control* control = cocos2d::extension::Control::create();
        control->retain();
        
        impl_ = control;
        
        isNeedControlDealloc_  = YES;
    }
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedControlDealloc_  = NO;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedControlDealloc_)
    {
        ((cocos2d::extension::Control*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(GLubyte)opacity
{
    //cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    //no this method in c++
    unsigned char c;
    return c;
    
}
-(void)setOpacity:(GLubyte)opacity
{
    //no this method in c++
}
-(ccColor3B)displayedColor
{
    ccColor3B r;
    return r;
}
- (BOOL)displayerOpacityEnabled
{
    return YES;
}
// setter getter
-(void)setCascadeColorEnabled:(BOOL)cascadeColorEnabled
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    control->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL)isCascadeColorEnabled
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->isCascadeColorEnabled();
}
-(GLubyte)displayedOpacity
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->getDisplayedOpacity();
}

-(void)setCascadeOpacityEnabled:(BOOL)cascadeOpacityEnabled
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    control->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL)isCascadeOpacityEnabled
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->isCascadeOpacityEnabled();
}

- (void)updateDisplayedOpacity:(GLubyte)opacity
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    control->updateDisplayedOpacity(opacity);
}
- (void)updateDisplayedColor:(ccColor3B)color
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    control->updateDisplayedColor([ccTypeConvert ccColor3BToColor3B:color]);
}
-(ccColor3B)color
{
    ccColor3B r;
    return r;
}
-(void)setColor:(ccColor3B)opacity
{
    //no this method in c++
}
-(BOOL)doesOpacityModifyRGB
{
    return NO;
}
-(void) setOpacityModifyRGB:(BOOL)boolean;
{
    
}
-(void)defaultTouchPriority:(NSInteger)dt
{

}
-(NSInteger)getDefaultTouchPriority
{
    //no this method in c++
    return 0;
}
-(CCControlState)state
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return CCControlState(control->getState());
}
-(BOOL)isEnabled
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->isEnabled();
}
-(void)setEnabled:(BOOL)enabled
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->setEnabled(enabled);
}
-(BOOL)isSelected
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->isSelected();
}
-(void)setSelected:(BOOL)selected
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->setSelected(selected);
}
-(BOOL)isHighlighted
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->isHighlighted();
}
-(void)setHighlighted:(BOOL)highlighted
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->setHighlighted(highlighted);
}
-(BOOL)hasVisibleParents
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->hasVisibleParents();
}
- (void)sendActionsForControlEvents:(CCControlEvent)controlEvents
{
    cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    return control->sendActionsForControlEvents(cocos2d::extension::Control::EventType(controlEvents));
}
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(CCControlEvent)controlEvents
{
    //cocos2d::extension::Control* control = static_cast<cocos2d::extension::Control*>(impl_);
    //control->addTargetWithActionForControlEvents(, , cocos2d::extension::Control::EventType(controlEvents));
}
- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(CCControlEvent)controlEvents
{
    
}
- (void)setBlock:(CCControlBlock)block forControlEvents:(CCControlEvent)controlEvents
{
    
}
/*
- (CGPoint)touchLocation:(UITouch *)touch
{
    CGPoint p;
    return p;
}
- (BOOL)isTouchInside:(UITouch *)touch
{
    return NO;
}*/
- (CGPoint)eventLocation:(NSEvent *)event
{
    CGPoint p;
    return p;
}
- (BOOL)isMouseInside:(NSEvent *)event
{
    return NO;
}
- (void)needsLayout
{
    
}
@end
