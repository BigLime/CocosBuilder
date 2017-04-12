//
//  CCAppDelegate.m
//  CocosBuilder
//
//  Created by Leem on 17/4/11.
//
//

#import "CCAppDelegate.h"
#import "platform/CCGLView.h"

void AppDelegate::initGLContextAttrs()
{
    // set OpenGL context attributes: red,green,blue,alpha,depth,stencil
//    cocos2d::GLContextAttrs glContextAttrs = {8, 8, 8, 8, 24, 8};
//    
//    GLView::setGLContextAttrs(glContextAttrs);
}

// if you want to use the package manager to install more packages,
// don't modify or remove this function
static int register_all_packages()
{
    return 0; //flag for packages manager
}

bool AppDelegate::applicationDidFinishLaunching() {
    // initialize director
//    auto director = Director::getInstance();
//    auto glview = director->getOpenGLView();
//    if(!glview) {
//#if (CC_TARGET_PLATFORM == CC_PLATFORM_WIN32) || (CC_TARGET_PLATFORM == CC_PLATFORM_MAC) || (CC_TARGET_PLATFORM == CC_PLATFORM_LINUX)
//        glview = GLViewImpl::createWithRect("hero", cocos2d::Rect(0, 0, designResolutionSize.width, designResolutionSize.height));
//#else
//        glview = GLViewImpl::create("hero");
//#endif
//        director->setOpenGLView(glview);
//    }
//    
//    // turn on display FPS
//    director->setDisplayStats(true);
//    
//    // set FPS. the default value is 1.0/60 if you don't call this
//    director->setAnimationInterval(1.0f / 60);
//    
//    // Set the design resolution
//    AdapteHelper::registScreenProfile(director->getWinSize());
//    
//    register_all_packages();
//    
//    // create a scene. it's an autorelease object
//    auto scene = LoadingScene::scene(ESceneId::ESceneId_InitScene);
//    
//    // run
//    director->runWithScene(scene);
    
    return true;
}

// This function will be called when the app is inactive. Note, when receiving a phone call it is invoked.
void AppDelegate::applicationDidEnterBackground() {
//    Director::getInstance()->stopAnimation();
    
    // if you use SimpleAudioEngine, it must be paused
    // SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground() {
//    Director::getInstance()->startAnimation();
    
    // if you use SimpleAudioEngine, it must resume here
    // SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
}
