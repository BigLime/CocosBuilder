//
//  CCAppDelegate.h
//  CocosBuilder
//
//  Created by Leem on 17/4/11.
//
//

#import <Foundation/Foundation.h>

#include "platform/mac/CCApplication-mac.h"

/**
 @brief    The cocos2d Application.
 
 Private inheritance here hides part of interface from Director.
 */
class  AppDelegate : private cocos2d::Application
{
public:

    virtual void initGLContextAttrs();
    
    /**
     @brief    Implement Director and Scene init code here.
     @return true    Initialize success, app continue.
     @return false   Initialize failed, app terminate.
     */
    virtual bool applicationDidFinishLaunching();
    
    /**
     @brief  Called when the application moves to the background
     @param  the pointer of the application
     */
    virtual void applicationDidEnterBackground();
    
    /**
     @brief  Called when the application reenters the foreground
     @param  the pointer of the application
     */
    virtual void applicationWillEnterForeground();
};
