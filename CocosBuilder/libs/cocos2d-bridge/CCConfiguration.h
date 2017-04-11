//
// CCConfiguration
//
// author ke.huang 17/4/10

#import <Foundation/Foundation.h>
enum {
    kCCDeviceiPhone,
    kCCDeviceiPhoneRetinaDisplay,
    kCCDeviceiPhone5,
    kCCDeviceiPhone5RetinaDisplay,
    kCCDeviceiPad,
    kCCDeviceiPadRetinaDisplay,
    
    kCCDeviceMac,
    kCCDeviceMacRetinaDisplay,
};
@interface CCConfiguration : NSObject
{

}

/** returns a shared instance of the CCConfiguration */
+(CCConfiguration *) sharedConfiguration;

/** returns whether or not an OpenGL is supported */
- (BOOL) checkForGLExtension:(NSString *)searchName;

/** returns the current device */
-(NSInteger) runningDevice;

/** dumps in the console the CCConfiguration information.
 @since v2.1
 */
-(void) dumpInfo;


@end
