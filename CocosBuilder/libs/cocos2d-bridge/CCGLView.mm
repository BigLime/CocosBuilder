//
//  CCGLView.m
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import "CCGLView.h"

#import "ccTypeConvert.h"
#import "platform/desktop/CCGLViewImpl-desktop.h"

@implementation CCGLView

-(NSRect)frame
{
    cocos2d::GLViewImpl* gl = (cocos2d::GLViewImpl*)impl_;
    NSRect r;
    r.origin = NSZeroPoint;
    r.size = [ccTypeConvert SizeToCGSize:gl->getFrameSize()];
    return r;
}

-(NSPoint)convertPoint:(NSPoint)point toView:(nullable NSView*)view
{
    return NSZeroPoint;
}

-(void)addTrackingArea:(NSTrackingArea*)trackingArea
{
    /*mark todo by lsr*/
}

-(void)removeTrackingArea:(NSTrackingArea*)trackingArea
{
    /*mark todo by lsr*/
}

-(id)initWithFrame:(NSRect)frame
{
    impl_ = cocos2d::GLViewImpl::createWithRect("", [ccTypeConvert CGRectToRect:frame]);
    ((cocos2d::GLViewImpl*)impl_)->retain();
    isNeedGLViewDealloc_ = YES;
    
    self = [super init];
    return self;
}

-(id)initWithObject: (void*)object
{
    impl_ = object;
    ((cocos2d::GLViewImpl*)impl_)->retain();
    isNeedGLViewDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

-(void) dealloc
{
    if(isNeedGLViewDealloc_)
        ((cocos2d::GLViewImpl*)impl_)->release();
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

@end
