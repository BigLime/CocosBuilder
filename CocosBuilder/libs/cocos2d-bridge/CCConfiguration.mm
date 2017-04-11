//
// CCConfiguration
//
// author ke.huang

#import "CCConfiguration.h"
#import "ccTypeConvert.h"
#import "base/CCConfiguration.h"

@implementation CCConfiguration


static CCConfiguration *_sharedConfiguration = nil;

+ (CCConfiguration *)sharedConfiguration
{
    if (!_sharedConfiguration)
        _sharedConfiguration = [[self alloc] init];
    
    return _sharedConfiguration;
}

+(id)alloc
{
    NSAssert(_sharedConfiguration == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

-(id) init
{
    if( (self=[super init]) ) {
    }
    
    return self;
    
}


-(void) dealloc
{
    cocos2d::Configuration::getInstance()->destroyInstance();
    [super dealloc];
}

- (GLint)maxTextureSize
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->getMaxTextureSize();
}

- (GLint)maxTextureUnits
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->getMaxTextureUnits();
}
- (BOOL)supportsNPOT
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->supportsNPOT();
}
- (BOOL)supportsPVRTC
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->supportsPVRTC();
}
- (BOOL)supportsBGRA8888
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->supportsBGRA8888();
}
- (BOOL)supportsDiscardFramebuffer
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->supportsDiscardFramebuffer();
}
- (BOOL)supportsShareableVAO
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->supportsShareableVAO();
}

- (unsigned int)OSVersion
{
    unsigned int _OSVersion = 0;
    return _OSVersion;
}

- (BOOL) checkForGLExtension:(NSString *)searchName
{
    cocos2d::Configuration* config = cocos2d::Configuration::getInstance();
    return config->checkForGLExtension([ccTypeConvert NSStringTostring:searchName]);
}
// XXX: Optimization: This should be called only once
-(NSInteger) runningDevice
{
    NSInteger ret=-1;
    
#ifdef __CC_PLATFORM_IOS

    
#elif defined(__CC_PLATFORM_MAC)
    
    // XXX: Add here support for Mac Retina Display
    ret = kCCDeviceMac;
    
#endif // __CC_PLATFORM_MAC
    
    return ret;
}
#pragma mark OpenGL getters

/** OpenGL Max texture size. */

-(void) getOpenGLvariables
{
    //oc的内部函数 c++没有此方法
}-(void) dumpInfo
{
    
}
@end
