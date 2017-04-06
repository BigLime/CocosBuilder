//
//  CCDirector.m
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import "CCDirector.h"

// XXX it shoul be a Director ivar. Move it there once support for multiple directors is added
NSUInteger	__ccNumberOfDraws = 0;

#define kDefaultFPS		60.0	// 60 frames per second

extern NSString * cocos2dVersion(void);

@interface CCDirector (Private)
-(void) setNextScene;
// shows the statistics
-(void) showStats;
// calculates delta time since last time it was called
-(void) calculateDeltaTime;
// calculates the milliseconds per frame from the start of the frame
-(void) calculateMPF;
// returns the FPS image data pointer and len
-(void)getFPSImageData:(unsigned char**)datapointer length:(NSUInteger*)len;
@end

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
    Director* director = Director::getInstance();
    return director->getRunningScene();
}

// getter setter
-(void)setAnimationInterval:(NSTimeInterval)animationInterval
{
    Director* director = Director::getInstance();
    director->setAnimationInterval(animationInterval);
}

-(NSTimeInterval)animationInterval
{
    Director* director = Director::getInstance();
    return director->getAnimationInterval();
}

// getter setter
-(void)setDisplayStats:(BOOL)displayStats
{
    Director* director = Director::getInstance();
    director->setDisplayStats(displayStats);
}

-(BOOL)displayStats
{
    Director* director = Director::getInstance();
    return director->getDisplayStats();
}

// getter setter
-(void)setNextDeltaTimeZero:(BOOL)nextDeltaTimeZero
{
    Director* director = Director::getInstance();
    director->setNextDeltaTimeZero(nextDeltaTimeZero);
}

-(float)nextDeltaTimeZero
{
    Director* director = Director::getInstance();
    return director->getNextDeltaTimeZero();
}

// getter setter
-(BOOL)isPaused
{
    Director* director = Director::getInstance();
    return director->isPaused();
}

// getter setter
-(void)setIsAnimating:(BOOL)isAnimating
{

}

-(BOOL)isAnimating
{
    
}

// getter setter
-(void)setTotalFrames:(NSUInteger)totalFrames
{
    Director* director = Director::getInstance();
    director->setTotalFrames(totalFrames);
}

-(NSUInteger)totalFrames
{
    Director* director = Director::getInstance();
    return director->getTotalFrames(totalFrames);
}

// getter setter
-(ccTime)secondsPerFrame
{
    Director* director = Director::getInstance();
    return director->getSecondsPerFrame();
}

// getter setter
-(BOOL)sendCleanupToScene
{
    Director* director = Director::getInstance();
    return director->isSendCleanupToScene();
}

// getter setter
-(void)setNotificationNode:(id)notificationNode
{
    Director* director = Director::getInstance();
    director->setNotificationNode(notificationNode);
}

-(id)notificationNode
{
    Director* director = Director::getInstance();
    return director->getNotificationNode();
}

// getter setter
-(void)setScheduler:(CCScheduler *)scheduler
{
    Director* director = Director::getInstance();
    director->setScheduler(scheduler);
}

-(CCScheduler *)scheduler
{
    Director* director = Director::getInstance();
    return director->getScheduler();
}

// getter setter
-(void)setDelegate:(id<CCDirectorDelegate>)delegate
{

}

-(id<CCDirectorDelegate>)delegate
{
    
}

// getter setter
-(void)setActionManager:(CCActionManager *)actionManager
{
    Director* director = Director::getInstance();
    director->setActionManager(actionManager);
}

-(CCActionManager *)actionManager
{
    Director* director = Director::getInstance();
    return director->getActionManager();
}


//
// singleton stuff
//
static CCDirector *_sharedDirector = nil;

