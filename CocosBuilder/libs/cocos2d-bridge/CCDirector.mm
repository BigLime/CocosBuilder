//
//  CCDirector.m
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import "CCDirector.h"
#import "CCScene.h"
//#import "CCScheduler.h"
//#import "CCActionManager.h"
#import "CCGLView.h"

#import "ccTypeConvert.h"

#import "base/CCDirector.h"
#import "2d/CCScene.h"

// XXX it shoul be a Director ivar. Move it there once support for multiple directors is added
NSUInteger	__ccNumberOfDraws = 0;

#define kDefaultFPS		60.0	// 60 frames per second

extern NSString * cocos2dVersion(void);

@implementation CCDirector

// getter setter
-(void)setRunningThread:(NSThread *)runningThread
{
    
}

-(NSThread *)runningThread
{
    return nil;
}

// getter setter
-(CCScene*)runningScene
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return [[[CCScene alloc] initWithObject:director->getRunningScene()] autorelease];
}

// getter setter
-(void)setAnimationInterval:(NSTimeInterval)animationInterval
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setAnimationInterval(animationInterval);
}

-(NSTimeInterval)animationInterval
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->getAnimationInterval();
}

// getter setter
-(void)setDisplayStats:(BOOL)displayStats
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setDisplayStats(displayStats);
}

-(BOOL)displayStats
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->isDisplayStats();
}

// getter setter
-(void)setNextDeltaTimeZero:(BOOL)nextDeltaTimeZero
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setNextDeltaTimeZero(nextDeltaTimeZero);
}

-(BOOL)nextDeltaTimeZero
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->isNextDeltaTimeZero();
}

// getter setter
-(BOOL)isPaused
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->isPaused();
}

// getter setter
-(void)setIsAnimating:(BOOL)isAnimating
{
    /*mark todo by lsr*/ // 接口不存在
}

-(BOOL)isAnimating
{
    /*mark todo by lsr*/ // 接口不存在
}

// getter setter
-(NSUInteger)totalFrames
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->getTotalFrames();
}

// getter setter
-(ccTime)secondsPerFrame
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->getSecondsPerFrame();
}

// getter setter
-(BOOL)sendCleanupToScene
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->isSendCleanupToScene();
}

// getter setter
-(void)setNotificationNode:(id)notificationNode
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setNotificationNode((cocos2d::Node*)[notificationNode getImpl]);
}

-(id)notificationNode
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return [[[CCNode alloc] initWithObject:director->getNotificationNode()] autorelease];
}

// getter setter
-(void)setScheduler:(CCScheduler *)scheduler
{
    /*mark todo by lsr*/ // 待翻译
//    cocos2d::Director* director = cocos2d::Director::getInstance();
//    director->setScheduler((cocos2d::Scheduler*)[scheduler getImpl]);
}

-(CCScheduler *)scheduler
{
    /*mark todo by lsr*/ // 待翻译
//    cocos2d::Director* director = cocos2d::Director::getInstance();
//    return [[[CCScheduler alloc] initWithObject:director->getScheduler()] autorelease];
}

// getter setter
-(void)setDelegate:(id<CCDirectorDelegate>)delegate
{
    /*mark todo by lsr*/ // 接口不存在
}

-(id<CCDirectorDelegate>)delegate
{
    /*mark todo by lsr*/ // 接口不存在
}

// getter setter
-(void)setActionManager:(CCActionManager *)actionManager
{
    /*mark todo by lsr*/ // 待翻译
//    cocos2d::Director* director = cocos2d::Director::getInstance();
//    director->setActionManager((cocos2d::ActionManager*)[actionManager getImpl]);
}

-(CCActionManager *)actionManager
{
    /*mark todo by lsr*/ // 待翻译
//    cocos2d::Director* director = cocos2d::Director::getInstance();
//    return [[[CCActionManager alloc] initWithObject:director->getActionManager()] autorelease];
}


//
// singleton stuff
//
static CCDirector *_sharedDirector = nil;

