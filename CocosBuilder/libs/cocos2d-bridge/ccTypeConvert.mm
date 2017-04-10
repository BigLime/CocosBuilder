//
//  ccTypeConvert.m
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import "ccTypeConvert.h"

#import "CCNode.h"
#import "CCSprite.h"
#import "CCAnimation.h"

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

// SpriteFrame
+(cocos2d::Vector<cocos2d::SpriteFrame*>)NSArrayToVectorSpriteFrame:(NSArray*) arr
{
    cocos2d::Vector<cocos2d::SpriteFrame*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::SpriteFrame* frame_i = (cocos2d::SpriteFrame*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(frame_i);
    }
    return vec;
}

// AnimationFrame
+(cocos2d::Vector<cocos2d::AnimationFrame*>)NSArrayToVectorAnimationFrame:(NSArray*) arr
{
    cocos2d::Vector<cocos2d::AnimationFrame*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::AnimationFrame* frame_i = (cocos2d::AnimationFrame*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(frame_i);
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

// AnimationFrame
+(NSMutableArray*)VectorAnimationFrameToNSMutableArray:(cocos2d::Vector<cocos2d::AnimationFrame*>) vec
{
    NSMutableArray* arr = [[[NSMutableArray alloc] initWithCapacity:vec.size()] autorelease];
    for(ssize_t i = 0; i < vec.size(); ++i)
    {
        CCAnimationFrame* frame_i = [[[CCAnimationFrame alloc] initWithObject:vec.at(i)] autorelease];
        [arr addObject:frame_i];
    }
    return arr;
}

+(cocos2d::Vector<cocos2d::AnimationFrame*>)NSMutableArrayToVectorAnimationFrame:(NSMutableArray*) arr
{
    cocos2d::Vector<cocos2d::AnimationFrame*> vec;
    for(ssize_t i = 0; i < [arr count]; ++i)
    {
        cocos2d::AnimationFrame* frame_i = (cocos2d::AnimationFrame*)[[arr objectAtIndex:i] getImpl];
        vec.pushBack(frame_i);
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

// CGImage* <--> Image
+(CGImageRef)ImageToCGImage:(cocos2d::Image*) img
{
    NSData* data = [[[NSData alloc] initWithBytes:img->getData() length:img->getDataLen()] autorelease];
    NSBitmapImageRep* nsimg = [[[NSBitmapImageRep alloc] initWithData:data] autorelease];
    return [nsimg CGImage];
}

+(cocos2d::Image*)CGImageToImage:(CGImageRef) cgimg
{
    size_t width = CGImageGetWidth(cgimg);
    size_t height = CGImageGetHeight(cgimg);
    size_t bitsPerComponent = CGImageGetBitsPerComponent(cgimg);
    size_t bytesPerRow = CGImageGetBytesPerRow(cgimg);
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(cgimg);
    uint32_t bitmapInfo = CGImageGetBitmapInfo(cgimg);
    size_t lenth = width * height * 4;
    void* data = malloc(lenth);
    CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    
    cocos2d::Image* img = new cocos2d::Image();
    img->initWithImageData((unsigned char *)lenth, lenth);
    free(data);
    return img;
}

// ccBlendFunc <--> cocos2d::BlendFunc
+(ccBlendFunc)BlendFuncToccBlendFunc:(cocos2d::BlendFunc)src
{
    ccBlendFunc dst = {};
    dst.src = src.src;
    dst.dst = src.dst;
    return dst;
}

+(cocos2d::BlendFunc)ccBlendFuncToBlendFunc:(ccBlendFunc)src
{
    cocos2d::BlendFunc dst = {};
    dst.src = src.src;
    dst.dst = src.dst;
    return dst;
}

// ccColor3B <--> cocos2d::Color3B
+(ccColor3B) Color3BToccColor3B: (cocos2d::Color3B) src
{
    ccColor3B c = {src.r, src.g, src.b};
    return c;
}

+(cocos2d::Color3B) ccColor3BToColor3B: (ccColor3B) src
{
    return cocos2d::Color3B(src.r, src.g, src.b);
}

// ccColor4B <--> cocos2d::Color4B
+(ccColor4B) Color4BToccColor4B: (cocos2d::Color4B) src
{
    ccColor4B c = {src.r, src.g, src.b, src.a};
    return c;
}

+(cocos2d::Color4B) ccColor4BToColor4B: (ccColor4B) src
{
    return cocos2d::Color4B(src.r, src.g, src.b, src.a);
}

// ccColor4F <--> cocos2d::Color4F
+(ccColor4F) Color4FToccColor4F: (cocos2d::Color4F) src
{
    ccColor4F c = {src.r, src.g, src.b, src.a};
    return c;
}

+(cocos2d::Color4F) ccColor4FToColor4F: (ccColor4F) src
{
    return cocos2d::Color4F(src.r, src.g, src.b, src.a);
}

// ccVertex2F <--> cocos2d::Vec2
+(ccVertex2F) Vec2ToccVertex2F: (cocos2d::Vec2) src
{
    ccVertex2F c = {src.x, src.y};
    return c;
}

+(cocos2d::Vec2) ccVertex2FToVec2: (ccVertex2F) src
{
    return cocos2d::Vec2(src.x, src.y);
}

// ccVertex3F <--> cocos2d::Vec3
+(ccVertex3F) Vec3ToccVertex3F: (cocos2d::Vec3) src
{
    ccVertex3F c = {src.x, src.y, src.z};
    return c;
}

+(cocos2d::Vec3) ccVertex3FToVec3: (ccVertex3F) src
{
    return cocos2d::Vec3(src.x, src.y, src.z);
}

// ccTex2F <--> cocos2d::Tex2F
+(ccTex2F) Tex2FToccTex2F: (cocos2d::Tex2F) src
{
    ccTex2F c = {src.u, src.v};
    return c;
}

+(cocos2d::Tex2F) ccTex2FToTex2F: (ccTex2F) src
{
    return cocos2d::Tex2F(src.u, src.v);
}

// ccPointSprite <--> cocos2d::PointSprite
+(ccPointSprite) PointSpriteToccPointSprite: (cocos2d::PointSprite) src
{
    ccPointSprite c;
    c.pos = [ccTypeConvert Vec2ToccVertex2F:src.pos];
    c.color = [ccTypeConvert Color4BToccColor4B:src.color];
    c.size = src.size;
    return c;
}

+(cocos2d::PointSprite) ccPointSpriteToPointSprite: (ccPointSprite) src
{
    cocos2d::PointSprite c;
    c.pos = [ccTypeConvert ccVertex2FToVec2:src.pos];
    c.color = [ccTypeConvert ccColor4BToColor4B:src.color];
    c.size = src.size;
    return c;
}

// ccQuad2 <--> cocos2d::Quad2
+(ccQuad2) Quad2ToccQuad2: (cocos2d::Quad2) src
{
    ccQuad2 c;
    c.tl = [ccTypeConvert Vec2ToccVertex2F:src.tl];
    c.tr = [ccTypeConvert Vec2ToccVertex2F:src.tr];
    c.bl = [ccTypeConvert Vec2ToccVertex2F:src.bl];
    c.br = [ccTypeConvert Vec2ToccVertex2F:src.br];
    return c;
}

+(cocos2d::Quad2) ccQuad2ToQuad2: (ccQuad2) src
{
    cocos2d::Quad2 c;
    c.tl = [ccTypeConvert ccVertex2FToVec2:src.tl];
    c.tr = [ccTypeConvert ccVertex2FToVec2:src.tr];
    c.bl = [ccTypeConvert ccVertex2FToVec2:src.bl];
    c.br = [ccTypeConvert ccVertex2FToVec2:src.br];
    return c;
}

// ccQuad3 <--> cocos2d::Quad3
+(ccQuad3) Quad3ToccQuad3: (cocos2d::Quad3) src
{
    ccQuad3 c;
    c.tl = [ccTypeConvert Vec3ToccVertex3F:src.tl];
    c.tr = [ccTypeConvert Vec3ToccVertex3F:src.tr];
    c.bl = [ccTypeConvert Vec3ToccVertex3F:src.bl];
    c.br = [ccTypeConvert Vec3ToccVertex3F:src.br];
    return c;
}

+(cocos2d::Quad3) ccQuad3ToQuad3: (ccQuad3) src
{
    cocos2d::Quad3 c;
    c.tl = [ccTypeConvert ccVertex3FToVec3:src.tl];
    c.tr = [ccTypeConvert ccVertex3FToVec3:src.tr];
    c.bl = [ccTypeConvert ccVertex3FToVec3:src.bl];
    c.br = [ccTypeConvert ccVertex3FToVec3:src.br];
    return c;
}

// ccV2F_C4B_T2F <--> cocos2d::V2F_C4B_T2F
+(ccV2F_C4B_T2F) V2F_C4B_T2FToccV2F_C4B_T2F: (cocos2d::V2F_C4B_T2F) src
{
    ccV2F_C4B_T2F c;
    c.vertices = [ccTypeConvert Vec2ToccVertex2F:src.vertices];
    c.colors = [ccTypeConvert Color4BToccColor4B:src.colors];
    c.texCoords = [ccTypeConvert Tex2FToccTex2F:src.texCoords];
    return c;
}

+(cocos2d::V2F_C4B_T2F) ccV2F_C4B_T2FToV2F_C4B_T2F: (ccV2F_C4B_T2F) src
{
    cocos2d::V2F_C4B_T2F c;
    c.vertices = [ccTypeConvert ccVertex2FToVec2:src.vertices];
    c.colors = [ccTypeConvert ccColor4BToColor4B:src.colors];
    c.texCoords = [ccTypeConvert ccTex2FToTex2F:src.texCoords];
    return c;
}

// ccV2F_C4F_T2F <--> cocos2d::V2F_C4F_T2F
+(ccV2F_C4F_T2F) V2F_C4F_T2FToccV2F_C4F_T2F: (cocos2d::V2F_C4F_T2F) src
{
    ccV2F_C4F_T2F c;
    c.vertices = [ccTypeConvert Vec2ToccVertex2F:src.vertices];
    c.colors = [ccTypeConvert Color4FToccColor4F:src.colors];
    c.texCoords = [ccTypeConvert Tex2FToccTex2F:src.texCoords];
    return c;
}

+(cocos2d::V2F_C4F_T2F) ccV2F_C4F_T2FToV2F_C4F_T2F: (ccV2F_C4F_T2F) src
{
    cocos2d::V2F_C4F_T2F c;
    c.vertices = [ccTypeConvert ccVertex2FToVec2:src.vertices];
    c.colors = [ccTypeConvert ccColor4FToColor4F:src.colors];
    c.texCoords = [ccTypeConvert ccTex2FToTex2F:src.texCoords];
    return c;
}

//// ccV3F_C4F_T2F <--> cocos2d::
//+(ccV3F_C4F_T2F) ToccV3F_C4F_T2F: () src;
//+() ccV3F_C4F_T2FTo: (ccV3F_C4F_T2F) src;
//
//// ccV3F_C4F_T2F_Quad <--> cocos2d::
//+() To: () src;
//+() To: () src;

// ccV3F_C4B_T2F <--> cocos2d::V3F_C4B_T2F
+(ccV3F_C4B_T2F) V3F_C4B_T2FToccV3F_C4B_T2F: (cocos2d::V3F_C4B_T2F) src
{
    ccV3F_C4B_T2F c;
    c.vertices = [ccTypeConvert Vec3ToccVertex3F:src.vertices];
    c.colors = [ccTypeConvert Color4BToccColor4B:src.colors];
    c.texCoords = [ccTypeConvert Tex2FToccTex2F:src.texCoords];
    return c;
}

+(cocos2d::V3F_C4B_T2F) ccV3F_C4B_T2FToV3F_C4B_T2F: (ccV3F_C4B_T2F) src
{
    cocos2d::V3F_C4B_T2F c;
    c.vertices = [ccTypeConvert ccVertex3FToVec3:src.vertices];
    c.colors = [ccTypeConvert ccColor4BToColor4B:src.colors];
    c.texCoords = [ccTypeConvert ccTex2FToTex2F:src.texCoords];
    return c;
}

// ccV2F_C4B_T2F_Triangle <--> cocos2d::V2F_C4B_T2F_Triangle
+(ccV2F_C4B_T2F_Triangle) V2F_C4B_T2F_TriangleToccV2F_C4B_T2F_Triangle: (cocos2d::V2F_C4B_T2F_Triangle) src
{
    ccV2F_C4B_T2F_Triangle c;
    c.a = [ccTypeConvert V2F_C4B_T2FToccV2F_C4B_T2F:src.a];
    c.b = [ccTypeConvert V2F_C4B_T2FToccV2F_C4B_T2F:src.b];
    c.c = [ccTypeConvert V2F_C4B_T2FToccV2F_C4B_T2F:src.c];
    return c;
}

+(cocos2d::V2F_C4B_T2F_Triangle) ccV2F_C4B_T2F_TriangleToV2F_C4B_T2F_Triangle: (ccV2F_C4B_T2F_Triangle) src
{
    cocos2d::V2F_C4B_T2F_Triangle c;
    c.a = [ccTypeConvert ccV2F_C4B_T2FToV2F_C4B_T2F:src.a];
    c.b = [ccTypeConvert ccV2F_C4B_T2FToV2F_C4B_T2F:src.b];
    c.c = [ccTypeConvert ccV2F_C4B_T2FToV2F_C4B_T2F:src.c];
    return c;
}

// ccV2F_C4B_T2F_Quad <--> cocos2d::V2F_C4B_T2F_Quad
+(ccV2F_C4B_T2F_Quad) V2F_C4B_T2F_QuadToccV2F_C4B_T2F_Quad: (cocos2d::V2F_C4B_T2F_Quad) src
{
    ccV2F_C4B_T2F_Quad c;
    c.bl = [ccTypeConvert V2F_C4B_T2FToccV2F_C4B_T2F:src.bl];
    c.br = [ccTypeConvert V2F_C4B_T2FToccV2F_C4B_T2F:src.br];
    c.tl = [ccTypeConvert V2F_C4B_T2FToccV2F_C4B_T2F:src.tl];
    c.tr = [ccTypeConvert V2F_C4B_T2FToccV2F_C4B_T2F:src.tr];
    return c;
}

+(cocos2d::V2F_C4B_T2F_Quad) ccV2F_C4B_T2F_QuadToV2F_C4B_T2F_Quad: (ccV2F_C4B_T2F_Quad) src
{
    cocos2d::V2F_C4B_T2F_Quad c;
    c.bl = [ccTypeConvert ccV2F_C4B_T2FToV2F_C4B_T2F:src.bl];
    c.br = [ccTypeConvert ccV2F_C4B_T2FToV2F_C4B_T2F:src.br];
    c.tl = [ccTypeConvert ccV2F_C4B_T2FToV2F_C4B_T2F:src.tl];
    c.tr = [ccTypeConvert ccV2F_C4B_T2FToV2F_C4B_T2F:src.tr];
    return c;
}

// ccV3F_C4B_T2F_Quad <--> cocos2d::V3F_C4B_T2F_Quad
+(ccV3F_C4B_T2F_Quad) V3F_C4B_T2F_QuadToccV3F_C4B_T2F_Quad: (cocos2d::V3F_C4B_T2F_Quad) src
{
    ccV3F_C4B_T2F_Quad c;
    c.tl = [ccTypeConvert V3F_C4B_T2FToccV3F_C4B_T2F:src.tl];
    c.bl = [ccTypeConvert V3F_C4B_T2FToccV3F_C4B_T2F:src.bl];
    c.tr = [ccTypeConvert V3F_C4B_T2FToccV3F_C4B_T2F:src.tr];
    c.br = [ccTypeConvert V3F_C4B_T2FToccV3F_C4B_T2F:src.br];
    return c;
}

+(cocos2d::V3F_C4B_T2F_Quad) ccV3F_C4B_T2F_QuadToV3F_C4B_T2F_Quad: (ccV3F_C4B_T2F_Quad) src
{
    cocos2d::V3F_C4B_T2F_Quad c;
    c.tl = [ccTypeConvert ccV3F_C4B_T2FToV3F_C4B_T2F:src.tl];
    c.bl = [ccTypeConvert ccV3F_C4B_T2FToV3F_C4B_T2F:src.bl];
    c.tr = [ccTypeConvert ccV3F_C4B_T2FToV3F_C4B_T2F:src.tr];
    c.br = [ccTypeConvert ccV3F_C4B_T2FToV3F_C4B_T2F:src.br];
    return c;
}

// ccV2F_C4F_T2F_Quad <--> cocos2d::V2F_C4F_T2F_Quad
+(ccV2F_C4F_T2F_Quad) V2F_C4F_T2F_QuadToccV2F_C4F_T2F_Quad: (cocos2d::V2F_C4F_T2F_Quad) src
{
    ccV2F_C4F_T2F_Quad c;
    c.bl = [ccTypeConvert V2F_C4F_T2FToccV2F_C4F_T2F:src.bl];
    c.br = [ccTypeConvert V2F_C4F_T2FToccV2F_C4F_T2F:src.br];
    c.tl = [ccTypeConvert V2F_C4F_T2FToccV2F_C4F_T2F:src.tl];
    c.tr = [ccTypeConvert V2F_C4F_T2FToccV2F_C4F_T2F:src.tr];
    return c;
}

+(cocos2d::V2F_C4F_T2F_Quad) ccV2F_C4F_T2F_QuadToV2F_C4F_T2F_Quad: (ccV2F_C4F_T2F_Quad) src
{
    cocos2d::V2F_C4F_T2F_Quad c;
    c.bl = [ccTypeConvert ccV2F_C4F_T2FToV2F_C4F_T2F:src.bl];
    c.br = [ccTypeConvert ccV2F_C4F_T2FToV2F_C4F_T2F:src.br];
    c.tl = [ccTypeConvert ccV2F_C4F_T2FToV2F_C4F_T2F:src.tl];
    c.tr = [ccTypeConvert ccV2F_C4F_T2FToV2F_C4F_T2F:src.tr];
    return c;
}

//// ccT2F_Quad <--> cocos2d::T2F_Quad
//+(ccT2F_Quad) T2F_QuadToccT2F_Quad: (cocos2d::T2F_Quad) src;
//+(cocos2d::T2F_Quad) ccT2F_QuadToT2F_Quad: (ccT2F_Quad) src;
//
//// ccAnimationFrameData <--> cocos2d::AnimationFrameData
//+(ccAnimationFrameData) AnimationFrameDataToccAnimationFrameData: (cocos2d::AnimationFrameData) src;
//+(cocos2d::AnimationFrameData) ccAnimationFrameDataToAnimationFrameData: (ccAnimationFrameData) src;

@end
