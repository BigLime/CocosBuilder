//
//  ccTypeConvert.m
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import "ccTypeConvert.h"
#import "cocos2d.h"

@implementation ccTypeConvert

// CGPoint <--> Point
+(CGPoint)PointToCGPoint:(cocos2d::Point) point
{
    CGPoint p;
    p.x = point.x;
    p.y = point.y;
    return p;
}

+(cocos2d::Point)CGPointToPoint:(CGPoint) point
{
    cocos2d::Point p(point.x, point.y);
    return p;
}

// CGSize <--> Size
+(CGSize)SizeToCGSize:(cocos2d::Size) size
{
    CGSize s;
    s.width = size.width;
    s.height = size.height;
    return s;
}

+(cocos2d::Size)CGSizeToSize:(CGSize) size
{
    cocos2d::Size s(size.width, size.height);
    return s;
}

// CGRect <--> Rect
+(CGRect)RectToCGRect:(cocos2d::Rect) rect
{
    CGRect r;
    r.size = [ccTypeConvert SizeToCGSize:rect.size];
    r.origin = [ccTypeConvert PointToCGPoint:rect.origin];
    return r;
}

+(cocos2d::Rect)CGRectToRect:(CGRect) rect
{
    cocos2d::Rect r(rect.origin.x,
                    rect.origin.y,
                    rect.size.width,
                    rect.size.height);
    return r;
}

// CGAffineTransform <--> AffineTransform
+(CGAffineTransform)AffineTransformToCGAffineTransform:(cocos2d::AffineTransform) af
{
    CGAffineTransform a;
    a.a = af.a;
    a.b = af.b;
    a.c = af.c;
    a.d = af.d;
    a.tx = af.tx;
    a.ty = af.ty;
    return a;
}

+(cocos2d::AffineTransform)CGAffineTransformToAffineTransform:(CGAffineTransform) af
{
    cocos2d::AffineTransform a;
    a.a = af.a;
    a.b = af.b;
    a.c = af.c;
    a.d = af.d;
    a.tx = af.tx;
    a.ty = af.ty;
    return a;
}

// NSString <--> string
+(NSString*)stringToNSString:(std::string) str
{
    NSString* s = [NSString stringWithUTF8String:str.c_str()];
    return s;
}

+(std::string)NSStringTostring:(NSString*) str
{
    return std::string([str UTF8String]);
}

// CCArray* <--> Vector
// Sprite
+(CCArray*)VectorSpriteToCCArray:(cocos2d::Vector<cocos2d::Sprite*>) vec
{
    CCArray* arr = [[[CCArray alloc] initWithCapacity:vec.size()] autorelease];
    for(ssize_t i = 0; i < vec.size(); ++i)
    {
        CCSprite* sprite_i = [[[CCSprite alloc] initWithObject:vec.at(i)] autorelease];
        [arr addObject:sprite_i];
    }
    return arr;
}

+(cocos2d::Vector<cocos2d::Sprite*>)CCArrayToVectorSprite:(CCArray*) arr
{
    cocos2d::Vector<cocos2d::Sprite*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::Sprite* sprite_i = (cocos2d::Sprite*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(sprite_i);
    }
    return vec;
}

// Node
+(CCArray*)VectorNodeToCCArray:(cocos2d::Vector<cocos2d::Node*>) vec
{
    CCArray* arr = [[[CCArray alloc] initWithCapacity:vec.size()] autorelease];
    for(ssize_t i = 0; i < vec.size(); ++i)
    {
        CCNode* node_i = [[[CCNode alloc] initWithObject:vec.at(i)] autorelease];
        [arr addObject:node_i];
    }
    return arr;
}

+(cocos2d::Vector<cocos2d::Node*>)CCArrayToVectorNode:(CCArray*) arr
{
    cocos2d::Vector<cocos2d::Node*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::Node* node_i = (cocos2d::Node*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(node_i);
    }
    return vec;
}

// NSArray* <--> Vector
// Sprite
+(NSArray*)VectorSpriteToNSArray:(cocos2d::Vector<cocos2d::Sprite*>) vec
{
    NSArray* arr = [[[NSArray alloc] init] autorelease];
    for(ssize_t i = 0; i < vec.size(); ++i)
    {
        CCSprite* sprite_i = [[[CCSprite alloc] initWithObject:vec.at(i)] autorelease];
        [arr addObject:sprite_i];
    }
    return arr;
}

+(cocos2d::Vector<cocos2d::Sprite*>)NSArrayToVectorSprite:(NSArray*) arr
{
    cocos2d::Vector<cocos2d::Sprite*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::Sprite* sprite_i = (cocos2d::Sprite*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(sprite_i);
    }
    return vec;
}

