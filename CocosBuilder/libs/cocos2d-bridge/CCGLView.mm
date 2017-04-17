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

// Translates OS X key modifiers into GLFW ones
//
static int translateFlags(NSUInteger flags)
{
    int mods = 0;
    
    if (flags & NSShiftKeyMask)
        mods |= GLFW_MOD_SHIFT;
    if (flags & NSControlKeyMask)
        mods |= GLFW_MOD_CONTROL;
    if (flags & NSAlternateKeyMask)
        mods |= GLFW_MOD_ALT;
    if (flags & NSCommandKeyMask)
        mods |= GLFW_MOD_SUPER;
    
    return mods;
}

@implementation CCGLView

@synthesize frame;

-(NSRect)frame
{
    return [super frame];
    
    /*
    if (!impl_);
     
    cocos2d::GLViewImpl* gl = (cocos2d::GLViewImpl*)impl_;
    NSRect r;
    r.origin = NSZeroPoint;
    r.size = [ccTypeConvert SizeToCGSize:gl->getFrameSize()];
    
    self.frame = r;
    return r;
     */
}

-(void) reshape
{
    [super reshape];
}

-(void)setFrameSize:(NSSize)newSize
{
    [super setFrameSize:newSize];
    
    if (!impl_) return;
    
    NSRect contentRect = self.bounds;
    NSRect fbRect = [self convertRectToBacking:contentRect];
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->setFrameSize(fbRect.size.width, fbRect.size.height);
}

-(NSPoint)convertPoint:(NSPoint)point toView:(nullable NSView*)view
{
    return NSZeroPoint;
}

-(void)addTrackingArea:(NSTrackingArea*)trackingArea
{
    [super addTrackingArea:trackingArea];
}

-(void)removeTrackingArea:(NSTrackingArea*)trackingArea
{
    [super removeTrackingArea:trackingArea];
}

//-(id)initWithFrame:(NSRect)frame
//{
//    impl_ = cocos2d::GLViewImpl::createWithRect("", [ccTypeConvert CGRectToRect:frame]);
//    ((cocos2d::GLViewImpl*)impl_)->retain();
//    isNeedGLViewDealloc_ = YES;
//    
//    self = [super init];
//    return self;
//}

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

-(void) lockOpenGLContext
{
    NSOpenGLContext *glContext = [self openGLContext];
    NSAssert( glContext, @"FATAL: could not get openGL context");
    
    [glContext makeCurrentContext];
    CGLLockContext([glContext CGLContextObj]);
}

-(void) unlockOpenGLContext
{
    NSOpenGLContext *glContext = [self openGLContext];
    NSAssert( glContext, @"FATAL: could not get openGL context");
    
    CGLUnlockContext([glContext CGLContextObj]);
}

- (void) update
{
    // XXX: Should I do something here ?
    [super update];
}

-(id) create:(id)nsWindow delegate:(id)nsDelegate
{
    // TODO: update opengl pixelFormat attrib.
    NSOpenGLPixelFormatAttribute attribs[] =
    {
        NSOpenGLPFAAccelerated,
        NSOpenGLPFAClosestPolicy,
        NSOpenGLPFAAuxBuffers, 0,
        NSOpenGLPFAAccumSize, 0,
        NSOpenGLPFAColorSize, 24,
        NSOpenGLPFAAlphaSize, 8,
        NSOpenGLPFADepthSize, 24,
        NSOpenGLPFAStencilSize, 8,
        NSOpenGLPFADoubleBuffer,
        NSOpenGLPFASampleBuffers, 0,
        0
    };
    
    NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:attribs];
    
    NSRect contentRect = self.bounds;

    self = [super initWithFrame:self.frame pixelFormat:[pixelFormat autorelease]];
    // [self setTranslatesAutoresizingMaskIntoConstraints:YES];
    // [self setAutoresizingMask:NSViewNotSizable];
    BOOL isForEditor = YES;
    cocos2d::GLViewImpl* cppView = cocos2d::GLViewImpl::createAndAttachNSGL(isForEditor, nsWindow, nsDelegate, self, self.openGLContext);
    cppView->retain();
    
    cppView->setDesignResolutionSize(contentRect.size.width, contentRect.size.height, ResolutionPolicy::FIXED_SCALE);
    isNeedGLViewDealloc_ = YES;
    impl_ = cppView;
    
    // self = [super init:impl_];
    return self;
}

// handle move event.
-(void) onMove
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMove();
}

// handle focus event.
-(void) onFocus: (BOOL) isFocus
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onFocus(isFocus); 
}

// handle window move event.
-(void) onSize: (NSRect) contentRect fbRect: (NSRect) fbRect
{
    if (!impl_) return;
    
    // NSLog(@"GLView Size == [%.3f, %.3f] [%.3f, %.3f]", contentRect.size.width, contentRect.size.height, fbRect.size.width, fbRect.size.height);
   
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    
    cocos2d::Rect contentRect1 = cocos2d::Rect();
    contentRect1.size.width = 1600;
    contentRect1.size.height = 900;
    
    cocos2d::Rect fbRect1 = cocos2d::Rect();
    fbRect1.size.width = 3200;
    fbRect1.size.height = 1800;
    
    cppView->onSize([ccTypeConvert CGRectToRect: contentRect], [ccTypeConvert CGRectToRect: fbRect]);
}

// handle window minimum event.
-(void) onMinSize
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMinSize();
}

// handle window maximum event.
-(void) onMaxSize
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMaxSize();
}

// handle window close event, termate cpp engine.
-(void) onTerminate
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onTerminate();
}

//
// for mouse && keyboard event.
//

-(void)mouseDown:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onLeftMouseDown(translateFlags([event modifierFlags]));
}

-(void)mouseDragged:(NSEvent *)event
{
    [self mouseMoved:event];
}

- (void)mouseUp:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onLeftMouseUp(translateFlags([event modifierFlags]));
}

- (void)mouseMoved:(NSEvent *)event
{
    if (!impl_) return;
    
    const NSPoint pos = [event locationInWindow];
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMouseMove(pos.x, self.frame.size.height - pos.y);
}

- (void)rightMouseDown:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onRightMouseDown(translateFlags([event modifierFlags]));
}

- (void)rightMouseDragged:(NSEvent *)event
{
    [self mouseMoved:event];
}

- (void)rightMouseUp:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onRightMouseUp(translateFlags([event modifierFlags]));
}

- (void)otherMouseDown:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onOtherMouseDown((int) [event buttonNumber], translateFlags([event modifierFlags]));
}

- (void)otherMouseDragged:(NSEvent *)event
{
    [self mouseMoved:event];
}

- (void)otherMouseUp:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onOtherMouseUp((int) [event buttonNumber], translateFlags([event modifierFlags]));
}

- (void)mouseExited:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMouseExit();
}

- (void)mouseEntered:(NSEvent *)event
{
    if (!impl_) return;
    
    cocos2d::GLViewImpl* cppView = static_cast<cocos2d::GLViewImpl*>(impl_);
    cppView->onMouseEnter();
}

@end


