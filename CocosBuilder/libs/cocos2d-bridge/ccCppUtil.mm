//
//  ccCppUtil.m
//  CocosBuilder
//
//  Created by Leem on 2017/4/26.
//
//

#import "ccCppUtil.h"
#import <string>
#import <dirent.h>
#import <iostream>
#import <fstream>
#import <sstream>

@implementation ccCppUtil

// NSStringUtil
+(NSString*)NSStringSubString:(NSString*)src byLastStr:(NSString*) lastStr;
{
    std::string str_src = std::string([src UTF8String]);
    std::string str_lastStr = std::string([lastStr UTF8String]);
    size_t index = str_src.find_last_of(str_lastStr);
    if(index != std::string::npos)
    {
        std::string str_result = str_src.substr(0, index + 1);
        return [NSString stringWithUTF8String:str_result.c_str()];
    }
    else
    {
        return src;
    }
}

// LogicUtil
+(NSString*)findUnusedFont:(NSString*)path
{
    NSString* str_result = [NSString string];
    
    NSMutableArray* arr_fntfile = [NSMutableArray array];
    [ccCppUtil findAllFontFile:path toArr:arr_fntfile];
    [ccCppUtil deleteUsedFontFile:path fromArr:arr_fntfile];
    
    for(int i = 0; i < [arr_fntfile count]; ++i)
    {
        NSString* s_absolute = [arr_fntfile objectAtIndex:i];
        
        std::string str([s_absolute UTF8String]);
        int pos = str.find([path UTF8String]) + [path length];
        
        NSString* s_relative = [NSString stringWithUTF8String:(str.substr(pos).c_str())];
        
        str_result = [str_result stringByAppendingString:s_relative];
        if(i < [arr_fntfile count] - 1)
            str_result = [str_result stringByAppendingFormat:@"\n"];
    }
    
    return str_result;
}

+(void)findAllFontFile:(NSString*)path toArr:(NSMutableArray*)arr
{
    struct dirent* ent = NULL;
    DIR* dir = opendir([path UTF8String]);
    
    while((ent = readdir(dir)) != NULL)
    {
        if(ent->d_type == 8)
        {
            // is file
            std::string str_name = std::string(ent->d_name);
            if(str_name.find(".fnt") != std::string::npos)
            {
                NSString* path_new = [NSString stringWithFormat:@"%s%s", [path UTF8String], ent->d_name];
                [arr addObject:path_new];
            }
        }
        else if(ent->d_type == 4)
        {
            // is dir
            if(strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
                continue;
            
            NSString* path_new = [NSString stringWithFormat:@"%s%s/", [path UTF8String], ent->d_name];
            [ccCppUtil findAllFontFile:path_new toArr:arr];
        }
    }
}

+(void)deleteUsedFontFile:(NSString*)path fromArr:(NSMutableArray*)arr
{
    struct dirent* ent = NULL;
    DIR* dir = opendir([path UTF8String]);
    
    while((ent = readdir(dir)) != NULL)
    {
        if(ent->d_type == 8)
        {
            // is file
            std::string str_name = std::string(ent->d_name);
            if(str_name.find(".ccb") != std::string::npos)
            {
                NSString* path_file = [NSString stringWithFormat:@"%s%s", [path UTF8String], ent->d_name];
                std::ifstream ifs([path_file UTF8String]);
                if(ifs)
                {
                    std::ostringstream os;
                    os << ifs.rdbuf();
                    std::string str_buffer(os.str());
                    
                    for(int i = [arr count] - 1; i >= 0; --i)
                    {
                        NSString* file_path = [arr objectAtIndex:i];
                        std::string str_file_name([file_path UTF8String]);
                        str_file_name = str_file_name.substr(str_file_name.find_last_of("/") + 1);
                        
                        // find
                        if(str_buffer.find(str_file_name) != std::string::npos)
                        {
                            [arr removeObjectAtIndex:i];
                        }
                    }
                }
            }
        }
        else if(ent->d_type == 4)
        {
            // is dir
            if(strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
                continue;
            
            NSString* path_new = [NSString stringWithFormat:@"%s%s/", [path UTF8String], ent->d_name];
            [ccCppUtil deleteUsedFontFile:path_new fromArr:arr];
        }
    }
}

@end
