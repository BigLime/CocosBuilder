//
//  SimpleAudioEngine.h
//  CocosBuilder
//
//  Created by Leem on 17/4/11.
//
//

#import <Foundation/Foundation.h>
#import <OpenAL/al.h>

@interface SimpleAudioEngine : NSObject {
    
}

/** returns the shared instance of the SimpleAudioEngine object */
+ (SimpleAudioEngine*) sharedEngine;

-(ALuint) playEffect:(NSString*) filePath loop:(BOOL)loop pitch:(Float32) pitch pan:(Float32) pan gain:(Float32) gain;

@end
