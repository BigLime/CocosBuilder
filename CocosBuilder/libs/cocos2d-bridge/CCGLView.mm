//
//  CCGLView.m
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import "CCGLView.h"

#import "ccTypeConvert.h"

//#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
//#include "platform/ios/CCGLViewImpl-ios.h"
//#endif
//#if (CC_TARGET_PLATFORM == CC_PLATFORM_MAC)
#import "platform/desktop/CCGLViewImpl-desktop.h"
#import "platform/CCGLView.h"
//#endif

@implementation CCGLView

@synthesize frame;

-(NSRect)frame
{
    return [super frame];

/*
    cocos2d::GLViewImpl* gl = (cocos2d::GLViewImpl*)impl_;
    NSRect r;
    r.origin = NSZeroPoint;
    r.size = [ccTypeConvert SizeToCGSize:gl->getFrameSize()];
    return r;
*/
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

-(id)initWithObject: (void*)object
{
    impl_ = object;
    ((cocos2d::GLViewImpl*)impl_)->retain();
    isNeedGLViewDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

-(void)newCppGLView
{
    impl_ = cocos2d::GLViewImpl::createWithRect("", [ccTypeConvert CGRectToRect:self.frame]);
    ((cocos2d::GLViewImpl*)impl_)->retain();
    
    isNeedGLViewDealloc_ = YES;
}

-(void) dealloc
{
    if(isNeedGLViewDealloc_)
    {
        cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
        cppView->detachNSGL();
        cppView->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(id) create:(id)nsWindow delegate:(id)nsDelegate
{
    // TODO: update opengl pixelFormat attrib.
    NSOpenGLPixelFormatAttribute attribs[] =
    {
        //		NSOpenGLPFAAccelerated,
        //		NSOpenGLPFANoRecovery,
        NSOpenGLPFADoubleBuffer,
        NSOpenGLPFADepthSize, 24,
        
#if 0
        // Must specify the 3.2 Core Profile to use OpenGL 3.2
        NSOpenGLPFAOpenGLProfile,
        NSOpenGLProfileVersion3_2Core,
#endif
        
        0
    };
    
    NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:attribs];
    
    NSRect frameRect = self.frame;
    self = [super initWithFrame:frameRect pixelFormat:[pixelFormat autorelease]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    cocos2d::GLViewImpl* cppView = cocos2d::GLViewImpl::createAndAttachNSGL(nsWindow, nsDelegate, self, self.openGLContext);
    cppView->retain();
    
    isNeedGLViewDealloc_ = YES;
    impl_ = cppView;
    
    // self = [super init:impl_];
    return self;
}

// handle move event.
-(void) onMove
{
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMove();
}

// handle focus event.
-(void) onFocus: (BOOL) isFocus
{
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onFocus(isFocus); 
}

// handle window move event.
-(void) onSize: (NSRect) contentRect fbRect: (NSRect) fbRect
{
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onSize([ccTypeConvert CGRectToRect: contentRect], [ccTypeConvert CGRectToRect: fbRect]);
}

// handle window minimum event.
-(void) onMinSize
{
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMinSize();
}

// handle window maximum event.
-(void) onMaxSize
{
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMaxSize();
}

// handle window close event, termate cpp engine.
-(void) onTerminate
{
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onTerminate();
}

@end