+ (CCDirector *)sharedDirector
{
    if (!_sharedDirector) {
        
        //
        // Default Director is DisplayLink
        //
        if( [ [CCDirector class] isEqual:[self class]] )
            _sharedDirector = [[CC_DIRECTOR_DEFAULT alloc] init];
        else
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
    return [NSString stringWithFormat:@"<%@ = %p | Size: %0.f x %0.f, view = %@>", [self class], self, _winSizeInPoints.width, _winSizeInPoints.height, __view];
}

- (void) dealloc
{
    CCLOGINFO(@"cocos2d: deallocing %@", self);
    
    [super dealloc];
}

-(void) setGLDefaultValues
{
    Director* director = Director::getInstance();
    director->setGLDefaultValues();
}

//
// Draw the Scene
//
- (void) drawScene
{
    // Override me
}

-(void) calculateDeltaTime
{
    Director* director = Director::getInstance();
    director->calculateDeltaTime();
}

#pragma mark Director - Memory Helper

-(void) purgeCachedData
{
    Director* director = Director::getInstance();
    director->purgeCachedData();
}

#pragma mark Director - Scene OpenGL Helper

-(ccDirectorProjection) projection
{
    // return _projection;
    Director* director = Director::getInstance();
    return director->getProjection();
}

-(float) getZEye
{
    // return ( _winSizeInPixels.height / 1.1566f / CC_CONTENT_SCALE_FACTOR() );
    Director* director = Director::getInstance();
    return director->getZEye();
}

-(void) setViewport
{
    // CCLOG(@"cocos2d: override me");
    Director* director = Director::getInstance();
    director->setViewport();
}

-(void) setProjection:(ccDirectorProjection)projection
{
    // CCLOG(@"cocos2d: override me");
    Director* director = Director::getInstance();
    director->setProjection(projection);
}

- (void) setAlphaBlending: (BOOL) on
{
    Director* director = Director::getInstance();
    director->setAlphaBlending(on);
}

- (void) setDepthTest: (BOOL) on
{
    Director* director = Director::getInstance();
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
    CCLOG(@"CCDirector#convertToGL: OVERRIDE ME.");
    return CGPointZero;
}

-(CGPoint)convertToUI:(CGPoint)glPoint
{
    CCLOG(@"CCDirector#convertToUI: OVERRIDE ME.");
    return CGPointZero;
}

-(CGSize)winSize
{
    Director* director = Director::getInstance();
    return director->getWinSize();
}

-(CGSize)winSizeInPixels
{
    Director* director = Director::getInstance();
    return director->getWinSizeInPixels();
}

-(void) reshapeProjection:(CGSize)newWindowSize
{
    
}

#pragma mark Director Scene Management

- (void)runWithScene:(CCScene*) scene
{
    Director* director = Director::getInstance();
    Scene* cppscene = (Scene*)[scene getImpl];
    director->runWithScene(cppscene);
}

-(void) replaceScene: (CCScene*) scene
{
    Director* director = Director::getInstance();
    Scene* cppscene = (Scene*)[scene getImpl];
    director->replaceScene(cppscene);
}

- (void) pushScene: (CCScene*) scene
{
    Director* director = Director::getInstance();
    Scene* cppscene = (Scene*)[scene getImpl];
    director->pushScene(cppscene);
}

-(void) popScene
{
    Director* director = Director::getInstance();
    director->popScene();
}

-(void) popToRootScene
{
    Director* director = Director::getInstance();
    director->popToRootScene();
}

-(void) popToSceneStackLevel:(NSUInteger)level
{
    Director* director = Director::getInstance();
    director->popToSceneStackLevel(level);
}

-(void) end
{
    Director* director = Director::getInstance();
    director->end();
}

-(void) setNextScene
{
    Director* director = Director::getInstance();
    director->setNextScene();
}

-(void) pause
{
    Director* director = Director::getInstance();
    director->pause();
}

-(void) resume
{
    Director* director = Director::getInstance();
    director->resume();
}

- (void)startAnimation
{
    Director* director = Director::getInstance();
    director->startAnimation();
}

- (void)stopAnimation
{
    Director* director = Director::getInstance();
    director->stopAnimation();
}


// display statistics
-(void) showStats
{
    Director* director = Director::getInstance();
    director->showStats();
}

-(void) calculateMPF
{
    Director* director = Director::getInstance();
    director->calculateMPF();
}

#pragma mark Director - Helper

-(void)getFPSImageData:(unsigned char**)datapointer length:(NSUInteger*)len
{
    Director* director = Director::getInstance();
    director->getFPSImageData(datapointer, len);
}

-(void) createStatsLabel
{
    Director* director = Director::getInstance();
    director->createStatsLabel();
}

@end

