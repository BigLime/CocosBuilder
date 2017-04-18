//
// CCLabelBMFont Wrapper
//
// author xiaobo.wang
//
// 2017-04-06 22:34:34
//

#import "CCLabelBMFont.h"
#import "2d/CCLabel.h"

#import "ccTypeConvert.h"

@implementation CCLabelBMFont

- (CCTextureAtlas*) textureAtlas
{
    return [[[CCTextureAtlas alloc ]initWithObject: ((cocos2d::TextureAtlas*)impl_)->getTexture()] autorelease];
}

- (ccBlendFunc) blendFunc
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return [ccTypeConvert BlendFuncToccBlendFunc:label->getBlendFunc()];
}
- (void) setBlendFunc:(ccBlendFunc)_blendFunc
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setBlendFunc([ccTypeConvert ccBlendFuncToBlendFunc:_blendFunc]);
}

// @synthesize alignment = _alignment;
-(void)setAlignment:(CCTextAlignment)alignment
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setAlignment([ccTypeConvert CCTextAlignmentToTextHAlignment:alignment]);
}

-(CCTextAlignment)alignment
{
    // TODO: no getter
    NSAssert(NO, @"no getter");
    return kCCTextAlignmentLeft;
}

// @synthesize cascadeColorEnabled = _cascadeColorEnabled, cascadeOpacityEnabled = _cascadeOpacityEnabled;

-(void)setCascadeColorEnabled:(BOOL)cascadeColorEnabled
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL)isCascadeColorEnabled
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return label->isCascadeColorEnabled();
}

-(void)setCascadeOpacityEnabled:(BOOL)cascadeOpacityEnabled
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL)isCascadeOpacityEnabled
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return label->isCascadeOpacityEnabled();
}

#pragma mark Label - Purge Cache
+(void) purgeCachedData
{
    // TODO: NO implement in cocos2d-x 3.14.
}

#pragma mark Label - Creation & Init

+(id) labelWithString:(NSString *)string fntFile:(NSString *)fntFile
{
    return [[[self alloc] initWithString:string fntFile:fntFile width:kCCLabelAutomaticWidth alignment:kCCTextAlignmentLeft imageOffset:CGPointZero] autorelease];
}

+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment
{
    return [[[self alloc] initWithString:string fntFile:fntFile width:width alignment:alignment imageOffset:CGPointZero] autorelease];
}

+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset
{
    return [[[self alloc] initWithString:string fntFile:fntFile width:width alignment:alignment imageOffset:offset] autorelease];
}

-(id) init
{
    cocos2d::Label* label = cocos2d::Label::create();
    label->retain();
    
    isNeedCCLabelDealloc = YES;
    impl_ = label;
    
    self = [super init:impl_];
    return self;
}

-(id) initWithString:(NSString*)theString fntFile:(NSString*)fntFile
{
    return [self initWithString:theString fntFile:fntFile width:kCCLabelAutomaticWidth alignment:kCCTextAlignmentLeft];
}

-(id) initWithString:(NSString*)theString fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment
{
    return [self initWithString:theString fntFile:fntFile width:width alignment:alignment imageOffset:CGPointZero];
}

// designated initializer
-(id) initWithString:(NSString*)theString fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset
{
    // TODO: convert CCTextAlignment, convert CGPoint.
    cocos2d::Point cppOffset = [ccTypeConvert CGPointToPoint: offset];
    cocos2d::TextHAlignment cppAlign = [ccTypeConvert CCTextAlignmentToTextHAlignment:alignment];
    
    cocos2d::Label* label = cocos2d::Label::createWithBMFont([fntFile UTF8String], [theString UTF8String], cppAlign, width, cppOffset);
    label->retain();
    
    isNeedCCLabelDealloc = YES;
    impl_ = label;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLabelDealloc)
    {
        cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
        label->release();
    }
    
    [super dealloc];
}

-(void) createFontChars
{
    // TODO: no implement in cocos2d-x cpp side.
    NSAssert(NO, @"no implement in cocos2d-x cpp side.");
}

#pragma mark Label - CCLabelProtocol protocol
-(NSString*) string
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return [NSString stringWithCString: label->getString().c_str() encoding:NSUTF8StringEncoding];
}

-(void) setCString:(char*)lb
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setString(lb);
}

- (void) setString:(NSString*)newString
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setString([newString UTF8String]);
}

#pragma mark Label - CCRGBAProtocol protocol

-(ccColor3B) color
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: label->getColor()];
}

-(ccColor3B) displayedColor
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: label->getDisplayedColor()];
}

-(void) setColor:(ccColor3B)color
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setColor([ccTypeConvert ccColor3BToColor3B: color]);
}

-(GLubyte) opacity
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return label->getOpacity();
}

-(GLubyte) displayedOpacity
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return label->getDisplayedOpacity();
}

/** Override synthesized setOpacity to recurse items */
- (void) setOpacity:(GLubyte)opacity
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setOpacity(opacity);
}

-(void) setOpacityModifyRGB:(BOOL)modify
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setOpacityModifyRGB(modify);
}

-(BOOL) doesOpacityModifyRGB
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return label->isOpacityModifyRGB();
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->updateDisplayedOpacity(parentOpacity);
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->updateDisplayedColor([ccTypeConvert ccColor3BToColor3B: parentColor]);
}

#pragma mark Label - AnchorPoint
-(void) setAnchorPoint:(CGPoint)point
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setAnchorPoint([ccTypeConvert CGPointToPoint: point]);
}

#pragma mark Label - Alignment
- (void)setWidth:(float)width
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setWidth(width);
}

#pragma mark Label - FntFile
- (void) setFntFile:(NSString*) fntFile
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    label->setBMFontFilePath([fntFile UTF8String]);
}

- (NSString*) fntFile
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    return [NSString stringWithCString: label->getBMFontFilePath().c_str() encoding:NSUTF8StringEncoding];
}

#pragma mark Label - Debug draw
#if CC_Label_DEBUG_DRAW
-(void) draw
{
    cocos2d::Label* label = static_cast<cocos2d::Label*>(impl_);
    
    // TODO: different param for debug draw.
    NSAssert(NO, @"[cocos2d::Label]::different param for debug draw.");
    
    // atlas->draw(renderer, transform, flags);
}
#endif // CC_Label_DEBUG_DRAW
@end



