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
#import "2d/CCNode.h"
#import "2d/CCSprite.h"
#import "2d/CCAnimation.h"
#import "2d/CCSpriteFrame.h"
#import "base/CCVector.h"
#import "base/CCMap.h"
#import "base/CCValue.h"
#import "platform/CCImage.h"
#import "support/CCArray.h"
#import "ccTypes.h"

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

// NSArray* <--> Vector NSArray是不可改变的
// Sprite
+(cocos2d::Vector<cocos2d::Sprite*>)NSArrayToVectorSprite:(NSArray*) arr;
// Node
+(cocos2d::Vector<cocos2d::Node*>)NSArrayToVectorNode:(NSArray*) arr;
// SpriteFrame
+(cocos2d::Vector<cocos2d::SpriteFrame*>)NSArrayToVectorSpriteFrame:(NSArray*) arr;
// AnimationFrame
+(cocos2d::Vector<cocos2d::AnimationFrame*>)NSArrayToVectorAnimationFrame:(NSArray*) arr;

// NSMutableArray* <—> Vector
// Sprite
+(NSMutableArray*)VectorSpriteToNSMutableArray:(cocos2d::Vector<cocos2d::Sprite*>) vec;
+(cocos2d::Vector<cocos2d::Sprite*>)NSMutableArrayToVectorSprite:(NSMutableArray*) arr;
// Node
+(NSMutableArray*)VectorNodeToNSMutableArray:(cocos2d::Vector<cocos2d::Sprite*>) vec;
+(cocos2d::Vector<cocos2d::Node*>)NSMutableArrayToVectorNode:(NSMutableArray*) arr;
// AnimationFrame
+(NSMutableArray*)VectorAnimationFrameToNSMutableArray:(cocos2d::Vector<cocos2d::AnimationFrame*>) vec;
+(cocos2d::Vector<cocos2d::AnimationFrame*>)NSMutableArrayToVectorAnimationFrame:(NSMutableArray*) arr;

// CGImage* <--> Image
+(CGImageRef)ImageToCGImage:(cocos2d::Image*) img;
+(cocos2d::Image*)CGImageToImage:(CGImageRef) cgimg;

// ccBlendFunc <--> cocos2d::BlendFunc
+(ccBlendFunc) BlendFuncToccBlendFunc: (cocos2d::BlendFunc) src;
+(cocos2d::BlendFunc) ccBlendFuncToBlendFunc: (ccBlendFunc) src;

// ccColor3B <--> cocos2d::Color3B
+(ccColor3B) Color3BToccColor3B: (cocos2d::Color3B) src;
+(cocos2d::Color3B) ccColor3BToColor3B: (ccColor3B) src;

// ccColor4B <--> cocos2d::Color4B
+(ccColor4B) Color4BToccColor4B: (cocos2d::Color4B) src;
+(cocos2d::Color4B) ccColor4BToColor4B: (ccColor4B) src;

// ccColor4F <--> cocos2d::Color4F
+(ccColor4F) Color4FToccColor4F: (cocos2d::Color4F) src;
+(cocos2d::Color4F) ccColor4FToColor4F: (ccColor4F) src;

// ccVertex2F <--> cocos2d::Vec2
+(ccVertex2F) Vec2ToccVertex2F: (cocos2d::Vec2) src;
+(cocos2d::Vec2) ccVertex2FToVec2: (ccVertex2F) src;

// ccVertex3F <--> cocos2d::Vec3
+(ccVertex3F) Vec3ToccVertex3F: (cocos2d::Vec3) src;
+(cocos2d::Vec3) ccVertex3FToVec3: (ccVertex3F) src;

// ccTex2F <--> cocos2d::Tex2F
+(ccTex2F) Tex2FToccTex2F: (cocos2d::Tex2F) src;
+(cocos2d::Tex2F) ccTex2FToTex2F: (ccTex2F) src;

// ccPointSprite <--> cocos2d::PointSprite
+(ccPointSprite) PointSpriteToccPointSprite: (cocos2d::PointSprite) src;
+(cocos2d::PointSprite) ccPointSpriteToPointSprite: (ccPointSprite) src;

// ccQuad2 <--> cocos2d::Quad2
+(ccQuad2) Quad2ToccQuad2: (cocos2d::Quad2) src;
+(cocos2d::Quad2) ccQuad2ToQuad2: (ccQuad2) src;

