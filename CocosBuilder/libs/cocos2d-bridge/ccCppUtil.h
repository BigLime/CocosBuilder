//
//  ccCpp.h
//  CocosBuilder
//
//  Created by Leem on 2017/4/26.
//
//

#import <Foundation/Foundation.h>

@interface ccCppUtil : NSObject

// NSStringUtil
+(NSString*)NSStringSubString:(NSString*)src byLastStr:(NSString*) lastStr;

// LogicUtil
+(NSString*)findUnusedFont:(NSString*)path;

@end