// Node
+(NSArray*)VectorNodeToNSArray:(cocos2d::Vector<cocos2d::Node*>) vec
{
    NSArray* arr = [[[NSArray alloc] init] autorelease];
    for(ssize_t i = 0; i < vec.size(); ++i)
    {
        CCNode* node_i = [[[CCNode alloc] initWithObject:vec.at(i)] autorelease];
        [arr addObject:node_i];
    }
    return arr;
}

+(cocos2d::Vector<cocos2d::Node*>)NSArrayToVectorNode:(NSArray*) arr
{
    cocos2d::Vector<cocos2d::Node*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::Node* node_i = (cocos2d::Node*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(node_i);
    }
    return vec;
}

// NSMutableArray* <—> Vector
// Sprite
+(NSMutableArray*)VectorSpriteToNSMutableArray:(cocos2d::Vector<cocos2d::Sprite*>) vec
{
    NSMutableArray* arr = [[[NSMutableArray alloc] initWithCapacity:vec.size()] autorelease];
    for(ssize_t i = 0; i < vec.size(); ++i)
    {
        CCSprite* sprite_i = [[[CCSprite alloc] initWithObject:vec.at(i)] autorelease];
        [arr addObject:sprite_i];
    }
    return arr;
}

+(cocos2d::Vector<cocos2d::Sprite*>)NSMutableArrayToVectorSprite:(NSMutableArray*) arr
{
    cocos2d::Vector<cocos2d::Sprite*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::Sprite* sprite_i = (cocos2d::Sprite*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(sprite_i);
    }
    return vec;
}

// Node
+(NSMutableArray*)VectorNodeToNSMutableArray:(cocos2d::Vector<cocos2d::Sprite*>) vec
{
    NSMutableArray* arr = [[[NSMutableArray alloc] initWithCapacity:vec.size()] autorelease];
    for(ssize_t i = 0; i < vec.size(); ++i)
    {
        CCNode* node_i = [[[CCNode alloc] initWithObject:vec.at(i)] autorelease];
        [arr addObject:node_i];
    }
    return arr;
}

+(cocos2d::Vector<cocos2d::Node*>)NSMutableArrayToVectorNode:(NSMutableArray*) arr
{
    cocos2d::Vector<cocos2d::Node*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::Node* node_i = (cocos2d::Node*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(node_i);
    }
    return vec;
}

// NSDictionary* <—> Map
// Sprite
+(NSDictionary*)MapSpriteToNSDictionary:(cocos2d::Map<std::string, cocos2d::Sprite*>) m
{
    NSDictionary* dic = [[[NSDictionary alloc] init] autorelease];
    for(auto i : m)
    {
        CCSprite* sprite_i = [[[CCSprite alloc] initWithObject:i.second] autorelease];
        NSString* key = [ccTypeConvert stringToNSString:i.first];
        [dic setValue:sprite_i forKey:key];
    }
    return dic;
}
+(cocos2d::Map<std::string, cocos2d::Sprite*>)NSDictionaryToMapSprite:(NSDictionary*) dic
{
    cocos2d::Map<std::string, cocos2d::Sprite*> m;
    NSArray* arr_key = [dic allKeys];
    for(NSString *key in arr_key )
    {
        CCSprite* sprite_i = [dic objectForKey:key];
        m.insert([ccTypeConvert NSStringTostring:key], (cocos2d::Sprite*)[sprite_i getImpl]);
    }
    return m;
}

// Node
+(NSDictionary*)MapNodeToNSDictionary:(cocos2d::Map<std::string, cocos2d::Node*>) m
{
    NSDictionary* dic = [[[NSDictionary alloc] init] autorelease];
    for(auto i : m)
    {
        CCNode* sprite_i = [[[CCNode alloc] initWithObject:i.second] autorelease];
        NSString* key = [ccTypeConvert stringToNSString:i.first];
        [dic setValue:sprite_i forKey:key];
    }
    return dic;
}
+(cocos2d::Map<std::string, cocos2d::Node*>)NSDictionaryToMapNode:(NSDictionary*) dic
{
    cocos2d::Map<std::string, cocos2d::Node*> m;
    NSArray* arr_key = [dic allKeys];
    for(NSString *key in arr_key )
    {
        CCNode* sprite_i = [dic objectForKey:key];
        m.insert([ccTypeConvert NSStringTostring:key], (cocos2d::Node*)[sprite_i getImpl]);
    }
    return m;
}

@end