// ccQuad3 <--> cocos2d::Quad3
+(ccQuad3) Quad3ToccQuad3: (cocos2d::Quad3) src;
+(cocos2d::Quad3) ccQuad3ToQuad3: (ccQuad3) src;

// ccV2F_C4B_T2F <--> cocos2d::V2F_C4B_T2F
+(ccV2F_C4B_T2F) V2F_C4B_T2FToccV2F_C4B_T2F: (cocos2d::V2F_C4B_T2F) src;
+(cocos2d::V2F_C4B_T2F) ccV2F_C4B_T2FToV2F_C4B_T2F: (ccV2F_C4B_T2F) src;

// ccV2F_C4F_T2F <--> cocos2d::V2F_C4F_T2F
+(ccV2F_C4F_T2F) V2F_C4F_T2FToccV2F_C4F_T2F: (cocos2d::V2F_C4F_T2F) src;
+(cocos2d::V2F_C4F_T2F) ccV2F_C4F_T2FToV2F_C4F_T2F: (ccV2F_C4F_T2F) src;

//// ccV3F_C4F_T2F <--> cocos2d::
//+(ccV3F_C4F_T2F) ToccV3F_C4F_T2F: () src;
//+() ccV3F_C4F_T2FTo: (ccV3F_C4F_T2F) src;
//
//// ccV3F_C4F_T2F_Quad <--> cocos2d::
//+() To: () src;
//+() To: () src;

// ccV3F_C4B_T2F <--> cocos2d::V3F_C4B_T2F
+(ccV3F_C4B_T2F) V3F_C4B_T2FToccV3F_C4B_T2F: (cocos2d::V3F_C4B_T2F) src;
+(cocos2d::V3F_C4B_T2F) ccV3F_C4B_T2FToV3F_C4B_T2F: (ccV3F_C4B_T2F) src;

// ccV2F_C4B_T2F_Triangle <--> cocos2d::V2F_C4B_T2F_Triangle
+(ccV2F_C4B_T2F_Triangle) V2F_C4B_T2F_TriangleToccV2F_C4B_T2F_Triangle: (cocos2d::V2F_C4B_T2F_Triangle) src;
+(cocos2d::V2F_C4B_T2F_Triangle) ccV2F_C4B_T2F_TriangleToV2F_C4B_T2F_Triangle: (ccV2F_C4B_T2F_Triangle) src;

// ccV2F_C4B_T2F_Quad <--> cocos2d::V2F_C4B_T2F_Quad
+(ccV2F_C4B_T2F_Quad) V2F_C4B_T2F_QuadToccV2F_C4B_T2F_Quad: (cocos2d::V2F_C4B_T2F_Quad) src;
+(cocos2d::V2F_C4B_T2F_Quad) ccV2F_C4B_T2F_QuadToV2F_C4B_T2F_Quad: (ccV2F_C4B_T2F_Quad) src;

// ccV3F_C4B_T2F_Quad <--> cocos2d::V3F_C4B_T2F_Quad
+(ccV3F_C4B_T2F_Quad) V3F_C4B_T2F_QuadToccV3F_C4B_T2F_Quad: (cocos2d::V3F_C4B_T2F_Quad) src;
+(cocos2d::V3F_C4B_T2F_Quad) ccV3F_C4B_T2F_QuadToV3F_C4B_T2F_Quad: (ccV3F_C4B_T2F_Quad) src;

// ccV2F_C4F_T2F_Quad <--> cocos2d::V2F_C4F_T2F_Quad
+(ccV2F_C4F_T2F_Quad) V2F_C4F_T2F_QuadToccV2F_C4F_T2F_Quad: (cocos2d::V2F_C4F_T2F_Quad) src;
+(cocos2d::V2F_C4F_T2F_Quad) ccV2F_C4F_T2F_QuadToV2F_C4F_T2F_Quad: (ccV2F_C4F_T2F_Quad) src;

//// ccT2F_Quad <--> cocos2d::T2F_Quad
//+(ccT2F_Quad) T2F_QuadToccT2F_Quad: (cocos2d::T2F_Quad) src;
//+(cocos2d::T2F_Quad) ccT2F_QuadToT2F_Quad: (ccT2F_Quad) src;
//
//// ccAnimationFrameData <--> cocos2d::AnimationFrameData
//+(ccAnimationFrameData) AnimationFrameDataToccAnimationFrameData: (cocos2d::AnimationFrameData) src;
//+(cocos2d::AnimationFrameData) ccAnimationFrameDataToAnimationFrameData: (ccAnimationFrameData) src;

@end
