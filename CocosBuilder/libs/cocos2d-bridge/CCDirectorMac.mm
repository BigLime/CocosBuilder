//
// CCDirectorMac
//
// author ke.huang

#import "CCDirectorMac.h"
#import "CCDirector.h"
#import "ccTypeConvert.h"
#import "base/CCDirector.h"
#import "CCGLView.h"

#pragma mark -
#pragma mark Director Mac

@implementation CCDirectorMac


-(id) init
{
    if( (self=[super init] ) ) {
        
    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

-(void) setView:(CCGLView *)view
{
    [super setView:view];
}

-(int) resizeMode
{
    return 0;//no this method in C++
}

-(void) setResizeMode:(int)mode
{
    //no this method in C++
}

-(void) setViewport
{
}

-(void) setProjection:(ccDirectorProjection)projection
{
    [super setProjection:projection]; 
}


// If scaling is supported, then it should always return the original size
// otherwise it should return the "real" size.
-(CGSize) winSize
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return [ccTypeConvert SizeToCGSize:director->getWinSize()];
}

-(CGSize) winSizeInPixels
{
    return [self winSize];
}

- (CGPoint) convertToLogicalCoordinates:(CGPoint)coords
{
    CGPoint ret;
    ret.x = 0;
    ret.y = 0;
    return ret;
}

@end


#pragma mark -
#pragma mark DirectorDisplayLink


@implementation CCDirectorDisplayLink

- (CVReturn) getFrameForTime:(const CVTimeStamp*)outputTime
{
    [self performSelector:@selector(drawScene) onThread:_runningThread withObject:nil waitUntilDone:YES];
    return kCVReturnSuccess;
}

// This is the renderer output callback function
static CVReturn MyDisplayLinkCallback(CVDisplayLinkRef displayLink, const CVTimeStamp* now, const CVTimeStamp* outputTime, CVOptionFlags flagsIn, CVOptionFlags* flagsOut, void* displayLinkContext)
{
    CVReturn result = [(CCDirectorDisplayLink*)displayLinkContext getFrameForTime:outputTime];
    return result;
}

- (void) startAnimation
{
    [super startAnimation];
    
    if(self.isAnimating)
        return;
    
    _runningThread = [NSThread mainThread];
    
    struct timeval _lastUpdate;
    gettimeofday(&_lastUpdate, NULL);
    
    // Create a display link capable of being used with all active displays
    CVDisplayLinkCreateWithActiveCGDisplays(&displayLink);
    
    // Set the renderer output callback function
    CVDisplayLinkSetOutputCallback(displayLink, &MyDisplayLinkCallback, self);
    
    // Set the display link for the current renderer
//    CCGLView *openGLview = (CCGLView*) self.view;
    CCGLView *openGLview = self.view;
    CGLContextObj cglContext = [[openGLview openGLContext] CGLContextObj];
    CGLPixelFormatObj cglPixelFormat = [[openGLview pixelFormat] CGLPixelFormatObj];
    CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext(displayLink, cglContext, cglPixelFormat);
    
    // Activate the display link
    CVDisplayLinkStart(displayLink);
    
    _isAnimating = YES;
}

- (void) stopAnimation
{
    if(!_isAnimating)
        return;
    
    if( displayLink ) {
        CVDisplayLinkStop(displayLink);
        CVDisplayLinkRelease(displayLink);
        displayLink = NULL;
        
        _runningThread = nil;
    }
    
    _isAnimating = NO;
}

-(void) dealloc
{
    if( displayLink ) {
        CVDisplayLinkStop(displayLink);
        CVDisplayLinkRelease(displayLink);
    }
    
    [super dealloc];
}

//
// Mac Director has its own thread
//
-(void) mainLoop
{
    //no this method in C++
}

//
// Draw the Scene
//
- (void) drawScene
{
    // 在该方法中执行C++引擎的mainLoop
    
    // NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->mainLoop();
    // [pool release];
}

// set the event dispatcher
-(void) setView:(CCGLView *)view
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setOpenGLView((cocos2d::GLView*)[view getImpl]);
}

@end