+ (CCDirector *)sharedDirector
{
    if (!_sharedDirector) {
        
        _sharedDirector = [[self alloc] init];
    }
    
    return _sharedDirector;
}

+(id)alloc
{
    NSAssert(_sharedDirector == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

- (id) init
{
    if( (self=[super init] ) ) {

    }
    
    return self;
}

- (NSString*) description
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return [NSString stringWithFormat:@"<%@ = %p | Size: %0.f x %0.f>", [self class], self, director->getWinSizeInPixels().width, director->getWinSizeInPixels().height];
}

- (void) dealloc
{
    CCLOGINFO(@"cocos2d: deallocing %@", self);
    
    [super dealloc];
}

-(void) setGLDefaultValues
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setGLDefaultValues();
}

//
// Draw the Scene
//
- (void) drawScene
{
    // Override me
}

#pragma mark Director - Memory Helper

-(void) purgeCachedData
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->purgeCachedData();
}

#pragma mark Director - Scene OpenGL Helper

-(ccDirectorProjection) projection
{
    // return _projection;
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return (ccDirectorProjection)director->getProjection();
}

-(float) getZEye
{
    // return ( _winSizeInPixels.height / 1.1566f / CC_CONTENT_SCALE_FACTOR() );
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return director->getZEye();
}

-(void) setViewport
{
    // CCLOG(@"cocos2d: override me");
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setViewport();
}

-(void) setProjection:(ccDirectorProjection)projection
{
    // CCLOG(@"cocos2d: override me");
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setProjection((cocos2d::Director::Projection)projection);
}

- (void) setAlphaBlending: (BOOL) on
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setAlphaBlending(on);
}

- (void) setDepthTest: (BOOL) on
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->setDepthTest(on);
}

#pragma mark Director Integration with a UIKit view

-(void) setView:(CCGLView*)view
{
    
}

-(CCGLView*) view
{
    return  __view;
}


#pragma mark Director Scene Landscape

-(CGPoint)convertToGL:(CGPoint)uiPoint
{
    std::string str = [ccTypeConvert NSStringTostring:@"CCDirector#convertToGL: OVERRIDE ME."];
    CCLOG("%s", str.c_str());
    return CGPointZero;
}

-(CGPoint)convertToUI:(CGPoint)glPoint
{
    std::string str = [ccTypeConvert NSStringTostring:@"CCDirector#convertToUI: OVERRIDE ME."];
    CCLOG("%s", str.c_str());
    return CGPointZero;
}

-(CGSize)winSize
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return [ccTypeConvert SizeToCGSize:director->getWinSize()];
}

-(CGSize)winSizeInPixels
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    return [ccTypeConvert SizeToCGSize:director->getWinSizeInPixels()];
}

-(void) reshapeProjection:(CGSize)newWindowSize
{
    
}

#pragma mark Director Scene Management

- (void)runWithScene:(CCScene*) scene
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    cocos2d::Scene* cppscene = (cocos2d::Scene*)[scene getImpl];
    director->runWithScene(cppscene);
}

-(void) replaceScene: (CCScene*) scene
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    cocos2d::Scene* cppscene = (cocos2d::Scene*)[scene getImpl];
    director->replaceScene(cppscene);
}

- (void) pushScene: (CCScene*) scene
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    cocos2d::Scene* cppscene = (cocos2d::Scene*)[scene getImpl];
    director->pushScene(cppscene);
}

-(void) popScene
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->popScene();
}

-(void) popToRootScene
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->popToRootScene();
}

-(void) popToSceneStackLevel:(NSUInteger)level
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->popToSceneStackLevel(level);
}

-(void) end
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->end();
}

-(void) pause
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->pause();
}

-(void) resume
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->resume();
}

- (void)startAnimation
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->startAnimation();
}

- (void)stopAnimation
{
    cocos2d::Director* director = cocos2d::Director::getInstance();
    director->stopAnimation();
}

@end

