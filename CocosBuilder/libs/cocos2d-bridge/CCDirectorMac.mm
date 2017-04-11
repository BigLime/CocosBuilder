//
// CCDirectorMac
//
// author ke.huang

#import "CCDirectorMac.h"
#import "CCDirector.h"
#import "ccTypeConvert.h"
#import "base/CCDirector.h"

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
}

- (void) stopAnimation
{
    
}

-(void) dealloc
{
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
    
}

// set the event dispatcher
-(void) setView:(CCGLView *)view
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setOpenGLView((cocos2d::GLView*)[view getImpl]);
}

@end
