//
// CCConfiguration
//
// author ke.huang

#import "CCConfiguration.h"
#import "ccTypeConvert.h"
#import "base/CCConfiguration.h"

@implementation CCConfiguration


static CCConfiguration *_sharedConfiguration = nil;

static char * glExtensions;

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
#ifdef __CC_PLATFORM_IOS
#elif defined(__CC_PLATFORM_MAC)
- (NSString*)getMacVersion
{
    SInt32 versionMajor, versionMinor, versionBugFix;
    Gestalt(gestaltSystemVersionMajor, &versionMajor);
    Gestalt(gestaltSystemVersionMinor, &versionMinor);
    Gestalt(gestaltSystemVersionBugFix, &versionBugFix);
    
    return [NSString stringWithFormat:@"%d.%d.%d", versionMajor, versionMinor, versionBugFix];
}
#endif // __CC_PLATFORM_MAC

- (unsigned int)OSVersion
{
    unsigned int _OSVersion = 0;
#ifdef __CC_PLATFORM_IOS
    NSString *OSVer = [[UIDevice currentDevice] systemVersion];
#elif defined(__CC_PLATFORM_MAC)
    NSString *OSVer = [self getMacVersion];
#endif
    NSArray *arr = [OSVer componentsSeparatedByString:@"."];
    int idx = 0x01000000;
    for( NSString *str in arr ) {
        int value = [str intValue];
        _OSVersion += value * idx;
        idx = idx >> 8;
    }
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
    
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        ret = (CC_CONTENT_SCALE_FACTOR() == 2) ? kCCDeviceiPadRetinaDisplay : kCCDeviceiPad;
    }
    else if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )
    {
        // From http://stackoverflow.com/a/12535566
        BOOL isiPhone5 = CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(640, 1136));
        
        if( CC_CONTENT_SCALE_FACTOR() == 2 ) {
            ret = isiPhone5 ? kCCDeviceiPhone5RetinaDisplay : kCCDeviceiPhoneRetinaDisplay;
        } else
            ret = isiPhone5 ? kCCDeviceiPhone5 : kCCDeviceiPhone;
    }
    
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
}
- (NSString*) description
{
#if DEBUG
    printf("cocos2d: %s\n", cocos2d_version );
    
#ifdef __CC_PLATFORM_IOS
    NSString *OSVer = [[UIDevice currentDevice] systemVersion];
#elif defined(__CC_PLATFORM_MAC)
    NSString *OSVer = [self getMacVersion];
#endif
    
#ifdef __CC_PLATFORM_MAC
    printf("cocos2d: Director's thread: %s\n",
#if (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_MAIN_THREAD)
           "Main thread"
#elif (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_OWN_THREAD)
           "Own thread"
#elif (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_DISPLAY_LINK_THREAD)
           "DisplayLink thread"
#endif //
           );
#endif // Mac
    
    printf("cocos2d: compiled with Profiling Support: %s\n",
#if CC_ENABLE_PROFILERS
           "YES - *** Disable it when you finish profiling ***"
#else
           "NO"
#endif
           );
    
    printf("cocos2d: OS version: %s (0x%08x)\n", [OSVer UTF8String], _OSVersion);
    
    printf("cocos2d: GL_VENDOR:   %s\n", glGetString(GL_VENDOR) );
    printf("cocos2d: GL_RENDERER: %s\n", glGetString ( GL_RENDERER   ) );
    printf("cocos2d: GL_VERSION:  %s\n", glGetString ( GL_VERSION    ) );
    
    printf("cocos2d: GL_MAX_TEXTURE_SIZE: %d\n", _maxTextureSize);
    printf("cocos2d: GL_MAX_TEXTURE_UNITS: %d\n", _maxTextureUnits);
    printf("cocos2d: GL_MAX_SAMPLES: %d\n", _maxSamplesAllowed);
    printf("cocos2d: GL supports PVRTC: %s\n", (_supportsPVRTC ? "YES" : "NO") );
    printf("cocos2d: GL supports BGRA8888 textures: %s\n", (_supportsBGRA8888 ? "YES" : "NO") );
    printf("cocos2d: GL supports NPOT textures: %s\n", (_supportsNPOT ? "YES" : "NO") );
    printf("cocos2d: GL supports discard_framebuffer: %s\n", (_supportsDiscardFramebuffer ? "YES" : "NO") );
    printf("cocos2d: GL supports shareable VAO: %s\n", (_supportsShareableVAO ? "YES" : "NO") );
    
#endif // DEBUG

}

@end
