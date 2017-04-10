//
//  ccTypeConvert.h
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import <Foundation/Foundation.h>

#import "math/Vec2.h"
#import "math/CCGeometry.h"
#import "math/CCAffineTransform.h"
#import <string>
#import "2d/sprite-nodes/CCSprite.h"
#import "2d/base-nodes/CCNode.h"
#import "base/CCVector.h"
#import "base/CCMap.h"
#import "platform/CCImage.h"

@interface ccTypeConvert : NSObject
{
    
}

// CGPoint <--> Point
+(CGPoint)PointToCGPoint:(cocos2d::Point) point;
+(cocos2d::Point)CGPointToPoint:(CGPoint) point;

// CGSize <--> Size
+(CGSize)SizeToCGSize:(cocos2d::Size) size;
+(cocos2d::Size)CGSizeToSize:(CGSize) size;

// CGRect <--> Rect
+(CGRect)RectToCGRect:(cocos2d::Rect) rect;
+(cocos2d::Rect)CGRectToRect:(CGRect) rect;

// CGAffineTransform <--> AffineTransform
+(CGAffineTransform)AffineTransformToCGAffineTransform:(cocos2d::AffineTransform) af;
+(cocos2d::AffineTransform)CGAffineTransformToAffineTransform:(CGAffineTransform) af;

// NSString <--> string
+(NSString*)stringToNSString:(std::string) str;
+(std::string)NSStringTostring:(NSString*) str;

// CCArray* <--> Vector
// Sprite
+(CCArray*)VectorSpriteToCCArray:(cocos2d::Vector<cocos2d::Sprite*>) vec;
+(cocos2d::Vector<cocos2d::Sprite*>)CCArrayToVectorSprite:(CCArray*) arr;
// Node
+(CCArray*)VectorNodeToCCArray:(cocos2d::Vector<cocos2d::Node*>) vec;
+(cocos2d::Vector<cocos2d::Node*>)CCArrayToVectorNode:(CCArray*) arr;

// NSArray* <--> Vector
// Sprite
+(NSArray*)VectorSpriteToNSArray:(cocos2d::Vector<cocos2d::Sprite*>) vec;
+(cocos2d::Vector<cocos2d::Sprite*>)NSArrayToVectorSprite:(NSArray*) arr;
// Node
+(NSArray*)VectorNodeToNSArray:(cocos2d::Vector<cocos2d::Node*>) vec;
+(cocos2d::Vector<cocos2d::Node*>)NSArrayToVectorNode:(NSArray*) arr;

// NSMutableArray* <—> Vector
// Sprite
+(NSMutableArray*)VectorSpriteToNSMutableArray:(cocos2d::Vector<cocos2d::Sprite*>) vec;
+(cocos2d::Vector<cocos2d::Sprite*>)NSMutableArrayToVectorSprite:(NSMutableArray*) arr;
// Node
+(NSMutableArray*)VectorNodeToNSMutableArray:(cocos2d::Vector<cocos2d::Sprite*>) vec;
+(cocos2d::Vector<cocos2d::Node*>)NSMutableArrayToVectorNode:(NSMutableArray*) arr;

// NSDictionary* <—> Map
// Sprite
+(NSDictionary*)MapSpriteToNSDictionary:(cocos2d::Map<std::string, cocos2d::Sprite*>) m;
+(cocos2d::Map<std::string, cocos2d::Sprite*>)NSDictionaryToMapSprite:(NSDictionary*) dic;
// Node
+(NSDictionary*)MapNodeToNSDictionary:(cocos2d::Map<std::string, cocos2d::Node*>) m;
+(cocos2d::Map<std::string, cocos2d::Node*>)NSDictionaryToMapNode:(NSDictionary*) dic;

// CGImage* <--> Image
+(CGImageRef)ImageToCGImage:(cocos2d::Image*) img;
+(cocos2d::Image*)CGImageToImage:(CGImageRef) cgimg;

@end
